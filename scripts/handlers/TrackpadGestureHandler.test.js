const {
  isInteractiveUiEvent,
  looksLikeTrackpadPan,
  looksLikeTrackpadPinch
} = require('./TrackpadGestureHandler');

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
