/* A single destination per dungeon; floor/state switches retain the camera. */
ZMap.prototype.setupOotFloors = function() {
  var zmap = this, panel = document.createElement('div');
  var placeLabels = L.layerGroup().addTo(this.map);
  var labelPane=this.map.getPane('ootPlaceNames') || this.map.createPane('ootPlaceNames');
  labelPane.style.zIndex='625';
  labelPane.style.pointerEvents='none';
  // Lines between area exits: above the map art, below markers and labels.
  var connections = L.layerGroup().addTo(this.map);
  var connectionPane=this.map.getPane('ootConnections') || this.map.createPane('ootConnections');
  connectionPane.style.zIndex='350';
  connectionPane.style.pointerEvents='none';
  this.ootPlaceLabelsVisible = getCookie('showRegionAreaNames') !== 'false';
  this.updateOotPlaceLabels = function() {
    drawConnections();
    placeLabels.clearLayers();
    if(!zmap.ootPlaceLabelsVisible) return;
    var layer=zmap.mapControl.currentMapLayer;
    if(!layer) return;
    (layer.ootPlaceLabels || []).forEach(function(place) {
      var text=document.createElement('span'); text.textContent=place.name;
      L.marker([place.y,place.x],{pane:'ootPlaceNames',interactive:true,keyboard:true,title:place.name,alt:place.name,bubblingMouseEvents:false,
        icon:L.divIcon({className:'oot-place-label',html:text.outerHTML,iconSize:[180,24],iconAnchor:[90,12]}),
        zIndexOffset:0}).on('click',function() {
          var area=zmap.getAreaSearchEntries().find(function(entry) {
            return entry.name===place.name && entry.mapId==layer.originalId;
          });
          if(area) zmap.navigateToArea(area);
        }).addTo(placeLabels);
    });
    layoutPlaceNames();
  };
  // Each end of a link is [area name, u, v]: a spot inside that area's
  // artwork, placed from the area's bounds on this map version, so the lines
  // follow the areas wherever the layout puts them. Routes: d = diagonal
  // first then straight, h = horizontal first, v = vertical first.
  function drawConnections() {
    connections.clearLayers();
    var layer=zmap.mapControl.currentMapLayer;
    if(!layer || !(layer.ootConnections || []).length) return;
    var bounds={};
    (layer.ootPlaceLabels || []).forEach(function(place) { if(place.bounds) bounds[place.name]=place.bounds; });
    var point=function(end) {
      var b=bounds[end[0]];
      if(!b) return null;
      var south=Math.min(b[0][0],b[1][0]),north=Math.max(b[0][0],b[1][0]);
      var west=Math.min(b[0][1],b[1][1]),east=Math.max(b[0][1],b[1][1]);
      return [north-end[2]*(north-south), west+end[1]*(east-west)];
    };
    layer.ootConnections.forEach(function(link) {
      var a=point(link.from),b=point(link.to);
      if(!a || !b) return;
      // Ends within a couple of pixels of level or plumb are meant to be: snap
      // them, so rounding in the artwork's placement can't put a kink in.
      var px=2/Math.pow(2,layer.options.maxNativeZoom || 5); // 2 artwork pixels, in map units
      if(Math.abs(a[0]-b[0])<px) b=[a[0],b[1]];
      if(Math.abs(a[1]-b[1])<px) b=[b[0],a[1]];
      var corner;
      if(link.route==='h') corner=[a[0],b[1]];
      else if(link.route==='v') corner=[b[0],a[1]];
      else {
        var dLat=b[0]-a[0],dLng=b[1]-a[1],step=Math.min(Math.abs(dLat),Math.abs(dLng));
        corner=[a[0]+Math.sign(dLat)*step,a[1]+Math.sign(dLng)*step];
      }
      L.polyline([a,corner,b],{pane:'ootConnections',interactive:false,color:'#fff',weight:1.5,opacity:.45,
        lineJoin:'miter',lineCap:'butt',className:'oot-connection'}).addTo(connections);
      [a,b].forEach(function(end) {
        L.circleMarker(end,{pane:'ootConnections',interactive:false,radius:3,stroke:false,fill:true,
          fillColor:'#fff',fillOpacity:.6,className:'oot-connection-end'}).addTo(connections);
      });
    });
  }
  function layoutPlaceNames() {
    var size=Math.max(11,Math.min(18,11+(zmap.map.getZoom()-1)*1.4));
    var points=zmap.getMarkers().filter(function(marker) {
      return marker.categoryTypeId != 3 && zmap.map.hasLayer(marker);
    }).map(function(marker) {return zmap.map.latLngToContainerPoint(marker.getLatLng());});
    var placed=[];
    placeLabels.eachLayer(function(label) {
      var element=label.getElement(),text=element && element.querySelector('span');
      if(!text) return;
      element.style.fontSize=size+'px';
      var width=text.getBoundingClientRect().width,height=Math.max(16,size*1.2);
      var origin=zmap.map.latLngToContainerPoint(label.getLatLng());
      var best=null;
      [[0,-18],[0,-36],[0,18],[0,36],[-28,-24],[28,-24],[0,0]].forEach(function(offset) {
        var box={left:origin.x+offset[0]-width/2,right:origin.x+offset[0]+width/2,
          top:origin.y+offset[1]-height/2,bottom:origin.y+offset[1]+height/2};
        var collisions=points.filter(function(p) {return p.x>box.left-14 && p.x<box.right+14 && p.y>box.top-14 && p.y<box.bottom+14;}).length;
        collisions+=placed.filter(function(other) {return box.left<other.right+4 && box.right>other.left-4 && box.top<other.bottom+4 && box.bottom>other.top-4;}).length*2;
        var score=collisions*100+Math.hypot(offset[0],offset[1]);
        if(!best || score<best.score) best={score:score,offset:offset,box:box};
      });
      text.style.marginLeft=best.offset[0]+'px';
      text.style.marginTop=best.offset[1]+'px';
      placed.push(best.box);
    });
  }
  panel.className = 'oot-floor-control';
  panel.setAttribute('aria-label','Map age, floors and states');
  document.body.appendChild(panel);
  L.DomEvent.disableClickPropagation(panel);
  L.DomEvent.disableScrollPropagation(panel);
  function choose(layer) {
    var center = zmap.map.getCenter(), zoom = zmap.map.getZoom();
    zmap.mapControl.changeMapOnly(layer.originalId,layer.defaultSubMapId);
    zmap.map.setView(center,zoom,{animate:false});
    zmap.updateUrl();
  }
  function render() {
    if(zmap.applyOotMapBounds) zmap.applyOotMapBounds();
    zmap.updateOotPlaceLabels();
    if(zmap.refreshSelectedAreaVariant) zmap.refreshSelectedAreaVariant();
    var current = zmap.mapControl.currentMapLayer;
    panel.replaceChildren();
    panel.hidden = !current || !/^(world|dungeon)$/.test(current.ootKind);
    if(panel.hidden) return;
    var variants = zmap.maps.filter(function(l) {return l.originalId === current.originalId;});
    function age(layer) { return (layer.ootVariant.match(/\b(Child|Adult)\b/) || [])[1] || null; }
    var ages = Array.from(new Set(variants.map(age).filter(Boolean)));
    var allAgeVariants = variants.slice();
    if(ages.length > 1) {
      var agePill=document.createElement('div'); agePill.className='oot-floor-pill oot-age-pill';
      agePill.setAttribute('aria-label','Age');
      ages.forEach(function(name) {
        var button=document.createElement('button'); button.type='button'; button.textContent=name;
        button.setAttribute('aria-pressed',String(age(current) === name));
        button.onclick=function() {
          var candidates=allAgeVariants.filter(function(v) {return age(v)===name;});
          choose(candidates.find(function(v) {return floor(v)===floor(current);}) || candidates[0]);
        };
        agePill.appendChild(button);
      });
      panel.appendChild(agePill);
      variants=variants.filter(function(v) {return age(v)===age(current);});
    }
    if(current.ootKind === 'world') { position(); return; }
    function floor(layer) {return (layer.ootVariant.match(/(?:^|\s)(B\d+|\d+F)(?:\s|$)/)||[])[1] || layer.ootVariant.split(' · ')[0];}
    var names = Array.from(new Set(variants.map(floor))).sort(function(a,b) {
      function level(v) {return v[0] === 'B' ? -parseInt(v.slice(1)) : parseInt(v);}
      return level(b)-level(a);
    });
    var pill = document.createElement('div'); pill.className='oot-floor-pill oot-dungeon-floors';
    names.forEach(function(name) {
      var button=document.createElement('button'); button.type='button'; button.textContent=name;
      button.setAttribute('aria-pressed',String(floor(current) === name));
      button.onclick=function() {choose(variants.find(function(v) {return floor(v)===name;}));};
      pill.appendChild(button);
    });
    panel.appendChild(pill);
    position();
  }
  function position() {
    if(!panel.isConnected) return;
    if(!zmap.map.getContainer().isConnected) {panel.remove(); observer.disconnect(); return;}
    var bottom=16, mobile=zmap.mapControl.viewStyleBottomSlide;
    var anchor=mobile ? zmap.mapControl.getContainer() : document.querySelector('.leaflet-control-zoom');
    if(anchor) bottom=Math.max(bottom,innerHeight-anchor.getBoundingClientRect().top+12);
    var ad=document.getElementById('ads');
    if(ad && getComputedStyle(ad).display!=='none' && Number(getComputedStyle(ad).opacity)>.1 && ad.offsetHeight)
      bottom=Math.max(bottom,innerHeight-ad.getBoundingClientRect().top+12);
    panel.style.bottom=bottom+'px';
  }
  var observer=new MutationObserver(position);
  observer.observe(zmap.mapControl.getContainer(),{attributes:true,attributeFilter:['style','class']});
  zmap.map.on('baselayerchange',render);
  zmap.map.on('zoomend moveend',layoutPlaceNames);
  window.addEventListener('resize',position);
  render();
};
