// Secondary pages download only when opened. Shared display/permission
// helpers stay in the main bundle; these files replace their entry stubs.
var ZFeatures = (function() {
  var pending = {};
  var files = { editor: 'scripts/features/MarkerEditor.js', settings: 'scripts/zmapsettings.js' };
  var methods = {
    editor: ['_createMarkerForm'],
    settings: ['_openMapSettings', '_openMapSettingsHistory', '_openGameSettingsRevision', '_openSettingsRevisionLink']
  };
  function version() {
    var tag = document.querySelector('script[src*="res.php?type=javascript"]');
    return tag ? new URL(tag.src, window.location.href).searchParams.get('v') || '' : '';
  }
  function load(name) {
    if(pending[name]) return pending[name];
    var ready = $.Deferred(), script = document.createElement('script');
    pending[name] = ready.promise();
    script.src = files[name] + '?v=' + encodeURIComponent(version());
    script.onload = function() {
      if(methods[name].every(function(method) {
        return typeof ZMap.prototype[method] === 'function' && !ZMap.prototype[method]._lazyFeature;
      })) ready.resolve();
      else failed();
    };
    function failed() {
      script.remove(); delete pending[name]; ready.reject();
    }
    script.onerror = failed;
    document.head.appendChild(script);
    return pending[name];
  }
  function entry(name, method) {
    var stub = function() {
      var zmap = this, args = arguments;
      var content = zmap.mapControl && zmap.mapControl.getContentType();
      var mapKey = function() {
        var map = zmap.mapControl && zmap.mapControl.getCurrentMap && zmap.mapControl.getCurrentMap();
        return map ? map.mapId + ':' + map.subMapId : '';
      };
      var initialMap = mapKey();
      var request = zmap._featureRequest = (zmap._featureRequest || 0) + 1;
      return load(name).done(function() {
        // Don't reopen a page after its caller navigated away or switched games.
        if(zmap._featureRequest !== request || mapKey() !== initialMap || (window.zMap && window.zMap !== zmap) ||
          (zmap.mapControl && zmap.mapControl.getContentType() !== content)) return;
        if(zmap[method] !== stub) zmap[method].apply(zmap, args);
        else toastr.error('This tool could not load. Please reload and try again.');
      }).fail(function() {
        toastr.error('This tool could not load. Check your connection and try again.');
      });
    };
    stub._lazyFeature = name;
    ZMap.prototype[method] = stub;
  }
  entry('editor', '_createMarkerForm');
  methods.settings.forEach(function(method) {
    entry('settings', method);
  });
  return { load: load };
})();
