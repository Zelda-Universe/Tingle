// Area destinations share search with POIs, but navigate without creating a pin.
ZMap.prototype.getAreaSearchEntries = function() {
  var entries=[], seen=Object.create(null), current=this.mapControl.getCurrentMap();
  this._attachAreaBorders();
  this.maps.forEach(function(layer) {
    var mapKey='map:'+layer.originalId;
    var mapEntry={id:'map-'+layer.originalId,name:layer.mapName || layer.title,description:'Map',
      areaDestination:true,mapDestination:true,mapId:layer.originalId,submapId:layer.defaultSubMapId,
      x:Number(this.mapOptions.centerX),y:Number(this.mapOptions.centerY),
      iconURL:layer.options.iconURL,variant:layer.submapName || '',markerCategoryTypeId:3};
    if(seen[mapKey]===undefined) {seen[mapKey]=entries.length;entries.push(mapEntry);}
    else if(layer.defaultSubMapId==current.subMapId) entries[seen[mapKey]]=mapEntry;
    // Named regions with borders (tower regions, and named areas without a
    // place name of their own on the map): one page each. Areas that have one
    // use its page (_attachAreaBorders).
    this._layerRegions(layer).forEach(function(region) {
      if(region.label) return;
      var key=layer.originalId+':'+region.name;
      if(seen[key] !== undefined) return;
      seen[key]=entries.length;
      entries.push({id:'area-'+layer.originalId+'-'+encodeURIComponent(region.name),name:region.name,description:'',
        mapId:layer.originalId,submapId:region.submapId,x:region.x,y:region.y,
        markerCategoryTypeId:3,areaDestination:true,bounds:region.bounds,region:region});
    });
  },this);
  return entries;
};

// Matches lib/common/seo.php: apostrophes are dropped ("zoras-river").
// legacy gives the old form ("zora-s-river"), which links may still use.
ZMap.prototype.areaURLKey = function(area, legacy) {
  if(area.mapDestination) return 'map-'+area.mapId;
  // Area names (OoT's places, BotW's and TotK's areas) are addressed by
  // their name, like the other area pages; other labels by their ID.
  var tier=area.categoryId && this.categories && this.categories[area.categoryId];
  if(!area.areaDestination && !area.region && !(tier && tier.name === 'Area Labels')) return String(area.id);
  var name=(area.name || area.title || '').toLowerCase();
  if(!legacy) name=name.replace(/['\u2019]/g,'');
  return name.replace(/&/g,' and ').replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'');
};

ZMap.prototype.restoreAreaFromURL = function() {
  var key=new URL(window.location.href).searchParams.get('area');
  if(!key) return false;
  var zmap=this,current=this.mapControl.getCurrentMap();
  this._attachAreaBorders();
  var area=this.getAreaSearchEntries().concat(this.getMarkers().filter(function(m) {return m.categoryTypeId==3;}))
    .find(function(a) {
      // Its ID too, which a place name with a border was addressed by before.
      var matches=zmap.areaURLKey(a)===key || zmap.areaURLKey(a,true)===key || (a.categoryTypeId==3 && String(a.id)===key);
      return matches && a.mapId==current.mapId && (a.areaDestination || a.submapId==current.subMapId);
    });
  if(!area) return false;
  var bounds=area.bounds;
  try {bounds=bounds ? L.latLngBounds(bounds) : null;} catch(e) {bounds=null;}
  this.mapControl._restoringInitialPage=true;
  try {this._showAreaPage(area,bounds); if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerDefaultPartial();}
  finally {this.mapControl._restoringInitialPage=false;}
  return true;
};

ZMap.prototype.navigateToArea = function(area) {
  this._attachAreaBorders();
  if(area.areaDestination) {
    var active=this.mapControl.getCurrentMap();
    var matching=this.getAreaSearchEntries().find(function(entry) {return entry.name===area.name && entry.mapId==area.mapId;});
    if(matching && matching.submapId==active.subMapId) area=matching;
  }
  this._closeNewMarker();
  this._rememberAreaReturnView(area);
  // changeMapOnly swaps the map layer directly; changeMap goes through the old
  // layer form, which only OoT's asset preview bypasses.
  this.mapControl.changeMapOnly(area.mapId,area.submapId);
  var gameData=area.gameData;
  if(typeof gameData === 'string') {try {gameData=JSON.parse(gameData);} catch(e) {gameData=null;}}
  var bounds=area.bounds || (gameData && gameData.bounds);
  if(typeof bounds === 'string') {try {bounds=JSON.parse(bounds);} catch(e) {bounds=null;}}
  var map=this.map,control=this.mapControl;
  // Closing search first also gives fitBounds the final visible map rectangle.
  if(control.headerBar) control.headerBar.hideMobileSearchResults();
  var validBounds=null;
  try { if(bounds && L.latLngBounds(bounds).isValid()) validBounds=L.latLngBounds(bounds); } catch(e) {}
  this._showAreaPage(area,validBounds);
  if(control.viewStyleBottomSlide) control.openDrawerSmall(true);
  if(validBounds) {
    var rect=map.getContainer().getBoundingClientRect(), drawer=control.getContainer().getBoundingClientRect();
    var left=0,bottom=0;
    if(control.viewStyleBottomSlide) {
      var targetTop=(Number.isFinite(control._mobileDrawerBaseTop) ? control._mobileDrawerBaseTop : 0)+control.options.softOpenTo;
      bottom=Math.max(0,Math.min(rect.height-64,rect.bottom-targetTop));
    }
    else if(drawer.width && window.getComputedStyle(control.getContainer()).display !== 'none') left=Math.max(0,drawer.right-rect.left);
    // Keep the area clear of the ad banner when one is showing: on desktop it
    // sits at the bottom of the map; on phones it rides just above the drawer,
    // and fades out while the drawer is raised above its resting height
    // (#ads.ads-lifted), which opening an area usually does.
    var ads=document.getElementById('ads');
    if(ads && ads.firstChild && ads.offsetHeight && window.getComputedStyle(ads).display !== 'none') {
      if(control.viewStyleBottomSlide) {
        var lifted=targetTop < control._startPosition-1;
        if(!lifted) bottom=Math.min(rect.height-64,bottom+ads.offsetHeight+(typeof AD_GAP === 'number' ? AD_GAP : 8));
      } else {
        var ad=ads.getBoundingClientRect();
        if(ad.top<rect.bottom && ad.bottom>rect.top) bottom=Math.max(bottom,Math.min(rect.height-64,rect.bottom-ad.top));
      }
    }
    var reducedMotion=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    // Leaflet otherwise snaps when fitting a small area from a distant zoom.
    var threshold=map.options.zoomAnimationThreshold;
    map.options.zoomAnimationThreshold=Infinity;
    var fitOptions={paddingTopLeft:[left+24,24],paddingBottomRight:[24,bottom+24],animate:!reducedMotion,duration:.25,easeLinearity:.2};
    var arrival=map._getBoundsCenterZoom ? map._getBoundsCenterZoom(validBounds,fitOptions) : null;
    try {
      map.fitBounds(validBounds,fitOptions);
    } finally {map.options.zoomAnimationThreshold=threshold;}
  } else {
    var point=typeof area.getLatLng === 'function' ? area.getLatLng() : L.latLng(Number(area.y),Number(area.x));
    this._setViewAtMarkerInVisibleArea({getLatLng:function(){return point;}},map.getZoom());
  }
  // Where the map lands: closing the area restores the earlier view only if
  // the map is still here.
  if(this._areaReturnView) this._areaReturnView.arrived=arrival || {center:map.getCenter(),zoom:map.getZoom()};
  this.updateUrl();
};

// The label nearest a marker on its own map, among labels of one category
// (one level: Region, Area, Places...) or of any category. Games without
// area outlines (all but OoT) decide which area a POI is in this way.
ZMap.prototype.nearestLabel = function(marker, categoryId) {
  var cache=this._labelsByLevel || (this._labelsByLevel=Object.create(null));
  var key=marker.mapId+':'+marker.submapId+':'+(categoryId || '*');
  var labels=cache[key] || (cache[key]=this.getMarkers().filter(function(m) {
    return m.categoryTypeId == 3 && m.mapId == marker.mapId && m.submapId == marker.submapId &&
      (!categoryId || m.categoryId == categoryId);
  }));
  var point=typeof marker.getLatLng === 'function' ? marker.getLatLng() : marker._latlng;
  if(!point) return null;
  // A label with a border (its area, from map_region) claims what's inside
  // it, the smallest where they nest; otherwise the nearest label does.
  this._attachAreaBorders();
  var zmap=this,inside=null;
  labels.forEach(function(label) {
    if(label.region && (!inside || label.region.size<inside.region.size) &&
        zmap._regionContains(label.region,point.lat,point.lng)) inside=label;
  });
  if(inside) return inside;
  var nearest=null,distance=Infinity;
  labels.forEach(function(label) {
    var at=label.getLatLng(),d=Math.hypot(at.lat-point.lat,at.lng-point.lng);
    if(d<distance) {nearest=label;distance=d;}
  });
  return nearest;
};

ZMap.prototype._getAreaMarkers = function(area,bounds) {
  var zmap=this;
  this._attachAreaBorders();
  return this.getMarkers().filter(function(marker) {
    var category=zmap.categories[marker.categoryId];
    if(!category || !category.checked || marker.categoryTypeId == 3 || marker.dbVisible == 0) return false;
    // A global marker shows on every submap of its map (OoT's both-age ones).
    if(marker.mapId != area.mapId || (marker.submapId != area.submapId && marker.globalMarker != 1)) return false;
    if(area.mapDestination) return true;
    // A marker that names its own area (OoT's Lon Lon Ranch markers) is in it.
    if(zmap._markerOwnAreaName(marker)===(area.title || area.name)) return true;
    if(area.region) {
      var at=marker.getLatLng();
      return zmap._regionContains(area.region,at.lat,at.lng);
    }
    if(bounds) return bounds.contains(marker.getLatLng());
    // Without recorded borders, a POI belongs to the nearest label of the
    // same level, so a region claims more than a single place does.
    var closest=zmap.nearestLabel(marker,area.categoryId);
    return closest && closest.id == area.id;
  });
};

ZMap.prototype._showAreaPage = function(area,bounds) {
  var zmap=this, control=this.mapControl;
  this.selectedArea=area;
  this.selectedAreaBounds=bounds;
  var page=$('<div class="area-detail-page"><h2 class="popupTitle"></h2><div class="area-description"></div><div class="area-marker-groups"></div></div>');
  page.find('h2').text(area.title || area.name);
  var activeLayer=control.currentMapLayer;
  var variant=area.variant || (activeLayer && activeLayer.submapName);
  var mapName=(activeLayer && (activeLayer.mapName || activeLayer.title)) || '';
  if(isOcarina(this.mapOptions.shortName)) {
    // Same as the server's title: one page per area or dungeon, any age or floor.
    document.title=(area.title || area.name)+' Map - Ocarina of Time Remake - Zelda Maps';
  } else {
    document.title=(area.mapDestination ? area.name : (area.title || area.name)+' - '+mapName)+
      (variant ? ' ('+variant+')' : '')+' - '+this.mapOptions.name+' Map - Zelda Maps';
  }
  var pills=$('<div class="area-header-pills"></div>').insertAfter(page.find('h2'));
  if(variant) pills.append($('<p class="area-variant-pill marker-coordinate-pill"></p>').text(variant));
  var description=area.description;
  if(area.mapDestination && description==='Map') description='Explore '+area.name+' and browse its points of interest by category.';
  page.find('.area-description').text(description || '').toggle(!!description);
  var groups=Object.create(null);
  var areaMarkers=this._getAreaMarkers(area,bounds);
  function completed(marker) {return marker.complete === true || marker.complete == 1;}
  if(areaMarkers.length) {
    pills.append(document.createTextNode(' '));
    pills.append($('<p class="area-completion-pill marker-coordinate-pill"></p>').text(
      areaMarkers.filter(completed).length+'/'+areaMarkers.length+' Complete'));
  }
  areaMarkers.forEach(function(marker) {
    (groups[marker.categoryId] || (groups[marker.categoryId]=[])).push(marker);
  });
  var content=page.find('.area-marker-groups');
  // In the order of the category list, as drawn (grouped or not).
  var listOrder=this._categoryListOrder();
  var position=function(id) {return id in listOrder ? listOrder[id] : Infinity;};
  Object.keys(groups).sort(function(a,b) {
    return position(a)-position(b);
  }).forEach(function(id) {
    var group=$('<section class="poi-category-groups"><div class="poi-category-heading"><h3 class="area-category-title"></h3></div><ul class="marker-list"></ul></section>');
    group.attr('data-category-id',id);
    group.find('h3').text(zmap.categories[id].name+' ('+groups[id].filter(completed).length+'/'+groups[id].length+' Complete)');
    groups[id].sort(function(a,b) {return (a.title || a.name || '').localeCompare(b.title || b.name || '');}).forEach(function(marker) {
      var entry=new MarkerListEntry(marker,{categories:zmap.categories,onClick:function() {
        control.returnNextPageTo({area:area,bounds:bounds});
        zmap.goTo({marker:marker.id,panTo:false},true);
        if(control.viewStyleBottomSlide) control.openDrawerDefaultPartial();
      }});
      entry.domNode.addClass('search-marker-list-entry area-marker-list-entry');
      if(marker.complete === true || marker.complete == 1) {
        entry.domNode.addClass('area-marker-completed');
        entry.iconNode.append('<span class="area-marker-check" aria-label="Completed"><i class="fas fa-check" aria-hidden="true"></i></span>');
      }
      group.find('ul').append(entry.domNode);
    });
    content.append(group);
  });
  // Direct children are the same structure used by POIs. This enables the
  // shared scrolling title and coordinate-pill compact header.
  control.setContent(page.contents(),'area-'+area.id+'-variant-'+area.submapId);
  var wrapper=control._contents.querySelector('.menu-cat-content-inner');
  if(wrapper) wrapper.classList.add('area-detail-page');
  this.updateRegionBorders();
};

ZMap.prototype.updateAreaCompletionCounts = function() {
  var control=this.mapControl,zmap=this;
  if(!control || !this.selectedArea || !/^area-/.test(control.getContentType() || '')) return;
  var markers=this._getAreaMarkers(this.selectedArea,this.selectedAreaBounds);
  function count(rows) {return rows.filter(function(m) {return m.complete === true || m.complete == 1;}).length+'/'+rows.length+' Complete';}
  $(control._contents).find('.area-completion-pill').text(count(markers));
  $(control._contents).find('section[data-category-id]').each(function() {
    var id=this.getAttribute('data-category-id');
    $(this).find('h3').text(zmap.categories[id].name+' ('+count(markers.filter(function(m) {return m.categoryId==id;}))+')');
  });
};

ZMap.prototype.refreshSelectedAreaVariant = function() {
  var control=this.mapControl,selected=this.selectedArea;
  if(!selected || !/^area-/.test(control.getContentType() || '')) return;
  var zmap=this,current=control.getCurrentMap(),key=this.areaURLKey(selected);
  // A place name's page is its label marker's: on another age or floor, the
  // same place has a label marker of its own (OoT's Child and Adult names).
  var labels=(this.getMarkers ? this.getMarkers() : []).filter(function(marker) {return marker && marker.categoryTypeId == 3;});
  var next=this.getAreaSearchEntries().concat(labels).find(function(area) {
    return area.mapId==current.mapId && area.submapId==current.subMapId && zmap.areaURLKey(area)===key;
  });
  if(!next) {this.selectedArea=null;control.resetContent();return;}
  if(next.submapId==selected.submapId) return;
  var bounds=next.bounds ? L.latLngBounds(next.bounds) : null;
  var skipSlide=control._skipNextSlide;
  control._skipNextSlide=true;
  try {this._showAreaPage(next,bounds);} finally {control._skipNextSlide=skipSlide;}
  this.updateUrl();
};

// The named area a marker is in: the smallest area whose borders contain it,
// else the nearest area on that map. Null on maps without named areas.
ZMap.prototype.getMarkerAreaName = function(marker) {
  var cache=this._markerAreaNames || (this._markerAreaNames=Object.create(null));
  var key=marker.mapId+':'+marker.submapId+':'+marker.id;
  if(key in cache) return cache[key];
  // The marker's own area name wins (OoT's Lon Lon Ranch sits inside Hyrule
  // Field's artwork, with no border of its own); then the region it's in;
  // then a named area that has a page of its own (TotK's Sky and Depths).
  var own=this._markerOwnAreaName(marker);
  if(own) return cache[key]=own;
  this._attachAreaBorders();
  var region=this.getMarkerRegion(marker);
  if(region) return cache[key]=region.name;
  var area=this.getMarkerRegion(marker,'area');
  return cache[key]=area && !area.label ? area.name : null;
};

// The area a marker names itself in its game data, or null.
ZMap.prototype._markerOwnAreaName = function(marker) {
  var gameData=marker.gameData;
  if(typeof gameData === 'string') {try {gameData=JSON.parse(gameData);} catch(e) {gameData=null;}}
  return (gameData && gameData.areaName) || null;
};

// Closing an area puts the map back where it was before the area was opened,
// as long as the map hasn't been panned or zoomed since it zoomed to the
// area. Hopping straight from one area to another keeps the first "before"
// view. Opening a whole map (a dungeon) or changing map or age isn't undone.
ZMap.prototype._rememberAreaReturnView = function(area) {
  var current=this.mapControl.getCurrentMap();
  if(area.mapDestination || area.mapId != current.mapId) { this._areaReturnView=null; return; }
  if(this._areaReturnView && /^area-/.test(this.mapControl.getContentType() || '')) {
    this._areaReturnView.arrived=null; // still returns to the view before the first area
    return;
  }
  this._areaReturnView={mapId:current.mapId,subMapId:current.subMapId,
    center:this.map.getCenter(),zoom:this.map.getZoom(),arrived:null};
};

// Called as the area page closes. Returns true when it moved the map back.
ZMap.prototype.restoreAreaReturnView = function() {
  var view=this._areaReturnView,map=this.map;
  this._areaReturnView=null;
  if(!view || !view.arrived) return false;
  var current=this.mapControl.getCurrentMap();
  if(current.mapId != view.mapId || current.subMapId != view.subMapId) return false;
  var moved=map.latLngToContainerPoint(map.getCenter()).distanceTo(map.latLngToContainerPoint(view.arrived.center));
  if(Math.abs(map.getZoom()-view.arrived.zoom)>0.01 || moved>2) return false;
  var reducedMotion=window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var threshold=map.options.zoomAnimationThreshold;
  map.options.zoomAnimationThreshold=Infinity;
  try { map.setView(view.center,view.zoom,{animate:!reducedMotion,duration:.25,easeLinearity:.2}); }
  finally { map.options.zoomAnimationThreshold=threshold; }
  return true;
};

// Named regions with borders, from get_map (BotW's tower regions, from the
// game's MapTower data). Each region's polygon is a GeoJSON MultiPolygon in
// map units ([x, y]); here it becomes Leaflet's [lat, lng] rings, with the
// box around it and that box's centre. Built once per layer.
ZMap.prototype._layerRegions = function(layer) {
  if(!layer || !layer.submapRegions) return [];
  if(layer._regions) return layer._regions;
  var regions=[];
  layer.submapRegions.forEach(function(entry) {
    entry.regions.forEach(function(region) {
      var polygon=region.polygon;
      if(!polygon || polygon.type !== 'MultiPolygon' || !Array.isArray(polygon.coordinates)) return;
      var south=Infinity,west=Infinity,north=-Infinity,east=-Infinity,size=0;
      var rings=polygon.coordinates.map(function(rings) {
        return rings.map(function(ring,index) {
          var points=ring.map(function(point) {return [Number(point[1]),Number(point[0])];});
          // Shoelace area of each outer ring, to rank nested regions by size.
          var twice=0;
          points.forEach(function(point,i) {
            var next=points[(i+1)%points.length];
            twice+=point[1]*next[0]-next[1]*point[0];
            if(index === 0) {
              south=Math.min(south,point[0]); north=Math.max(north,point[0]);
              west=Math.min(west,point[1]); east=Math.max(east,point[1]);
            }
          });
          if(index === 0) size+=Math.abs(twice)/2;
          return points;
        });
      });
      if(!Number.isFinite(south)) return;
      regions.push({name:region.name,shortName:region.shortName || region.name,kind:region.kind || 'tower',submapId:entry.submapId,rings:rings,size:size,
        bounds:[[south,west],[north,east]],x:(west+east)/2,y:(south+north)/2});
    });
  });
  return layer._regions=regions;
};

// Whether a point is inside a region: even-odd across each polygon's rings,
// so holes count as outside.
ZMap.prototype._regionContains = function(region,lat,lng) {
  return region.rings.some(function(polygon) {
    var inside=false;
    polygon.forEach(function(ring) {
      for(var i=0,j=ring.length-1;i<ring.length;j=i++) {
        var yi=ring[i][0],xi=ring[i][1],yj=ring[j][0],xj=ring[j][1];
        if((yi>lat) !== (yj>lat) && lng<(xj-xi)*(lat-yi)/(yj-yi)+xi) inside=!inside;
      }
    });
    return inside;
  });
};

// The smallest region of a kind ('tower' regions by default, or named
// 'area's) on a map layer's submap that contains a point, or null.
ZMap.prototype.regionAt = function(layer,submapId,lat,lng,kind) {
  var best=null;
  kind=kind || 'tower';
  this._layerRegions(layer).forEach(function(region) {
    if(region.kind !== kind || region.submapId != submapId || (best && region.size >= best.size)) return;
    var b=region.bounds;
    if(lat<b[0][0] || lat>b[1][0] || lng<b[0][1] || lng>b[1][1]) return;
    if(this._regionContains(region,lat,lng)) best=region;
  },this);
  return best;
};

// The game's named areas with borders (BotW's 23, TotK's on each layer) give
// their border to the "Area Labels" place name of the same name on that map,
// so that name's page lists exactly the markers inside it, and outlines it.
// Areas without such a name (TotK's Sky and Depths) get pages of their own.
ZMap.prototype._attachAreaBorders = function() {
  var markers=this.getMarkers();
  if(this._areaBordersFor === markers.length) return;
  this._areaBordersFor=markers.length;
  var zmap=this,labels=Object.create(null);
  markers.forEach(function(label) {
    var category=label.categoryTypeId == 3 && zmap.categories[label.categoryId];
    if(category && category.name === 'Area Labels') labels[label.submapId+':'+(label.title || label.name)]=label;
  });
  (this.maps || []).forEach(function(layer) {
    this._layerRegions(layer).forEach(function(region) {
      if(region.kind !== 'area') return;
      var label=labels[region.submapId+':'+region.name] || labels[region.submapId+':'+region.shortName];
      region.label=label || null;
      if(label) {label.region=region; label.bounds=region.bounds;}
    });
  },this);
};

// Region borders on the map: the open region's, and every region's when
// "Show Region Borders" is on in Settings. Redrawn when the page or map
// changes.
ZMap.prototype.updateRegionBorders = function() {
  var map=this.map,control=this.mapControl;
  if(!map || !control) return;
  if(!this._regionBorders) {
    var pane=map.getPane('regionBorders') || map.createPane('regionBorders');
    pane.style.zIndex='360'; // over the map art, under markers and labels
    pane.style.pointerEvents='none';
    this._regionBorders=L.layerGroup().addTo(map);
    var redraw=this.updateRegionBorders.bind(this);
    control.addHandler('afterSetContent',redraw);
    control.addHandler('afterResetContent',redraw);
    map.on('baselayerchange',redraw);
  }
  this._regionBorders.clearLayers();
  var current=control.getCurrentMap(),layer=control.currentMapLayer;
  // A map pieced together from separate artwork (OoT's Hyrule) already shows
  // each area on its own: no borders, even for an open area page.
  if(layer && layer.mapKind === 'world') return;
  var regions=this._layerRegions(layer).filter(function(region) {return region.submapId==current.subMapId;});
  if(!regions.length) return;
  var open=/^area-/.test(control.getContentType() || '') && this.selectedArea && this.selectedArea.region;
  var showAll=!!this.showRegionBorders;
  regions.forEach(function(region) {
    var selected=!!open && open.name===region.name && open.submapId==region.submapId;
    // "Show Region Borders" shows the tower regions; an area's border shows
    // while its page is open.
    if(!selected && !(showAll && region.kind === 'tower')) return;
    L.polygon(region.rings,{pane:'regionBorders',interactive:false,className:'region-border'+(selected ? ' region-border-selected' : ''),
      color:'#fff',weight:selected ? 2.5 : 1.5,opacity:selected ? .9 : .45,
      fill:selected,fillColor:'#fff',fillOpacity:.06}).addTo(this._regionBorders);
  },this);
};

// The region with borders a marker is in (the smallest, where they nest), or
// null: on maps without regions, or outside them all.
ZMap.prototype.getMarkerRegion = function(marker,kind) {
  // The layer with its submap's regions: a map's only layer, or (OoT, one
  // layer per age or floor) the one for that submap.
  var layers=this.maps.filter(function(layer) {return layer.originalId==marker.mapId && layer.submapRegions;});
  var layer=layers.find(function(layer) {
    return layer.submapRegions.some(function(entry) {return entry.submapId==marker.submapId;});
  }) || layers[0];
  var lat=Number(marker._latlng ? marker._latlng.lat : marker.y), lng=Number(marker._latlng ? marker._latlng.lng : marker.x);
  if(!layer || !Number.isFinite(lat) || !Number.isFinite(lng)) return null;
  return this.regionAt(layer,marker.submapId,lat,lng,kind);
};

// The area pill on a marker's page: {label, title, area}, where area is the
// page it opens (a place name or an entry from getAreaSearchEntries), or null.
// - A marker that names its own area (OoT: "Lost Woods"): that place.
// - A map with tower regions (BotW, TotK): the region it's in, by its short
//   name ("Great Plateau").
// - A map with a kind (OoT): the map itself ("Inside the Deku Tree").
ZMap.prototype.markerAreaLink = function(marker) {
  this._attachAreaBorders();
  var own=this._markerOwnAreaName(marker);
  if(own) {
    // Its place name's page, or a page of that name (OoT's dungeons name
    // themselves: "Inside the Deku Tree" is the dungeon's map page).
    var place=this.getMarkers().find(function(label) {
      return label.categoryTypeId == 3 && label.mapId == marker.mapId && label.submapId == marker.submapId &&
        (label.title || label.name) === own;
    }) || this.getAreaSearchEntries().find(function(entry) {
      return entry.areaDestination && entry.mapId == marker.mapId && entry.name === own;
    }) || null;
    return {label:own,title:own,area:place};
  }
  var entries=this.getAreaSearchEntries();
  var region=this.getMarkerRegion(marker);
  if(region) {
    return {label:region.shortName,title:region.name,area:entries.find(function(entry) {
      return entry.region && entry.region.name===region.name && entry.region.submapId==region.submapId;
    }) || null};
  }
  var layer=this.maps.find(function(layer) {return layer.originalId==marker.mapId && layer.mapKind;});
  if(layer) {
    var name=layer.mapName || layer.title;
    return {label:name,title:name,area:entries.find(function(entry) {
      return entry.mapDestination && entry.mapId==marker.mapId;
    }) || null};
  }
  return null;
};

// The name pills on a marker's page, from the game's label tiers: the
// nearest name of a tier on the marker's map, inside its region where the
// map has them, and within a distance (a fraction of the map's width).
// {label, title, area}, where area is the label marker, whose page it opens;
// null where there's none, or when it repeats a broader pill.
// - 'place': the finer place names ("Hickaly Woods"), within about 6 BotW map
//   units (a fortieth of the map), which 97% of BotW's markers have.
// - 'area': the area names ("West Necluda"), within a tenth of the map.
ZMap.prototype.markerLabelLink = function(marker,level) {
  var zmap=this,pattern=level==='place' ? /^Places Labels/ : /^Area Labels$/;
  // A marker that names its own area has that as its area pill already.
  if(level==='area' && this._markerOwnAreaName(marker)) return null;
  // The game's named area the marker is inside, where the map has them.
  if(level==='area') {
    var border=this.getMarkerRegion(marker,'area');
    if(border) {
      this._attachAreaBorders();
      var region=this.markerAreaLink(marker);
      if(region && region.label.toLowerCase()===border.shortName.toLowerCase()) return null;
      var page=border.label || this.getAreaSearchEntries().find(function(entry) {return entry.region===border;}) || null;
      return {label:border.shortName,title:border.name,area:page};
    }
  }
  var cache=this._pillLabels || (this._pillLabels=Object.create(null));
  var key=level+':'+marker.mapId+':'+marker.submapId;
  var labels=cache[key] || (cache[key]=this.getMarkers().filter(function(label) {
    var category=label.categoryTypeId == 3 && zmap.categories[label.categoryId];
    return category && pattern.test(category.name) && label.mapId == marker.mapId && label.submapId == marker.submapId;
  }));
  if(!labels.length || typeof marker.getLatLng !== 'function') return null;
  var region=this.getMarkerRegion(marker),point=marker.getLatLng();
  var bounds=this._tilePyramidBounds ? this._tilePyramidBounds() : null;
  var span=bounds ? Math.abs(bounds.getEast()-bounds.getWest()) : 256;
  var nearest=null,distance=span/(level==='place' ? 40 : 10);
  labels.forEach(function(label) {
    var at=label.getLatLng(),d=Math.hypot(at.lat-point.lat,at.lng-point.lng);
    if(d<distance && (!region || zmap._regionContains(region,at.lat,at.lng))) {nearest=label;distance=d;}
  });
  if(!nearest) return null;
  var name=String(nearest.title || nearest.name);
  // A name already on a broader pill isn't repeated.
  var broader=[this.markerAreaLink(marker)];
  if(level==='place') broader.push(this.markerLabelLink(marker,'area'));
  if(broader.some(function(link) {return link && link.label.toLowerCase()===name.toLowerCase();})) return null;
  return {label:name,title:name,area:nearest};
};

// Opens the page from one of a marker's pills ('place' or the area). Its page
// has a Back button to the marker.
ZMap.prototype.openMarkerArea = function(markerId,which) {
  var marker=this.cachedMarkersById[markerId];
  var link=marker && (which==='place' || which==='area-name' ? this.markerLabelLink(marker,which==='place' ? 'place' : 'area') : this.markerAreaLink(marker));
  if(!link || !link.area) return;
  this.mapControl.returnNextPageTo({marker:marker.id});
  this.navigateToArea(link.area);
};

// Each category's place in the category list as it's drawn: the games with
// grouped lists (Collectibles, Locations…) reorder the buttons, so this goes
// by where each button sits. {categoryId: index}
ZMap.prototype._categoryListOrder = function() {
  var menu=this.mapControl && this.mapControl._categoryMenu,order={};
  if(!menu || !menu.categoryButtons) return order;
  menu.categoryButtons.map(function(button) {
    return {id:String(button.category.id),node:button.domNode && (button.domNode[0] || button.domNode)};
  }).filter(function(entry) {return entry.node && entry.node.compareDocumentPosition;})
    .sort(function(a,b) {
      return a.node===b.node ? 0 : (a.node.compareDocumentPosition(b.node) & Node.DOCUMENT_POSITION_FOLLOWING ? -1 : 1);
    }).forEach(function(entry,index) {
      if(!(entry.id in order)) order[entry.id]=index;
    });
  return order;
};

// The nearest label of one level (e.g. "Area Labels") that is inside a
// region, so a marker is never named after an area across a region border.
ZMap.prototype.nearestLabelInRegion = function(marker,categoryId,region) {
  var cache=this._labelsByRegion || (this._labelsByRegion=Object.create(null));
  var key=region.submapId+':'+region.name+':'+categoryId,zmap=this;
  var labels=cache[key] || (cache[key]=this.getMarkers().filter(function(label) {
    if(label.categoryTypeId != 3 || label.categoryId != categoryId || label.submapId != region.submapId) return false;
    var at=label.getLatLng();
    return zmap._regionContains(region,at.lat,at.lng);
  }));
  var point=typeof marker.getLatLng === 'function' ? marker.getLatLng() : marker._latlng;
  if(!point) return null;
  var nearest=null,distance=Infinity;
  labels.forEach(function(label) {
    var at=label.getLatLng(),d=Math.hypot(at.lat-point.lat,at.lng-point.lng);
    if(d<distance) {nearest=label;distance=d;}
  });
  return nearest;
};
