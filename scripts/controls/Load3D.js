// The 3D work (BotW's 3D Divine Beasts, Map3D.js; street view, StreetView*.js)
// is for staff only while it's built, and it's in a bundle of its own
// (staffjs.txt, res.php?type=staffjs) that nobody else downloads: loaded here,
// once, the first time a moderator or admin needs it. Everyone else's page
// never asks for it and runs none of it.
var ZLoad3D = (function() {
  var STAFF_LEVEL = 10;          // moderators and admins (lib/common/admin.php ADMIN_LEVEL)
  var STREET_VIEW_SUBMAPS = { 1901: true };   // where street view is built (StreetView.js WORLDS)
  var loading = null;

  function staff(u) { return !!u && Number(u.level) >= STAFF_LEVEL; }

  // The page's own version (the main bundle's ?v=): the 3D bundle changes with it.
  function version() {
    var tag = document.querySelector('script[src*="res.php?type=javascript"]'), m = tag && /[?&]v=([^&]+)/.exec(tag.getAttribute('src'));
    return m ? m[1] : (window.pageAssetVersion || '');
  }

  // The 3D bundle, loaded once (a promise).
  function load() {
    if(window.ZMap3D) return $.Deferred().resolve().promise();
    if(loading) return loading;
    var done = $.Deferred(), script = document.createElement('script');
    loading = done.promise();
    script.src = 'res.php?type=staffjs&v=' + encodeURIComponent(version());
    script.onload = function() { if(window.ZMap3D) done.resolve(); else failed(); };
    script.onerror = failed;
    function failed() { script.remove(); loading = null; done.reject(); }
    document.head.appendChild(script);
    return loading;
  }

  return {
    staff: staff,
    // For a signed-in moderator or admin (anyone else's is refused)
    ensure: function(u) { return staff(u) ? load() : $.Deferred().reject().promise(); },
    // For a map list with a 3D map in it (the server sends those to staff alone:
    // get_map.php, map.visible = 2); nothing to load otherwise
    forMaps: function(maps) {
      var any = (maps || []).some(function(m) { return m && m.kind === '3d'; });
      return any ? load() : $.Deferred().resolve().promise();
    },
    // Whether street view could be here: staff, on a map it's built for.
    streetViewHere: function(zmap, u) {
      var map = zmap && zmap.mapControl && zmap.mapControl.getCurrentMap && zmap.mapControl.getCurrentMap();
      return staff(u) && !!map && !!STREET_VIEW_SUBMAPS[map.subMapId];
    }
  };
})();
