zMap = new ZMap();
var gameId = getUrlParam("game");

$(document).on('keydown', globalKeyPressHandler);

$.getJSON(
  "ajax.php?command=get_container&game=" + gameId,
  zMapInit
);
