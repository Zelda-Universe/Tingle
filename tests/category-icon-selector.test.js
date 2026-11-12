const fs=require('fs'),vm=require('vm');
test('icon selector includes SVG masks, image icons and current category glyphs',()=>{
  const context={ZMap:function(){},document:{styleSheets:[{cssRules:[{selectorText:'.icon-General_Bottle:before'},{selectorText:'.icon-OoT_Poe::before'},{selectorText:'.poi-eow.icon-EoW_Stamp::before'}]}]},getPOIGlyph:c=>c.glyph || c.img};
  vm.runInNewContext(fs.readFileSync('scripts/zmapsettings.js','utf8'),context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{categories:{1:{img:'General_Chest',glyph:'General_HeartPiece'}}});
  const names=Array.from(map._mapSettingsIcons());
  for(const name of ['General_Bottle','OoT_Poe','EoW_Stamp','General_Chest','General_HeartPiece']) expect(names).toContain(name);
});
