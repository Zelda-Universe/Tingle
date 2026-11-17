// Cross-game navigation reloads the app. Keep serializable page callbacks in
// this tab's session storage, rather than dropping the whole Back chain.
ZMap.prototype._markerReturnSource = function(back,seen) {
  seen=seen || new Set();
  if(!back || seen.has(back)) return null;
  seen.add(back);
  if(back.navigationPath) return JSON.parse(JSON.stringify(back.navigationPath));
  var source=back.navigationSource || back.activitySource ||
    (back.historyOf ? {type:'history',id:back.historyOf} : back.fromMarker ? {type:'marker',id:back.fromMarker} : {type:'categories'});
  return {source:source,label:back.label || 'Back',parent:this._markerReturnSource(back.navigationBack,seen)};
};

ZMap.prototype._markerURLWithReturn = function(destination,back) {
  if(!back) return destination;
  var url=new URL(destination,window.location.href);
  try {
    var token=Date.now().toString(36)+'-'+Math.random().toString(36).slice(2);
    var context={url:window.location.href,path:this._markerReturnSource(back)};
    window.sessionStorage.setItem('zmap-marker-return:'+token,JSON.stringify(context));
    url.searchParams.set('nav-from',token);
  } catch(error) { /* Storage unavailable: do not block the marker link. */ }
  return url.href;
};

ZMap.prototype._readMarkerLinkReturn = function(token) {
  if(!/^[a-z0-9-]{1,80}$/.test(token || '')) return null;
  try {
    var data=JSON.parse(window.sessionStorage.getItem('zmap-marker-return:'+token));
    if(!data || typeof data.url!=='string' || !data.path) return null;
    if(new URL(data.url).origin!==new URL(window.location.href).origin) return null;
    return data;
  } catch(error) {return null;}
};

ZMap.prototype._markerLinkReturnBack = function() {
  var token=new URL(window.location.href).searchParams.get('nav-from');
  var context=this._readMarkerLinkReturn(token);
  if(!context) return null;
  var zmap=this;
  var back=function() {zmap._restoreMarkerLinkSource(token);};
  back.label=context.path.label || 'Back';
  back.navigationPath=context.path;
  return back;
};

ZMap.prototype._prepareMarkerLinkReturn = function() {
  var back=this._markerLinkReturnBack();
  if(back) this.mapControl.returnNextPageTo({page:back,label:back.label});
};

ZMap.prototype._restoreMarkerLinkSource = function(token) {
  var context=this._readMarkerLinkReturn(token);
  if(!context) return false;
  var url=new URL(window.location.href);
  url.searchParams.delete('nav-restore');
  if(url.searchParams.get('nav-from')===token) url.searchParams.delete('nav-from');
  window.history.replaceState(window.history.state,'',url.href);
  var zmap=this;
  function reopen(path,seen) {
    if(!path || !path.source || seen.has(path)) return null;
    seen.add(path);
    var source=path.source,parent=reopen(path.parent,seen);
    var fn=function() {
      if(path.clearMarker && zmap._closeNewMarker) zmap._closeNewMarker();
      var id=Number(source.id),valid=Number.isInteger(id)&&id>0;
      if(source.type==='recent') {
        zmap._openRecentChanges(typeof source.game==='string' ? source.game || null : null,parent,['all','edits','talk'].includes(source.filter)?source.filter:'all');
      } else if(source.type==='profile' && valid) {
        zmap._profileActivityFilter=['all','edits','talk'].includes(source.filter)?source.filter:'all';
        zmap._openUserProfile({id:id},parent);
      } else if(source.type==='history' && valid) zmap._openMarkerHistory(id,parent);
      else if(source.type==='revision' && valid) zmap._openMarkerRevision(id,parent);
      // A path's revision: where it was, in whichever game (PathEditor.js).
      else if(source.type==='pathRevision' && valid && zmap._openPathRevisionById) zmap._openPathRevisionById(id,parent);
      else if(source.type==='talk' && valid && ['marker','user'].includes(source.pageType)) zmap._openTalk(source.pageType,id,String(source.title || ''),parent,{highlight:Number(source.comment)||0,region:!!source.region});
      else if(source.type==='notifications') zmap._openNotificationsPage(parent);
      else if(source.type==='categories') zmap.mapControl.resetContent();
      else if(source.type==='marker' && valid) {
        if(parent) zmap.mapControl.returnNextPageTo({page:parent,label:parent.label});
        zmap.navigateToMarker(id);
      } else {
        var params=new URL(context.url).searchParams;
        if(source.page || params.get('page')) {
          var destination=new URL(window.location.href);
          ['user','profile','talk','comment','rev','notification','area','category'].forEach(function(key) {destination.searchParams.delete(key);});
          window.history.replaceState(window.history.state,'',destination.href);
          zmap.restoreDrawerPage(source.page || params.get('page'),true);
        }
        else if(params.get('area')) zmap.restoreAreaFromURL();
        else if(params.get('category') && zmap.restoreCategoryFromURL) zmap.restoreCategoryFromURL();
        else if(!params.get('marker')) zmap.mapControl.resetContent();
      }
    };
    fn.label=path.label || 'Back';fn.navigationSource=source;fn.navigationBack=parent;
    return fn;
  }
  var open=reopen(context.path,new Set());
  if(!open) return false;
  open();
  return true;
};
