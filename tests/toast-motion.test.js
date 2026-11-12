/** @jest-environment jsdom */
const fs=require('fs');
const $=require('jquery');
const vm=require('vm');
vm.runInNewContext(fs.readFileSync('scripts/util/toastMotion.js','utf8'),{jQuery:$,window});

beforeEach(()=>{jest.useFakeTimers();document.body.innerHTML='';});
afterEach(()=>{jest.runOnlyPendingTimers();jest.useRealTimers();});

test('ordinary toasts animate in and out with lifecycle callbacks',()=>{
  const toast=$('<div class="toast" style="display:none"></div>').appendTo(document.body);
  const shown=jest.fn(),hidden=jest.fn();
  toast.zmapToastIn({duration:300,complete:shown});
  expect(toast.hasClass('is-entering')).toBe(true);
  jest.advanceTimersByTime(300);
  expect(shown).toHaveBeenCalledTimes(1);
  expect(toast.hasClass('is-entering')).toBe(false);
  toast.zmapToastOut({duration:250,complete:hidden});
  expect(toast.hasClass('is-closing')).toBe(true);
  jest.advanceTimersByTime(250);
  expect(toast[0].style.display).toBe('none');
  expect(hidden).toHaveBeenCalledTimes(1);
});

test('hover can cancel an exit without replaying entry or removing the toast',()=>{
  const toast=$('<div class="toast"></div>').appendTo(document.body),hidden=jest.fn();
  toast.zmapToastOut({duration:250,complete:hidden});
  jest.advanceTimersByTime(100);
  toast.zmapToastIn({duration:300});
  jest.advanceTimersByTime(500);
  expect(hidden).not.toHaveBeenCalled();
  expect(toast.hasClass('is-entering')).toBe(false);
  expect(toast.hasClass('is-closing')).toBe(false);
  expect(toast[0].style.display).not.toBe('none');
});

test('ordinary notifications expire after five seconds and share completion reminder motion',()=>{
  const config=fs.readFileSync('scripts/util/ZConfig.js','utf8');
  expect(config).toMatch(/timeOut\s*:\s*5000/);
  expect(config).toMatch(/extendedTimeOut\s*:\s*1000/);
  expect(config).toContain("showMethod      : 'zmapToastIn'");
  expect(config).toContain("hideMethod      : 'zmapToastOut'");
  const css=fs.readFileSync('styles/zmain.css','utf8');
  expect(css).toContain('.complete-reminder,\n#toast-container>div.toast.is-entering');
  expect(css).toContain('.complete-reminder.is-closing,\n#toast-container>div.toast.is-closing');
  const source=fs.readFileSync('scripts/zmap.js','utf8');
  const reminder=source.slice(source.indexOf('ZMap.prototype._showCompleteReminder ='),source.indexOf('ZMap.prototype._registerToSaveCompletes ='));
  expect(reminder).not.toContain('5000');
  expect(reminder).not.toContain('toastr.');
});
