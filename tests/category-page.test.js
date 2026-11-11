const fs=require('fs');
const path=require('path');
const vm=require('vm');
const {execFileSync}=require('child_process');
const source=fs.readFileSync(path.join(__dirname,'../scripts/services/CategoryPage.js'),'utf8');

// A small jQuery-like chain, enough for the page builder.
function fakeJq(selector) {
  const chain={selector,
    find(sel){return fakeJq(sel);},
    text(value){this._text=value===undefined ? this._text||'' : value;return this;},
    toggle(){return this;},
    attr(){return this;},
    on(){return this;},
    addClass(){return this;},
    append(...args){(this._appended=this._appended||[]).push(...args);return this;},
    insertAfter(){return this;},
    each(fn){(this._each||[]).forEach(fn);return this;},
    contents(){return {selector:'contents of '+selector};}
  };
  return chain;
}

function loadCategoryPage(overrides) {
  overrides=overrides||{};
  const windowObj=Object.assign(
    {location:{href:'https://zeldamaps.com/?game=BotW'},history:{state:{},replaceState(){}},zmapLandingCategoryId:null,setTimeout(){return 0;}},
    overrides.window
  );
  const rest=Object.assign({},overrides);
  delete rest.window;
  const created=[]; // Every string handed to the fake jQuery, for assertions.
  const entries=[]; // The fake MarkerListEntry instances the page built.
  const context=Object.assign({
    ZMap:function(){},
    URL,
    window:windowObj,
    document:{title:'',createTextNode:t=>({text:t})},
    seoGameName:()=>'Breath of the Wild',
    created,
    entries,
    MarkerListEntry:function(marker,opts){
      this.marker=marker;this.opts=opts;entries.push(this);
      const self=this;
      const details={append(x){(self._detailsAppended=self._detailsAppended||[]).push(x);return details;}};
      this.domNode={addClass(){},find:sel=>sel==='.details'?details:{append(){return details;}}};
      this.iconNode={append(){}};
    },
    $:sel=>{created.push(sel);return fakeJq(sel);}
  },rest);
  vm.runInNewContext(source,context);
  return context;
}

const section=(id,name)=>({id,name,parent_id:null,marker_category_type_id:'1',visible:true,childrenArr:[]});
const category=(id,name,extra={})=>Object.assign({id,name,parent_id:'10',marker_category_type_id:'1',visible:true,childrenArr:[]},extra);
const marker=(id,categoryId,extra={})=>Object.assign({id,categoryId,categoryTypeId:1,dbVisible:1},extra);

test.each([false,true])('region Zoom preserves the current submap (global marker: %s)', global => {
  const bounds={isValid:()=>true};
  const context=loadCategoryPage({
    L:{latLngBounds:()=>bounds}, isOcarina:()=>true,
    window:{getComputedStyle:()=>({display:'none'}),matchMedia:()=>({matches:false})}
  });
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapOptions:{shortName:'OoTR'},
    map:{options:{},getContainer:()=>({getBoundingClientRect:()=>({bottom:600})}),fitBounds:jest.fn(),getMaxZoom:()=>8},
    mapControl:{getCurrentMap:()=>({mapId:65000,subMapId:650001}),changeMapOnly:jest.fn(),
      getContainer:()=>({getBoundingClientRect:()=>({top:400})})},
    getMarkerRegion:jest.fn(()=>({bounds}))
  });
  const child=marker(1,11,{mapId:65000,submapId:650000,globalMarker:global?1:0});
  const adult=marker(2,11,{mapId:65000,submapId:650001});
  map.zoomToCategoryRegion(global ? [child] : [child,adult]);
  expect(map.mapControl.changeMapOnly).toHaveBeenCalledWith(65000,650001);
  expect(map.getMarkerRegion.mock.calls[0][0].submapId).toBe(650001);
});

test('region Zoom fits named area boundaries, not the marker cluster', () => {
  const rawBounds=[[-256,0],[0,256]], bounds={isValid:()=>true};
  const convert=jest.fn(()=>bounds);
  const context=loadCategoryPage({L:{latLngBounds:convert},isOcarina:()=>true,
    window:{getComputedStyle:()=>({display:'none'}),matchMedia:()=>({matches:false})}});
  const region={name:'Fire Temple',submapId:640061,bounds:rawBounds};
  const layer={originalId:64024,defaultSubMapId:640061};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    maps:[layer],mapOptions:{shortName:'OoTR'},_layerRegions:()=>[region],
    getMarkerRegion:jest.fn(()=>null),
    map:{options:{},getContainer:()=>({getBoundingClientRect:()=>({bottom:600})}),fitBounds:jest.fn(),getMaxZoom:()=>8},
    mapControl:{getCurrentMap:()=>({mapId:64024,subMapId:640061}),changeMapOnly:jest.fn(),getContainer:()=>({getBoundingClientRect:()=>({top:400})})}
  });
  map.mapControl.changeMapOnly.mockImplementation(()=>{
    expect(map._preserveCategoryRegionOrder).toBe(true);
    // A map switch fires the normal sorting hook, but Zoom must leave the
    // section the user scrolled to exactly where it was.
    expect(()=>map.sortCategoryRegionsForCurrentMap()).not.toThrow();
  });
  map.zoomToCategoryRegion([marker(1,11,{mapId:64024,submapId:640061})],'Fire Temple');
  expect(map._preserveCategoryRegionOrder).toBeUndefined();
  expect(convert).toHaveBeenCalledWith(rawBounds);
  expect(map.map.fitBounds).toHaveBeenCalledWith(bounds,expect.any(Object));
  expect(map.getMarkerRegion).not.toHaveBeenCalled();
});

test('category addresses match the server slugs',()=>{
  // The PHP side: seo.php's seoSlug(seoPlainText(name)), as index.php and the
  // sitemap use it.
  const names=['Gold Skulltulas',"Korok Seeds","Dragon's Tears",'A & B','Treasure Chests - Far','NPCs','Side-quests'];
  const script=`require ${JSON.stringify(path.join(__dirname,'../lib/common/seo.php'))};
    $in=json_decode(stream_get_contents(STDIN), true);
    echo json_encode(array_map(function($name) { return seoSlug(seoPlainText($name)); }, $in));`;
  const php=JSON.parse(execFileSync('php',['-r',script],{encoding:'utf8',input:JSON.stringify(names)}));
  const context=loadCategoryPage();
  const map=Object.create(context.ZMap.prototype);
  expect(names.map(name=>map.categoryURLKey({name}))).toEqual(php);
});

test('the page lists the category and its children, not labels or hidden markers',()=>{
  const context=loadCategoryPage();
  const collectibles=section(10,'Collectibles');
  const seeds=category(11,'Korok Seeds');
  const blue=category(12,'Korok Seeds - Blue');
  seeds.childrenArr=[blue];
  const labels=category(13,'Area Labels',{marker_category_type_id:'3'});
  const hiddenCat=category(14,'Hidden',{visible:false});
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    categories:{10:collectibles,11:seeds,12:blue,13:labels,14:hiddenCat},
    getMarkers:()=>[
      marker(1,11),marker(2,12),
      marker(3,11,{dbVisible:0}),
      marker(4,11,{categoryTypeId:3}),
      marker(5,10), // a sibling section's marker
      marker(6,14)  // a hidden category's marker
    ]
  });
  expect(map._getCategoryMarkers(seeds).map(m=>m.id)).toEqual([1,2]);
});

test('page eligibility matches the server: in a group, not a label, with markers',()=>{
  const context=loadCategoryPage();
  const collectibles=section(10,'Collectibles');
  const seeds=category(11,'Korok Seeds');
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    categories:{10:collectibles,11:seeds},
    getMarkers:()=>[marker(1,11)]
  });
  expect(map.categoryHasPage(seeds)).toBe(true);
  expect(map.categoryHasPage(collectibles)).toBe(false); // a section root
  expect(map.categoryHasPage(category(13,'Area Labels',{marker_category_type_id:'3'}))).toBe(false);
  expect(map.categoryHasPage(category(14,'Empty'))).toBe(false); // no markers
  expect(map.categoryHasPage(category(15,'Hidden',{visible:false}))).toBe(false);
});

test('the page is an area-style listing with the server title and an unfocusing Back',()=>{
  const context=loadCategoryPage();
  const seeds=category(11,'Korok Seeds');
  const blue=category(12,'Korok Seeds - Blue');
  seeds.childrenArr=[blue];
  const added=[];
  const control={
    viewStyleBottomSlide:false,
    getCurrentMap:()=>({mapId:19}),
    _contents:{querySelector:()=>({classList:{add:c=>added.push(c)}})},
    setContent:jest.fn(),
    getContentType:()=> 'category'
  };
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    mapOptions:{shortName:'BotW',name:'Breath of the Wild'},
    categories:{11:seeds,12:blue},
    categoriesArr:[seeds,blue],
    getMarkerRegion:m=>({name:m.id===1 ? 'West Necluda' : 'Great Plateau'}),
    getMarkers:()=>[marker(1,11,{title:'Alpha',complete:1,mapId:19}),marker(2,12,{title:'Beta',mapId:64})],
    _categoryListOrder:()=>({11:0,12:1}),
    _closeNewMarker:jest.fn()
  });
  map._showCategoryPage(seeds);
  // West Necluda sorts before Great Plateau because it is on the current map.
  expect(context.entries.map(entry=>entry.marker.id)).toEqual([1,2]);
  expect(control.setContent.mock.calls[0][1]).toBe('category-11');
  expect(map.selectedCategory).toBe(seeds);
  expect(context.document.title).toBe('Korok Seeds - Breath of the Wild - Zelda Maps');
  expect(added).toContain('area-detail-page');
  expect(typeof control._nextPageBack).toBe('function');
  expect(context.created).not.toContain('<div class="area-description"></div>');
  const sections=context.created.filter(s=>s.indexOf('poi-category-groups') !== -1);
  expect(sections).toHaveLength(2);
  expect(sections.filter(s=>s.indexOf('poi-category-heading') !== -1)).toHaveLength(2);
});

test('entries show the location under the name, as search results do',()=>{
  const context=loadCategoryPage({getMarkerLocationName:m=>'Hyrule Field, Hyrule'});
  const seeds=category(11,'Korok Seeds');
  const control={viewStyleBottomSlide:false,_contents:{querySelector:()=>null},setContent:jest.fn()};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    mapOptions:{shortName:'BotW',name:'Breath of the Wild'},
    categories:{11:seeds},
    categoriesArr:[seeds],
    getMarkers:()=>[marker(1,11,{title:'Alpha'})],
    _categoryListOrder:()=>({11:0}),
    _closeNewMarker:jest.fn()
  });
  map._showCategoryPage(seeds);
  const location=context.entries[0]._detailsAppended[0];
  expect(location.selector).toContain('location');
  expect(location._text).toBe('Hyrule Field, Hyrule');
});

test('Back restores the pre-focus view, unfocuses, and restores the game title',()=>{
  const context=loadCategoryPage();
  const a=category(11,'Korok Seeds'),b=category(12,'Korok Seeds - Blue');
  const menu={modeAutomatic:false,toggleAll:jest.fn(),_categoryTreeArr:[a,b]};
  const control={viewStyleBottomSlide:true,resetContent:jest.fn(),openDrawerDefaultPartial:jest.fn(),_categoryMenu:menu};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    mapOptions:{shortName:'BotW',name:'Breath of the Wild'},
    selectedCategory:a,
    refreshMap:jest.fn(),
    // Spies the restore the action runs first, before the unfocus refresh.
    restoreCategoryReturnView:jest.fn(()=>false)
  });
  context.document.title='Korok Seeds Map - Breath of the Wild - Zelda Maps';
  const order=[];
  map.restoreCategoryReturnView.mockImplementation(()=>{order.push('restore');return false;});
  map.refreshMap.mockImplementation(()=>{order.push('refresh');});
  map._categoryPageBackAction(control)();
  expect(menu.modeAutomatic).toBe(true);
  expect(menu.toggleAll).toHaveBeenCalledWith(true);
  expect(map.refreshMap).toHaveBeenCalledWith([a,b]);
  expect(map.selectedCategory).toBeNull();
  expect(context.document.title).toBe('Breath of the Wild Interactive Map - Zelda Maps');
  expect(control.resetContent).toHaveBeenCalled();
  expect(control.openDrawerDefaultPartial).toHaveBeenCalled();
  expect(order).toEqual(['restore','refresh']);
});

test('Back restores the pre-focus view while the map is still at the fit',()=>{
  const context=loadCategoryPage();
  const point=(x,y)=>({x,y,distanceTo:o=>Math.hypot(o.x-x,o.y-y)});
  function view(center,zoom){return {center:point(center[0],center[1]),zoom};}
  const pre=view([100,100],5),arrived=view([300,300],8);
  const map={options:{zoomAnimationThreshold:4},
    getCenter:()=>point(300,300),getZoom:()=>8,
    latLngToContainerPoint:p=>point(p.x,p.y),
    setView:jest.fn()};
  const zmap=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:{getCurrentMap:()=>({mapId:19,subMapId:1901})},
    map,
    _categoryReturnView:{mapId:19,subMapId:1901,center:pre.center,zoom:pre.zoom,arrived}
  });
  expect(zmap.restoreCategoryReturnView()).toBe(true);
  expect(map.setView).toHaveBeenCalledWith(pre.center,5,expect.objectContaining({duration:.25}));
  expect(zmap._categoryReturnView).toBeNull();
});

test('a panned or zoomed map keeps its place on Back',()=>{
  const context=loadCategoryPage();
  const point=(x,y)=>({x,y,distanceTo:o=>Math.hypot(o.x-x,o.y-y)});
  const arrived={center:point(300,300),zoom:8};
  function zmapFor(center, zoom, mapIds){
    return Object.assign(Object.create(context.ZMap.prototype),{
      mapControl:{getCurrentMap:()=>({mapId:mapIds[0],subMapId:mapIds[1]})},
      map:{options:{zoomAnimationThreshold:4},getCenter:()=>center,getZoom:()=>zoom,
        latLngToContainerPoint:p=>point(p.x,p.y),setView:jest.fn()},
      _categoryReturnView:{mapId:19,subMapId:1901,center:point(100,100),zoom:5,arrived}
    });
  }
  expect(zmapFor(point(301,300),8,[19,1901]).restoreCategoryReturnView()).toBe(true); // a 1px nudge still counts as the fit
  expect(zmapFor(point(310,300),8,[19,1901]).restoreCategoryReturnView()).toBe(false); // panned
  expect(zmapFor(point(300,300),7,[19,1901]).restoreCategoryReturnView()).toBe(false); // zoomed
  expect(zmapFor(point(300,300),8,[22,2201]).restoreCategoryReturnView()).toBe(false); // another map
  const none=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{getCurrentMap:()=>({mapId:19,subMapId:1901})},map:{}});
  expect(none.restoreCategoryReturnView()).toBe(false); // nothing remembered
});

test('a ?category= link reopens the page the server resolved',()=>{
  const context=loadCategoryPage({
    window:{
      location:{href:'https://zeldamaps.com/?game=BotW&category=korok-seeds'},
      history:{state:{},replaceState(){}},
      zmapLandingCategoryId:11
    }
  });
  const seeds=category(11,'Korok Seeds'),other=category(20,'Other');
  const control={viewStyleBottomSlide:true,setContent:jest.fn(),openDrawerDefaultPartial:jest.fn(),_contents:{querySelector:()=>null},_restoringInitialPage:false};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    mapOptions:{shortName:'BotW',name:'Breath of the Wild'},
    categories:{11:seeds,20:other},
    categoriesArr:[seeds,other],
    getMarkers:()=>[marker(1,11)],
    _categoryListOrder:()=>({}),
    _closeNewMarker:jest.fn()
  });
  expect(map.restoreCategoryFromURL()).toBe(true);
  expect(control.setContent.mock.calls[0][1]).toBe('category-11');
  expect(control._restoringInitialPage).toBe(false);
  expect(control.openDrawerDefaultPartial).toHaveBeenCalled();
});

test('a ?category= link without a server resolution falls back to the slug',()=>{
  const context=loadCategoryPage({
    window:{location:{href:'https://zeldamaps.com/?game=BotW&category=korok-seeds'},history:{state:{},replaceState(){}}}
  });
  const seeds=category(11,'Korok Seeds');
  const control={viewStyleBottomSlide:false,setContent:jest.fn(),_contents:{querySelector:()=>null}};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    mapOptions:{shortName:'BotW',name:'Breath of the Wild'},
    categories:{11:seeds},categoriesArr:[seeds],
    getMarkers:()=>[marker(1,11)],
    _categoryListOrder:()=>({})
  });
  expect(map.restoreCategoryFromURL()).toBe(true);
  expect(control.setContent.mock.calls[0][1]).toBe('category-11');
});

test('a marker link wins over its category, and an unknown slug is cleared',()=>{
  const withMarker=loadCategoryPage({window:{location:{href:'https://zeldamaps.com/?game=BotW&category=korok-seeds&marker=5'},history:{state:{},replaceState(){}}}});
  let noMarkerReplaced=null;
  const noMarker=loadCategoryPage({window:{location:{href:'https://zeldamaps.com/?game=BotW&category=nobody'},history:{state:{},replaceState(state,title,url){noMarkerReplaced=url;}}}});
  const map=Object.assign(Object.create(withMarker.ZMap.prototype),{
    mapControl:null,
    categories:{11:category(11,'Korok Seeds')},categoriesArr:[category(11,'Korok Seeds')],
    getMarkers:()=>[]
  });
  expect(map.restoreCategoryFromURL()).toBe(false);
  const dead=Object.assign(Object.create(noMarker.ZMap.prototype),{
    mapControl:null,
    categories:{},categoriesArr:[],
    getMarkers:()=>[]
  });
  expect(dead.restoreCategoryFromURL()).toBe(false);
  expect(new URL(noMarkerReplaced).searchParams.has('category')).toBe(false);
});

test('opening a page is refused for categories the server does not page',()=>{
  const context=loadCategoryPage();
  const collectibles=section(10,'Collectibles');
  const seeds=category(11,'Korok Seeds');
  const control={viewStyleBottomSlide:true,setContent:jest.fn(),openDrawerDefaultPartial:jest.fn()};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    categories:{10:collectibles,11:seeds},
    getMarkers:()=>[marker(1,11)],
    _showCategoryPage:jest.fn(),
    _closeNewMarker:jest.fn(),
    updateUrl:jest.fn()
  });
  map.openCategoryPage(collectibles);
  expect(map._showCategoryPage).not.toHaveBeenCalled(); // a section root
  map.openCategoryPage(seeds);
  expect(map._showCategoryPage).toHaveBeenCalledWith(seeds);
  expect(map.updateUrl).toHaveBeenCalled();
});

test('the drawer URL keeps ?category= only while its page is showing',()=>{
  const zmapSource=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');
  const start=zmapSource.indexOf('ZMap.prototype.syncDrawerPageURL');
  const end=zmapSource.indexOf('ZMap.prototype.restoreDrawerPage',start);
  let replaced=null;
  const context={ZMap:function(){},URL,window:{location:{href:'https://zeldamaps.com/?game=BotW'},history:{state:{},replaceState(state,title,url){replaced=url;}}}};
  vm.runInNewContext(zmapSource.slice(start,end),context);
  const zmap=Object.assign(Object.create(context.ZMap.prototype),{
    _drawerRoutingReady:true,
    drawerPageRoutes:{},
    selectedArea:null,
    selectedCategory:{name:'Korok Seeds'},
    categoryURLKey:()=> 'korok-seeds',
    areaURLKey:()=> 'somewhere'
  });
  zmap.syncDrawerPageURL('category-11');
  let url=new URL(replaced);
  expect(url.searchParams.get('category')).toBe('korok-seeds');
  expect(url.searchParams.has('page')).toBe(false);
  zmap.syncDrawerPageURL('category');
  url=new URL(replaced);
  expect(url.searchParams.has('category')).toBe(false);
  zmap.syncDrawerPageURL('m5');
  url=new URL(replaced);
  expect(url.searchParams.has('category')).toBe(false);
  zmap.syncDrawerPageURL('area-x');
  url=new URL(replaced);
  expect(url.searchParams.has('category')).toBe(false);
});

test('completion counts update only while its page is the one showing',()=>{
  const context=loadCategoryPage();
  const seeds=category(11,'Korok Seeds');
  const control={viewStyleBottomSlide:false,getContentType:()=> 'category-11',_contents:{}};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapControl:control,
    selectedCategory:seeds,
    categories:{11:seeds},
    getMarkers:()=>[marker(1,11,{complete:1}),marker(2,11)]
  });
  expect(()=>map.updateCategoryCompletionCounts()).not.toThrow();
  // The area page is open instead: the category page leaves its counts alone.
  control.getContentType=()=> 'area-x';
  expect(()=>map.updateCategoryCompletionCounts()).not.toThrow();
  expect(map.selectedCategory).toBe(seeds);
});
