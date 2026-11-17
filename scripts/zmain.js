var breaktime     = ZConfig.getConfig('breaktime'   ) == 'true';
var verbose       = ZConfig.getConfig('verbose'     ) == 'true';
var verboseFirst  = true;

zMap = new ZMap();
var gameId = getUrlParam("game");
if(!gameId) {
  // A home-screen cold launch opens the manifest's bare start URL. Resolve
  // it before requesting map data; there is no cached "game=" response.
  var downloadedGames = !navigator.onLine ? ZMapOfflinePacks.downloadedGameIds() : [];
  gameId = downloadedGames[0] || 'OoT';
  var startURL = new URL(window.location.href);
  startURL.searchParams.set('game', gameId);
  window.history.replaceState(window.history.state, '', startURL.href);
}
// Show connectivity status even while offline map data is still loading.
if(/^ootr?$/i.test(gameId)) {
  // Keep existing offline-data keys, but use the remake's canonical public URL.
  gameId='OoT';
  var canonicalGameURL=new URL(window.location.href);
  canonicalGameURL.searchParams.set('game','OoTR');
  window.history.replaceState(window.history.state,'',canonicalGameURL.href);
}
zMap.setupOfflineMapMessage();

$(document).on('keydown', globalKeyPressHandler);

// (Asked for as the page started, if it was: startupJSON.)
startupJSON(
  "ajax.php?command=get_container&game=" + gameId,
  zMapInit
).fail(showOfflineUnavailable);
