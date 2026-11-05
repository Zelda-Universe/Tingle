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

ZMap.prototype.areaURLKey = function(area) {
  if(area.mapDestination) return 'map-'+area.mapId;
  return area.areaDestination ? (area.name || '').toLowerCase().replace(/&/g,' and ').replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'') : String(area.id);
};

ZMap.prototype.restoreAreaFromURL = function() {
  var key=new URL(window.location.href).searchParams.get('area');
  if(!key) return false;
  var zmap=this,current=this.mapControl.getCurrentMap();
  var area=this.getAreaSearchEntries().concat(this.getMarkers().filter(function(m) {return m.categoryTypeId==3;}))
    .find(function(a) {return zmap.areaURLKey(a)===key && a.mapId==current.mapId && (a.areaDestination || a.submapId==current.subMapId);});
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
  this.mapControl.changeMap(area.mapId,area.submapId);
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
    var reducedMotion=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    // Leaflet otherwise snaps when fitting a small area from a distant zoom.
    var threshold=map.options.zoomAnimationThreshold;
    map.options.zoomAnimationThreshold=Infinity;
    try {
      map.fitBounds(validBounds,{paddingTopLeft:[left+24,24],paddingBottomRight:[24,bottom+24],animate:!reducedMotion,duration:.25,easeLinearity:.2});
    } finally {map.options.zoomAnimationThreshold=threshold;}
  } else {
    var point=typeof area.getLatLng === 'function' ? area.getLatLng() : L.latLng(Number(area.y),Number(area.x));
    this._setViewAtMarkerInVisibleArea({getLatLng:function(){return point;}},map.getZoom());
  }
  this.updateUrl();
};

ZMap.prototype._getAreaMarkers = function(area,bounds) {
  var zmap=this;
  var labels=this.getMarkers().filter(function(m) {
    return m.categoryTypeId == 3 && m.mapId == area.mapId && m.submapId == area.submapId;
  });
  return this.getMarkers().filter(function(marker) {
    var category=zmap.categories[marker.categoryId];
    if(!category || !category.checked || marker.categoryTypeId == 3 || marker.dbVisible == 0) return false;
    if(marker.mapId != area.mapId || (marker.submapId != area.submapId && !(zmap.mapOptions.shortName==='OoT' && marker.globalMarker == 1))) return false;
    if(area.mapDestination) return true;
    if(bounds) return bounds.contains(marker.getLatLng());
    // Without recorded borders, use the closest named area rather than claiming
    // every POI on the map belongs to this place.
    var closest=null,distance=Infinity;
    labels.forEach(function(label) {
      var d=zmap.map.distance(marker.getLatLng(),label.getLatLng());
      if(d<distance) {closest=label;distance=d;}
    });
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
  var gameName=this.mapOptions.shortName==='OoT' ? 'Ocarina of Time Remake (2026)' : this.mapOptions.name;
  document.title=(area.mapDestination ? area.name : (area.title || area.name)+' - '+mapName)+
    (variant ? ' ('+variant+')' : '')+' - '+gameName+' Map - Zelda Maps';
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
