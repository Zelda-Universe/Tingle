/* A single destination per dungeon; floor/state switches retain the camera. */
ZMap.prototype.setupOotFloors = function() {
  var zmap = this, panel = document.createElement('div');
  var placeLabels = L.layerGroup().addTo(this.map);
  this.ootPlaceLabelsVisible = getCookie('showRegionAreaNames') !== 'false';
  this.updateOotPlaceLabels = function() {
    placeLabels.clearLayers();
    if(!zmap.ootPlaceLabelsVisible) return;
    var layer=zmap.mapControl.currentMapLayer;
    if(!layer) return;
    (layer.ootPlaceLabels || []).forEach(function(place) {
      var text=document.createElement('span'); text.textContent=place.name;
      L.marker([place.y,place.x],{interactive:false,keyboard:false,
        icon:L.divIcon({className:'oot-place-label',html:text.outerHTML,iconSize:[180,24],iconAnchor:[90,12]}),
        zIndexOffset:-500}).addTo(placeLabels);
    });
  };
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
    zmap.updateOotPlaceLabels();
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
    var pill = document.createElement('div'); pill.className='oot-floor-pill';
    names.forEach(function(name) {
      var button=document.createElement('button'); button.type='button'; button.textContent=name;
      button.setAttribute('aria-pressed',String(floor(current) === name));
      button.onclick=function() {choose(variants.find(function(v) {return floor(v)===name;}));};
      pill.appendChild(button);
    });
    panel.appendChild(pill);
    var states=variants.filter(function(v) {return floor(v) === floor(current);});
    if(states.length>1) {
      var select=document.createElement('select'); select.setAttribute('aria-label','Dungeon room or water state');
      states.forEach(function(v) {var option=document.createElement('option'); option.value=v.defaultSubMapId;
        option.textContent=v.ootVariant; option.selected=v.id===current.id; select.appendChild(option);});
      select.onchange=function() {choose(states.find(function(v) {return v.defaultSubMapId===select.value;}));};
      panel.appendChild(select);
    }
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
