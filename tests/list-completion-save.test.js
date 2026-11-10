const fs=require('fs');
const vm=require('vm');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/zmap.js'),'utf8');

test.each(['Done','Undone'])('failed %s saves keep the saved marker state and settle the checkbox', action => {
  let request;
  const saved=action==='Undone';
  const marker={id:123,categoryId:1,complete:saved};
  const zmap={mapOptions:{showCompleted:true},categories:{1:{complete:saved?1:0}},
    langMsgs:{MARKER_ADD_COMPLETE_ERROR:{format:()=>''},MARKER_DEL_COMPLETE_ERROR:{format:()=>''}},
    _completeSetMarkerDoneAndCookie:jest.fn(),_saveCompletedOffline:jest.fn(),_doSetMarkerDoneIcon:jest.fn()};
  const context={ZMap:function(){},_this:zmap,user:{id:1},gameId:64,
    completedMarkers:saved?[123]:[],ZOfflineSync:{send:opts=>{request=opts;}},toastr:{error:jest.fn()}};
  const method='_doSetMarker'+action+'AndCookie';
  const start=source.indexOf('ZMap.prototype.'+method+' = function');
  const end=source.indexOf('\nZMap.prototype.',start+1);
  vm.runInNewContext(source.slice(start,end),context);
  const settle=jest.fn();
  context.ZMap.prototype[method].call(zmap,marker,settle);
  expect(marker.complete).toBe(saved);
  request.success({success:false,msg:'Rejected'});
  expect(marker.complete).toBe(saved);
  expect(settle).toHaveBeenCalledTimes(1);
  expect(zmap._doSetMarkerDoneIcon).not.toHaveBeenCalled();
});
