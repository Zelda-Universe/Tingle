#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

pushd "$SDIR/../../../tiles";

test -z "$processZoomLevels"; and set -x processZoomLevels '*';
# debugPrint "processZoomLevels: $processZoomLevels";


## BotW
set subMapDir "botw/hyrule";
if test -e "$subMapDir"
  if test -L "$subMapDir"
    errorPrint 'Sub map directory already exists, and is a link; unlink before executing this script; exiting...';
    exit 1;
  end
else
  mkdir -p "$subMapDir";
end

test -z "$resLevelChoice"; and set resLevelChoice '0';

"$SDIR/generateMapTiles/run.fish" \
  "$SDIR/switch/games/botw/Maps/$resLevelChoice/Default/Map.png" \
  "botw/hyrule" \
;
