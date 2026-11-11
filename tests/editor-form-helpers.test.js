/** @jest-environment jsdom */
const fs=require('fs');
const vm=require('vm');
const $=require('jquery');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/zwiki.js'),'utf8');
const context={ZMap:function(){}};
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._editorFieldHTML ='),source.indexOf('ZMap.prototype._wikiPageSettled =')),context);
const editor=Object.assign(Object.create(context.ZMap.prototype),{_wikiEscape:value=>String(value).replace(/&/g,'&amp;').replace(/</g,'&lt;')});

test('shared fields support marker and Map Settings layouts without changing their markup',()=>{
  const input='<input class="form-control">';
  expect(editor._editorFieldHTML('fa-heading',input)).toBe('<div class="form-group"><div class="input-group"><span class="input-group-addon"><i class="fas fa-heading" aria-hidden="true"></i></span>'+input+'</div></div>');
  expect(editor._editorFieldHTML('fa-heading',input,'Name')).toMatch(/^<label class="map-settings-label">Name<\/label>/);
});

test('shared footer preserves no-changes, invalid, busy and new-marker states',()=>{
  const form=$('<form>'+editor._editorSaveHTML(true)+'</form>');
  editor._editorSaveState(form,false,true,false);
  expect(form.find('button').prop('disabled')).toBe(true);
  expect(form.find('.marker-edit-pending').prop('hidden')).toBe(false);
  editor._editorSaveState(form,true,true,false);
  expect(form.find('button').prop('disabled')).toBe(false);
  expect(form.find('.marker-edit-pending').prop('hidden')).toBe(true);
  editor._editorSaveState(form,true,false,false);
  expect(form.find('button').prop('disabled')).toBe(true);
  editor._editorSaveState(form,true,true,true);
  expect(form.find('button').text()).toBe('Saving…');
  expect(editor._editorSaveHTML(false,'Add Marker')).not.toContain(' disabled');
});

test('shared name validation retains each editor limit and markup policy',()=>{
  expect(editor._editorNameError('',45,false)).toBe('Enter a name.');
  expect(editor._editorNameError('x'.repeat(46),45,false)).not.toBe('');
  expect(editor._editorNameError('<name>',45,false)).not.toBe('');
  expect(editor._editorNameError('<name>',255,true)).toBe('');
});
