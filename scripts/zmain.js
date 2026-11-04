var breaktime     = ZConfig.getConfig('breaktime'   ) == 'true';
var verbose       = ZConfig.getConfig('verbose'     ) == 'true';
var verboseFirst  = true;

zMap = new ZMap();
// Show connectivity status even while offline map data is still loading.
zMap.setupOfflineMapMessage();
var gameId = getUrlParam("game");

$(document).on('keydown', globalKeyPressHandler);

$.getJSON(
  "ajax.php?command=get_container&game=" + gameId,
  zMapInit
).fail(showOfflineUnavailable);
