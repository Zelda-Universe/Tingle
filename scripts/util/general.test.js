const fs = require('fs');
const vm = require('vm');

describe('live responsive breakpoint', () => {
  test.each([true, false])('switches controls in place when mobile=%s', mobile => {
    let change;
    const media = { matches: mobile, addEventListener: (_, callback) => { change = callback; } };
    const reload = jest.fn();
    const control = { setResponsiveLayout: jest.fn() };
    const context = {
      window: { matchMedia: () => media, location: { reload } },
      ZConfig: { getConfig: () => 'false' }, zMap: { mapControl: control }
    };
    const source = fs.readFileSync(__dirname + '/general.js', 'utf8');
    vm.runInNewContext(source.slice(0, source.indexOf('watchMobileLayoutBreakpoint();') + 'watchMobileLayoutBreakpoint();'.length), context);
    change();
    expect(control.setResponsiveLayout).toHaveBeenCalledWith(mobile);
    expect(context.zMap.mapControl).toBe(control);
    expect(reload).not.toHaveBeenCalled();
  });
});
