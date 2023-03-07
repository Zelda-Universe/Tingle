#!/usr/bin/env fish

set SDIR "$PWD/"(dirname (status filename));

pushd "$SDIR/../../../tiles";

## BotW
mkdir -p "botw/hyrule";
"$SDIR/generateMapTiles.fish" \
  "$SDIR/switch/games/botw/Maps/3/Default/Map.png" \
  "botw/hyrule" \
;
