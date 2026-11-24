const fs=require('fs'),vm=require('vm');
function settings() {
  const cookies={},context={L:{Control:{extend:spec=>spec},control:{}},getCookie:key=>cookies[key] || '',setCookie:(k,v)=>{cookies[k]=String(v);},ZOfflineSync:{settingsPending:()=>false},getUrlParam:()=>''};
  vm.runInNewContext(fs.readFileSync('scripts/controls/SettingsControl.js','utf8'),context);
  const control=Object.assign(Object.create(context.L.Control.Settings),{
    zMap:{mapOptions:{},getUser:()=>null,trackpadGestureHandler:{zoomInsteadOfPan:false,finishPinch:jest.fn()}},
    trackpadZoomCheckbox:{},isMinimalUI:()=>false
  });
  return {control,cookies};
}
test('the trackpad checkbox applies immediately and is saved with account preferences',()=>{
  const {control,cookies}=settings();control.setTrackpadTwoFingerZoom(true);
  expect(control.zMap.trackpadGestureHandler.zoomInsteadOfPan).toBe(true);
  expect(control.trackpadZoomCheckbox.checked).toBe(true);
  expect(cookies.trackpadTwoFingerZoom).toBe('true');
  expect(control.currentSettings().trackpadTwoFingerZoom).toBe(true);
  expect(fs.readFileSync('lib/common/user_settings.php','utf8')).toContain("'trackpadTwoFingerZoom'");
});
test('an account preference restores the trackpad mode without saving it again',()=>{
  const {control,cookies}=settings();control.saveSetting=jest.fn();
  control.applyAccountSettings({trackpadTwoFingerZoom:true});
  expect(control.zMap.trackpadGestureHandler.zoomInsteadOfPan).toBe(true);
  expect(cookies.trackpadTwoFingerZoom).toBe('true');
  expect(control.saveSetting).not.toHaveBeenCalled();
});
