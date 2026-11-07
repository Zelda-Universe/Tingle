const fs = require('fs');
const path = require('path');
const vm = require('vm');
const oot = name => require(path.join(__dirname, '../dev/assets/oot', name));

test('age changes retain shared marker pins and deselect age-specific markers',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');
  const start=source.indexOf('ZMap.prototype._reconcileOotMarkerSelection =');
  const end=source.indexOf('\n};',start)+3;
  const pin={markerPos:0};
  const context={ZMap:function(){},newMarker:pin,markers:[{id:'42',mapId:'65000',submapId:'650000',globalMarker:'1'}],
    URL,window:{location:{href:'https://example.test/?marker=42'},history:{state:{},replaceState:jest.fn()}}};
  vm.runInNewContext(source.slice(start,end),context);
  const control={_contentType:'m42',closePage:jest.fn()};
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:control,
    _closeNewMarker:jest.fn(()=>{context.newMarker=null;})});
  map._reconcileOotMarkerSelection('65000','650001');
  expect(context.newMarker).toBe(pin);
  expect(map._closeNewMarker).not.toHaveBeenCalled();
  expect(control.closePage).not.toHaveBeenCalled();
  // An age-only marker whose page is open: closed like the drawer's X, which
  // also collapses the drawer.
  context.markers[0].globalMarker='0';
  map._reconcileOotMarkerSelection('65000','650001');
  expect(control.closePage).toHaveBeenCalledTimes(1);
  // Selected while another page is open: the marker is deselected and
  // dropped from the address, and that page stays.
  control._contentType='category';
  map._reconcileOotMarkerSelection('65000','650001');
  expect(context.newMarker).toBeNull();
  expect(control.closePage).toHaveBeenCalledTimes(1);
  expect(context.window.history.replaceState.mock.calls[0][2]).not.toContain('marker=');
});

test('a map with a kind makes each submap its own layer, with its versioned tiles and thumbnail',()=>{
  const source=fs.readFileSync(__dirname+'/../scripts/zmap.js','utf8');
  const context={ZMap:function(){},L:{
    tileLayer:(url,options)=>({_url:url,options,on(){return this;}}),
    latLng:(lat,lng)=>({lat,lng}),
    latLngBounds:(a,b)=>({south:Math.min(a.lat,b.lat),north:Math.max(a.lat,b.lat),west:Math.min(a.lng,b.lng),east:Math.max(a.lng,b.lng)})
  }};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._tilePyramidBounds ='),source.indexOf('ZMap.prototype.addMarkers =')),context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapOptions:{maxZoom:'6',tileSize:'256',scaleP:'1',scaleN:'-1',offsetX:'0',offsetY:'0'},maps:[],tilesBaseURL:'https://zeldamaps.com/tiles/',tileNameFormat:'{z}_{x}_{y}',
    defaultIconURL:'images/icons/',_addTileBackdrop(){}
  });
  // As get_map serves OoT's Water Temple (abridged).
  const submap=(id,name,tileURL,version)=>({id,name,tileURL,tileExt:'webp',tileVersion:version,maxZoom:'3',regions:[]});
  map.addMap({id:'64031',name:'Water Temple',kind:'dungeon',maxZoom:'3',subMap:[
    submap('640101','1F · Water level 1 · State 0','oot/water-temple-1f-lv1-state00/','abc'),
    submap('640115','B1 · Water level 3','oot/water-temple-b1-lv3/','def')]});
  expect(map.mapOptions.submapLayers).toBe(true);
  expect(map.maps).toHaveLength(2);
  const [first,second]=map.maps;
  expect(first.mapKind).toBe('dungeon');
  expect(first.mapName).toBe('Water Temple');
  expect(first.submapName).toBe('1F · Water level 1');
  expect(second.title).toBe('Water Temple — B1 · Water level 3');
  expect(second._url).toBe('https://zeldamaps.com/tiles/oot/water-temple-b1-lv3/{z}_{x}_{y}.webp?v=def');
  expect(second.options.iconURL).toBe('images/icons/oot/water-temple-b1-lv3/icon.webp?v=def');
  // Tiles are only requested inside the artwork's square.
  const b=first.options.bounds;
  expect([b.south,b.north,b.west,b.east].map(v=>v+0)).toEqual([-256,0,0,256]);
});

test('every OoT tile folder has its texture recorded, a full tile pyramid and a thumbnail',()=>{
  const assets=oot('tile-report.json').assets;
  const folders=fs.readdirSync(path.join(__dirname,'../tiles/oot')).filter(f=>fs.statSync(path.join(__dirname,'../tiles/oot',f)).isDirectory());
  expect(assets.map(a=>a.tileURL).sort()).toEqual(folders.map(f=>'oot/'+f+'/').sort());
  for(const asset of assets) {
    expect(asset.sha256).toMatch(/^[0-9a-f]{64}$/);
    const last=2**asset.maxZoom-1;
    expect(fs.existsSync(path.join(__dirname,'../tiles',asset.tileURL,`${asset.maxZoom}_${last}_${last}.webp`))).toBe(true);
    expect(fs.existsSync(path.join(__dirname,'../images/icons',asset.tileURL,'icon.webp'))).toBe(true);
  }
});

test('game positions convert onto the right area and floor',()=>{
  const {project,projectDungeon,floorName}=oot('game-to-map.cjs');
  const boxes=oot('world-boxes.json').boxes;
  const bounds=oot('scene-data/field-map-bounds.json').maps;
  // The middle of an area's game rectangle lands inside its box on our map.
  for(const scene of ['KakarikoVillage_Child','ZoraRiver_Adult','HyruleField_Child','GoronCity_Adult']) {
    const [[x0,x1],[z0,z1]]=bounds[scene].bounds;
    const at=project(scene,(x0+x1)/2,(z0+z1)/2);
    const [left,top,width,height]=boxes[at.age][at.region];
    expect(at.x*32).toBeGreaterThan(left); expect(at.x*32).toBeLessThan(left+width);
    expect(-at.y*32).toBeGreaterThan(top); expect(-at.y*32).toBeLessThan(top+height);
  }
  // Lake Hylia and Lon Lon Ranch use Hyrule Field's coordinates.
  expect(project('LakeHylia_Child',-200,500).region).toBe('LakeHylia');
  expect(project('LonLonRanch_Adult',-100,250).region).toBe('HyruleField');
  expect([0,1,-1,-3].map(floorName)).toEqual(['1F','2F','B1','B3']);
  // A dungeon's rectangle fills its 2000x1440 floor texture, centred on 2048px.
  const corner=projectDungeon('WaterTemple',0,-155.5,-139.68);
  expect([corner.x,corner.y]).toEqual([24/8,-304/8]);
});

test('every dungeon Gold Skulltula is matched once, and every marked place has a name',()=>{
  const points=oot('scene-data/map-points.json');
  const matches=oot('scene-data/dungeon-skulltula-matches.json').matches;
  const dungeonSkulltulas=new Set(points.filter(p=>p.kind==='CollectSign'&&p.floor!==null).map(p=>p.id));
  expect(matches).toHaveLength(44);
  expect(new Set(matches.map(m=>m.markerId)).size).toBe(44);
  expect(new Set(matches.map(m=>m.gameId))).toEqual(dungeonSkulltulas);
  expect(matches.every(m=>m.reason.length>10)).toBe(true);
  const places=oot('scene-data/facility-names.json').places;
  for(const p of points.filter(p=>p.kind==='Facility'))
    expect(places[p.properties.GameDataHashName||'BossDoor:'+p.scene]).toBeDefined();
  expect(new Set(Object.values(places).map(p=>p.category))).toEqual(new Set(['shop','fairy','minigame','person','boss']));
});
