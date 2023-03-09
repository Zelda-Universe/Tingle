#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR "$PWD/"(dirname (status filename));

pushd "$SDIR/../../../tiles";

## BotW
mkdir -p "botw/hyrule";
"$SDIR/generateMapTiles.fish" \
  "$SDIR/switch/games/botw/Maps/3/Default/Map.png" \
  "botw/hyrule" \
;
