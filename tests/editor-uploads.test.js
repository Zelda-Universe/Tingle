const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Uploading a photo or video in the marker editor (scripts/zvideo.js): once
// it's uploaded, it goes straight into the content and the dialog closes.

test('a finished upload is put in the content, nothing more to press',()=>{
  const js=read('scripts/zvideo.js');
  expect(js).toMatch(/if\(!location\) return; \/\/ Cancelled\.\n\s*\/\/ Uploaded: straight into the content\.\n\s*kind\.insert\(location\);\n\s*dialog\.close\(\);/);
  // (Not back to General, to press Save.)
  expect(js).not.toContain("dialog.showTab('general');");
});

test('photos and videos share the dialog; photos are sent as pasting one is',()=>{
  const js=read('scripts/zvideo.js');
  expect(js).toContain('ZMap.prototype._uploadEditorPhoto = function(editor) {');
  expect(js).toContain("ZMap.prototype._uploadEditorVideo = function(editor) {");
  expect(js).toContain("xhr.open('POST', 'ajax.php?command=upload_marker_image');");
  expect(js).toContain(`insert: function(src) { editor.insertContent('<img src="' + editor.dom.encode(src) + '" alt="">'); }`);
});

test('editors get Insert Photo; a photo already in the content opens TinyMCE\'s own dialog',()=>{
  const zmap=read('scripts/features/MarkerEditor.js');
  expect(zmap).toContain("(isEditor ? 'uploadphoto' : 'image')");
  expect(zmap).toContain("if(node && node.nodeName === 'IMG') editor.execCommand('mceImage');");
  expect(zmap).toContain('else _this._uploadEditorPhoto(editor);');
});

test('photos and videos dropped into the editor upload where they land',()=>{
  const js=read('scripts/zvideo.js');
  expect(read('scripts/features/MarkerEditor.js')).toContain('if(_this._wireEditorDrops) _this._wireEditorDrops(editor);');
  // A progress line meanwhile, all at once, never saved.
  expect(js).toContain("editor.serializer.addAttributeFilter('data-zm-uploading', function(nodes) {");
  expect(js).toContain("}).join(''));");
  expect(js).toContain("if(el) el.textContent = label + percent + '%';");
  // (No temporary image: TinyMCE would upload it a second time.)
  expect(js).not.toContain('createObjectURL');
  // TinyMCE's own drop handling stopped, and the outline with it.
  expect(js).toContain('e.stopImmediatePropagation();');
  expect(js).toMatch(/editor\.on\('drop', function\(e\) \{\n\s*_this\._fileDragging\(null, true\);/);
  // Shown as soon as a file's dragged anywhere over the page, gone once it isn't.
  expect(js).toContain("this._onPage(document, 'dragover', function(e) {");
  expect(js).toContain('this._fileDragTimer = window.setTimeout(hide, 250);');
  // A file dropped beside the editor isn't opened in place of the page.
  expect(js).toContain("e.dataTransfer.dropEffect = 'none';");
  // "Drop photo or video here" over the section while one's dragged over it.
  expect(js).toContain('Drop photo or video here');
  expect(read('styles/zmain.css')).toContain('.marker-edit-section.zm-editor-dropping .tox .zm-editor-drop-overlay { display: block; }');
  expect(read('scripts/zvideo.js')).toContain("return container && (container.closest('.marker-edit-section') || container);");
  expect(read('styles/zmain.css')).toContain('border: 2px dashed rgba(255,255,255,.45);');
  expect(read('scripts/zvideo.js')).toContain('(editor.getContainer() || section).appendChild(overlay);');
});

describe('the drop overlays follow a file dragged over the page', () => {
  let zmap;
  const dragEvent = (type, withFiles = true) => {
    const e = new Event(type, {bubbles: true, cancelable: true});
    e.dataTransfer = {types: withFiles ? ['Files'] : ['text/plain'], dropEffect: ''};
    return e;
  };
  beforeEach(() => {
    jest.useFakeTimers();
    document.body.innerHTML =
      '<div class="marker-edit-section" data-zm-drops="1" id="one"></div>' +
      '<div class="marker-edit-section" data-zm-drops="1" id="two"></div>';
    const ZMap = function() {};
    // (zmap.js's: a page-wide listener, recorded.)
    ZMap.prototype._onPage = function(target, type, fn, options) { target.addEventListener(type, fn, options); };
    ZMap.prototype._onCleanup = function() {};
    global.$ = () => ({});
    new Function('ZMap', read('scripts/zvideo.js'))(ZMap);
    zmap = new ZMap();
    zmap._watchFileDrags();
  });
  afterEach(() => { jest.useRealTimers(); delete global.$; });
  const shown = id => document.getElementById(id).classList.contains('zm-editor-dropping');

  test('a file dragged anywhere over the page shows them all; they go once it stops', () => {
    const over = dragEvent('dragover');
    document.body.dispatchEvent(over);
    expect(shown('one') && shown('two')).toBe(true);
    // Not a drop target here: the file isn't opened in place of the page.
    expect(over.defaultPrevented).toBe(true);
    expect(over.dataTransfer.dropEffect).toBe('none');
    jest.advanceTimersByTime(200);
    document.body.dispatchEvent(dragEvent('dragover'));
    jest.advanceTimersByTime(200);
    expect(shown('one')).toBe(true);
    jest.advanceTimersByTime(100);
    expect(shown('one') || shown('two')).toBe(false);
  });

  test('over an editor, that one is picked out; a drop hides them at once', () => {
    zmap._fileDragging(document.getElementById('two'));
    expect(document.getElementById('two').classList.contains('zm-editor-drop-target')).toBe(true);
    expect(document.getElementById('one').classList.contains('zm-editor-drop-target')).toBe(false);
    document.body.dispatchEvent(dragEvent('drop'));
    expect(shown('one') || shown('two')).toBe(false);
  });

  test('text being dragged, or no editor open, changes nothing', () => {
    document.body.dispatchEvent(dragEvent('dragover', false));
    expect(shown('one')).toBe(false);
    document.body.innerHTML = '';
    const over = dragEvent('dragover');
    document.body.dispatchEvent(over);
    expect(over.defaultPrevented).toBe(false);
  });
});
