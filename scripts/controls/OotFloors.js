/* A single destination per dungeon; floor/state switches retain the camera. */
ZMap.prototype.setupOotFloors = function() {
  var zmap = this, panel = document.createElement('div');
  // Lines between area exits: above the map art, below markers and labels.
  var connections = L.layerGroup().addTo(this.map);
  var connectionPane=this.map.getPane('ootConnections') || this.map.createPane('ootConnections');
  connectionPane.style.zIndex='350';
  connectionPane.style.pointerEvents='none';
  // The lines' own SVG reaches 1.5 screens beyond each edge, so a zoom out
  // (which shrinks the drawing until it's redrawn) still fills the screen.
  var connectionRenderer=L.svg({pane:'ootConnections', padding:1.5});
  // Leaflet re-centres the drawing after every pan (moveend) and from then on
  // takes it to be drawn at the current zoom, but only redraws the lines at a
  // new zoom when a zoom ends. A pan in the middle of a pinch would leave
  // them drawn at an older zoom, the wrong size and in the wrong place: so
  // whenever the drawing's zoom isn't the lines' zoom, redraw them.
  var drawnZoom=null, updateDrawing=connectionRenderer._update, projectAll=connectionRenderer._onZoomEnd;
  connectionRenderer._update=function() {
    updateDrawing.call(this);
    if(!this._map || this._map._animatingZoom || this._zoom===drawnZoom) return;
    drawnZoom=this._zoom;
    for(var id in this._layers) this._layers[id]._reset();
  };
  connectionRenderer._onZoomEnd=function() {
    projectAll.call(this);
    drawnZoom=this._map.getZoom();
  };
  // While a zoom is in progress Leaflet scales the lines' SVG with a CSS
  // transform and only redraws it at the end, so the lines and dots would
  // swell and shrink mid-gesture. Track that scale each frame and divide the
  // stroke widths by it (styles/poi.css), so only their positions move.
  var connectionZoomFrame=null;
  var applyConnectionZoom=function() {
    var svg=connectionPane.querySelector('svg');
    var scale=svg ? new DOMMatrixReadOnly(getComputedStyle(svg).transform).a : 1;
    connectionPane.style.setProperty('--oot-zoom-scale', scale>0 ? scale : 1);
  };
  var trackConnectionZoom=function() {
    applyConnectionZoom();
    connectionZoomFrame=window.requestAnimationFrame(trackConnectionZoom);
  };
  // An animated zoom scales the lines with a CSS transition, so only the page
  // knows the scale mid-animation: read it each frame.
  this.map.on('zoomanim', function() {
    if(connectionZoomFrame===null) trackConnectionZoom();
  });
  // Pinching moves the zoom every frame. Redraw the lines at the new zoom
  // after every quarter level (they reach 1.5 screens past each edge, so a
  // drawing stays sharp and covers the screen that long), and in between
  // work the stretch out from the zoom rather than reading it back from the
  // page, which would make the browser recalculate styles every frame.
  this.map.on('zoom', function() {
    var map=zmap.map, zoom=map.getZoom();
    if(connectionZoomFrame!==null || !connectionRenderer._map) return;
    if(Math.abs(zoom-connectionRenderer._zoom)>=0.25) {
      connectionRenderer._update();
      connectionRenderer._updateTransform(map.getCenter(), zoom);
    }
    connectionPane.style.setProperty('--oot-zoom-scale', map.getZoomScale(zoom, connectionRenderer._zoom));
  });
  this.map.on('zoomend', function() {
    if(connectionZoomFrame!==null) window.cancelAnimationFrame(connectionZoomFrame);
    connectionZoomFrame=null;
    connectionPane.style.setProperty('--oot-zoom-scale', 1);
  });
  // Place names are label markers, drawn like every game's (zmap.js); only
  // the connector lines between areas are drawn here.
  this.updateOotConnections = function() { drawConnections(); };
  // Each end of a link is [area name, u, v]: a spot inside that area's
  // artwork, placed from the area's bounds on this map version, so the lines
  // follow the areas wherever the layout puts them. Routes: d = diagonal
  // first then straight, h = horizontal first, v = vertical first.
  function drawConnections() {
    connections.clearLayers();
    var layer=zmap.mapControl.currentMapLayer;
    if(!layer || !(layer.mapConnections || []).length) return;
    // Each area's box, from its border on this map version (map_region).
    var bounds={};
    zmap._layerRegions(layer).forEach(function(region) {
      if(region.kind==='area') bounds[region.connectionKey || region.name]=region.bounds;
    });
    var point=function(end) {
      var b=bounds[end[0]];
      if(!b) return null;
      var south=Math.min(b[0][0],b[1][0]),north=Math.max(b[0][0],b[1][0]);
      var west=Math.min(b[0][1],b[1][1]),east=Math.max(b[0][1],b[1][1]);
      return [north-end[2]*(north-south), west+end[1]*(east-west)];
    };
    layer.mapConnections.forEach(function(link) {
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
      L.polyline([a,corner,b],{pane:'ootConnections',renderer:connectionRenderer,interactive:false,color:'#fff',weight:1.5,opacity:.45,
        lineJoin:'miter',lineCap:'butt',className:'oot-connection'}).addTo(connections);
      [a,b].forEach(function(end) {
        // A dot drawn as a thick stroke round a tiny circle, so its size is
        // a stroke width that can be held steady while zooming.
        L.circleMarker(end,{pane:'ootConnections',renderer:connectionRenderer,interactive:false,radius:.5,stroke:true,weight:5,
          color:'#fff',opacity:.6,fill:false,className:'oot-connection-end'}).addTo(connections);
      });
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
    zmap.updateOotConnections();
    if(zmap.refreshSelectedAreaVariant) zmap.refreshSelectedAreaVariant();
    var current = zmap.mapControl.currentMapLayer;
    panel.replaceChildren();
    panel.hidden = !current || !/^(world|dungeon)$/.test(current.mapKind);
    if(panel.hidden) return;
    var variants = zmap.maps.filter(function(l) {return l.originalId === current.originalId;});
    function age(layer) { return (layer.submapName.match(/\b(Child|Adult)\b/) || [])[1] || null; }
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
    if(current.mapKind === 'world') { position(); return; }
    function floor(layer) {return (layer.submapName.match(/(?:^|\s)(B\d+|\d+F)(?:\s|$)/)||[])[1] || layer.submapName.split(' · ')[0];}
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
  window.addEventListener('resize',position);
  render();
};
