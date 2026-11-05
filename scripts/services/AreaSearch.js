// Area destinations share search with POIs, but navigate without creating a pin.
ZMap.prototype.getAreaSearchEntries = function() {
  var entries=[], seen=Object.create(null), current=this.mapControl.getCurrentMap();
  this.maps.forEach(function(layer) {
    var mapKey='map:'+layer.originalId;
    var mapEntry={id:'map-'+layer.originalId,name:layer.ootGroupName || layer.title,description:'Map',
      areaDestination:true,mapDestination:true,mapId:layer.originalId,submapId:layer.defaultSubMapId,
      x:Number(this.mapOptions.centerX),y:Number(this.mapOptions.centerY),
      iconURL:layer.options.iconURL,variant:layer.ootVariant || '',markerCategoryTypeId:3};
    if(seen[mapKey]===undefined) {seen[mapKey]=entries.length;entries.push(mapEntry);}
    else if(layer.defaultSubMapId==current.subMapId) entries[seen[mapKey]]=mapEntry;
    (layer.ootPlaceLabels || []).forEach(function(place,index) {
      var key=layer.originalId+':'+place.name;
      var entry={id:'area-'+layer.originalId+'-'+encodeURIComponent(place.name), name:place.name,description:place.description || '',
        mapId:layer.originalId,submapId:layer.defaultSubMapId,x:place.x,y:place.y,
        markerCategoryTypeId:3,areaDestination:true,bounds:place.bounds,variant:layer.ootVariant};
      if(seen[key] !== undefined) {
        if(layer.defaultSubMapId == current.subMapId) entries[seen[key]]=entry;
      } else {seen[key]=entries.length;entries.push(entry);}
    });
  },this);
  return entries;
};

// Matches lib/common/seo.php: apostrophes are dropped ("zoras-river").
// legacy gives the old form ("zora-s-river"), which links may still use.
ZMap.prototype.areaURLKey = function(area, legacy) {
  if(area.mapDestination) return 'map-'+area.mapId;
  if(!area.areaDestination) return String(area.id);
  var name=(area.name || '').toLowerCase();
  if(!legacy) name=name.replace(/['\u2019]/g,'');
  return name.replace(/&/g,' and ').replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'');
};

ZMap.prototype.restoreAreaFromURL = function() {
  var key=new URL(window.location.href).searchParams.get('area');
  if(!key) return false;
  var zmap=this,current=this.mapControl.getCurrentMap();
  var area=this.getAreaSearchEntries().concat(this.getMarkers().filter(function(m) {return m.categoryTypeId==3;}))
    .find(function(a) {return (zmap.areaURLKey(a)===key || zmap.areaURLKey(a,true)===key) && a.mapId==current.mapId && (a.areaDestination || a.submapId==current.subMapId);});
  if(!area) return false;
  var bounds=area.bounds;
  try {bounds=bounds ? L.latLngBounds(bounds) : null;} catch(e) {bounds=null;}
  this.mapControl._restoringInitialPage=true;
  try {this._showAreaPage(area,bounds); if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerDefaultPartial();}
  finally {this.mapControl._restoringInitialPage=false;}
  return true;
};

ZMap.prototype.navigateToArea = function(area) {
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
  var nearest=null,distance=Infinity;
  labels.forEach(function(label) {
    var at=label.getLatLng(),d=Math.hypot(at.lat-point.lat,at.lng-point.lng);
    if(d<distance) {nearest=label;distance=d;}
  });
  return nearest;
};

ZMap.prototype._getAreaMarkers = function(area,bounds) {
  var zmap=this;
  return this.getMarkers().filter(function(marker) {
    var category=zmap.categories[marker.categoryId];
    if(!category || !category.checked || marker.categoryTypeId == 3 || marker.dbVisible == 0) return false;
    if(marker.mapId != area.mapId || (marker.submapId != area.submapId && !(zmap.mapOptions.shortName==='OoT' && marker.globalMarker == 1))) return false;
    if(area.mapDestination) return true;
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
  var variant=area.variant || (activeLayer && activeLayer.ootVariant);
  var mapName=(activeLayer && (activeLayer.ootGroupName || activeLayer.title)) || '';
  if(this.mapOptions.shortName==='OoT') {
    // Same as the server's title: one page per area or dungeon, any age or floor.
    document.title=(area.title || area.name)+' Map - Ocarina of Time (2026) - Zelda Maps';
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
  Object.keys(groups).sort(function(a,b) {
    if(zmap.mapOptions.shortName !== 'OoT') return 0;
    var order=['64002','64001','64003'];
    return order.indexOf(a)-order.indexOf(b);
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
  var next=this.getAreaSearchEntries().find(function(area) {
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
  // The import names some areas itself (Lon Lon Ranch sits inside Hyrule
  // Field's artwork, with no borders of its own); that name wins.
  var gameData=marker.gameData;
  if(typeof gameData === 'string') {try {gameData=JSON.parse(gameData);} catch(e) {gameData=null;}}
  if(gameData && gameData.areaName) return cache[key]=gameData.areaName;
  var layers=this.maps.filter(function(layer) {return layer.originalId==marker.mapId;});
  var own=layers.filter(function(layer) {return layer.defaultSubMapId==marker.submapId;});
  var places=((own.length ? own : layers)[0] || {}).ootPlaceLabels || [];
  var lat=Number(marker._latlng ? marker._latlng.lat : marker.y), lng=Number(marker._latlng ? marker._latlng.lng : marker.x);
  if(!places.length || !Number.isFinite(lat) || !Number.isFinite(lng)) return cache[key]=null;
  var best=null,bestSize=Infinity,nearest=null,nearestDistance=Infinity;
  places.forEach(function(place) {
    var b=place.bounds;
    if(b && lat>=Math.min(b[0][0],b[1][0]) && lat<=Math.max(b[0][0],b[1][0]) &&
        lng>=Math.min(b[0][1],b[1][1]) && lng<=Math.max(b[0][1],b[1][1])) {
      var size=Math.abs((b[1][0]-b[0][0])*(b[1][1]-b[0][1]));
      if(size<bestSize) {best=place;bestSize=size;}
    }
    var d=Math.hypot(Number(place.y)-lat,Number(place.x)-lng);
    if(d<nearestDistance) {nearest=place;nearestDistance=d;}
  });
  return cache[key]=(best || nearest).name;
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
