var breaktime     = ZConfig.getConfig('breaktime'   ) == 'true';
var verbose       = ZConfig.getConfig('verbose'     ) == 'true';
var verboseFirst  = ZConfig.getConfig('verboseFirst') == 'true';

zMap = new ZMap();
var gameId = getUrlParam("game");

$(document).on('keydown', globalKeyPressHandler);

$.getJSON(
  "ajax.php?command=get_container&game=" + gameId,
  zMapInit
);
