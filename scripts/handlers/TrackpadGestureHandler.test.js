const {
  TrackpadGestureHandler,
  isInteractiveUiEvent,
  looksLikeTrackpadPan,
  looksLikeTrackpadPinch
} = require('./TrackpadGestureHandler');

describe('two-finger zoom preference',()=>{
  function handler(enabled) {
    return Object.assign(Object.create(TrackpadGestureHandler.prototype),{
      map:{getZoom:()=>3,getMinZoom:()=>0,getMaxZoom:()=>8,panBy:jest.fn()},
      container:{},zoomInsteadOfPan:enabled,trackpadPanUntil:0,
      pinchTargetZoom:null,panX:0,panY:0,panFrame:null,
      stopEvent:jest.fn(),getEventPoint:()=>({x:100,y:200}),
      requestZoomAround:jest.fn(),schedulePinchEnd:jest.fn()
    });
  }
  test('two-finger scrolling zooms fractionally around the pointer when enabled',()=>{
    const h=handler(true);h.onWheel(wheelEvent({deltaY:12}));
    expect(h.requestZoomAround).toHaveBeenCalledWith({x:100,y:200},2.94);
    expect(h.map.panBy).not.toHaveBeenCalled();
    h.onWheel(wheelEvent({deltaY:-4}));
    expect(h.pinchTargetZoom).toBeCloseTo(2.96);
    expect(h.schedulePinchEnd).toHaveBeenCalledTimes(2);
  });
  test('mouse wheels and modified gestures are not captured, even during trackpad momentum',()=>{
    const h=handler(true);h.onWheel(wheelEvent({deltaY:100}));
    expect(h.stopEvent).not.toHaveBeenCalled();
    h.trackpadPanUntil=Date.now()+250;
    h.onWheel(wheelEvent({deltaMode:1,deltaY:3}));
    h.onWheel(wheelEvent({shiftKey:true,deltaY:12}));
    expect(h.stopEvent).not.toHaveBeenCalled();
  });
  test('pinching keeps its existing sensitivity regardless of the preference',()=>{
    const h=handler(false);h.onWheel(wheelEvent({ctrlKey:true,deltaY:12}));
    expect(h.pinchTargetZoom).toBeCloseTo(2.7);
  });
  test('the default remains two-finger panning',()=>{
    let frame;const raf=jest.spyOn(window,'requestAnimationFrame').mockImplementation(fn=>{frame=fn;return 1;});
    try {
      const h=handler(false);h.onWheel(wheelEvent({deltaX:4,deltaY:12}));frame();
      expect(h.map.panBy).toHaveBeenCalledWith([4,12],{animate:false,noMoveStart:true});
      expect(h.requestZoomAround).not.toHaveBeenCalled();
    } finally {raf.mockRestore();}
  });
  test('horizontal movement alone does not zoom and controls still receive scrolls',()=>{
    const h=handler(true);h.onWheel(wheelEvent({deltaX:12}));
    expect(h.requestZoomAround).not.toHaveBeenCalled();
    h.onWheel(wheelEvent({deltaY:12,target:{closest:()=>({})}}));
    expect(h.requestZoomAround).not.toHaveBeenCalled();
  });
});

describe('isInteractiveUiEvent', () => {
  test('leaves drawer and navigation events to the UI', () => {
    const control = {closest: jest.fn(() => control)};
    expect(isInteractiveUiEvent({target: control}, {})).toBe(true);
    expect(control.closest).toHaveBeenCalledWith(expect.stringContaining('.leaflet-control'));
  });

  test('leaves mobile search result panel wheel events to the panel', () => {
    const panel = {closest: jest.fn(() => panel)};
    expect(isInteractiveUiEvent({target: panel}, {})).toBe(true);
    expect(panel.closest).toHaveBeenCalledWith(
      expect.stringContaining('.mobile-search-results-panel')
    );
  });

  test('leaves gestures over a 3D map to the 3D map', () => {
    const view = {closest: jest.fn(() => view)};
    expect(isInteractiveUiEvent({target: view}, {})).toBe(true);
    expect(view.closest).toHaveBeenCalledWith(expect.stringContaining('.zm-3d-view'));
  });

  test('pans and pinches over place names (Leaflet tooltips) like the map', () => {
    const selector = jest.fn(() => null);
    isInteractiveUiEvent({target: {closest: selector}}, {});
    expect(selector.mock.calls[0][0]).not.toContain('.leaflet-tooltip');
  });

  test('allows gestures directly on the map canvas', () => {
    const mapTarget = {closest: jest.fn(() => null)};
    expect(isInteractiveUiEvent({target: mapTarget}, {})).toBe(false);
  });
});

function wheelEvent(overrides = {}) {
  return {
    altKey: false,
    ctrlKey: false,
    deltaMode: 0,
    deltaX: 0,
    deltaY: 0,
    metaKey: false,
    shiftKey: false,
    ...overrides
  };
}

describe('looksLikeTrackpadPan', () => {
  test('accepts precise vertical and horizontal trackpad movement', () => {
    expect(looksLikeTrackpadPan(wheelEvent({deltaY: 12}))).toBe(true);
    expect(looksLikeTrackpadPan(wheelEvent({deltaX: 8, deltaY: 70}))).toBe(true);
    expect(looksLikeTrackpadPan(wheelEvent({deltaY: 50.5}))).toBe(true);
  });

  test('leaves conventional mouse wheels to Leaflet', () => {
    expect(looksLikeTrackpadPan(wheelEvent({deltaY: 100}))).toBe(false);
    expect(looksLikeTrackpadPan(wheelEvent({deltaMode: 1, deltaY: 3}))).toBe(false);
  });

  test('does not treat modified wheel input as a pan', () => {
    expect(looksLikeTrackpadPan(wheelEvent({ctrlKey: true, deltaY: 12}))).toBe(false);
    expect(looksLikeTrackpadPan(wheelEvent({shiftKey: true, deltaX: 12}))).toBe(false);
  });
});

describe('looksLikeTrackpadPinch', () => {
  test('accepts precise control-modified pinch events', () => {
    expect(looksLikeTrackpadPinch(wheelEvent({ctrlKey: true, deltaY: 12}))).toBe(true);
    expect(looksLikeTrackpadPinch(wheelEvent({ctrlKey: true, deltaY: 50.5}))).toBe(true);
  });

  test('leaves ordinary and control-modified mouse wheels alone', () => {
    expect(looksLikeTrackpadPinch(wheelEvent({deltaY: 12}))).toBe(false);
    expect(looksLikeTrackpadPinch(wheelEvent({ctrlKey: true, deltaY: 100}))).toBe(false);
    expect(looksLikeTrackpadPinch(wheelEvent({ctrlKey: true, deltaMode: 1, deltaY: 3}))).toBe(false);
  });
});
