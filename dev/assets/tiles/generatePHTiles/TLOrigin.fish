#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint 'TLOrigin START';

# set SDIR "$PWD/"(dirname (status filename));
set SDIR (dirname (status filename));
# TODO add mode, have centered, really need TL origin 2^(zoom*2) images only incrementing, no negative values, don't know where i got that idea...., so basically all even amounts except for ZL = 0

# This is for a more focused approach when you know the exact zoom level to support.

if test -z "$zoomLevels"
  if test -n "$zoomLevel"
    # debugPrint "zoomLevel: $zoomLevel";
    # set zoomLevels "$zoomLevel";
  end
  if test -n "$zoomLevelMax"
    # debugPrint "zoomLevelMax: $zoomLevelMax";
    set zoomLevels (seq 0 1 "$zoomLevelMax");
  end

  if test \
    -z "$zoomLevels"
    -a -z "$zoomLevel" \
    -a -z "$zoomLevelMax"
    errorPrint 'No zoomLevels, zoomLevel, or zoomLevelMax specified, or invalid value(s) given; exiting...';
    errorPrint "zoomLevels: $zoomLevels";
    errorPrint "zoomLevel: $zoomLevel";
    errorPrint "zoomLevelsMax: $zoomLevelsMax";
    exit 3;
  else
    set -e zoomLevel;
  end
end

set -x outDir (readlink -f "$SDIR/../../../../tiles/_placeholder");
test ! -e "$outDir"; and mkdir "$outDir";
# debugPrint "pathNameMask: $pathNameMask";
source "$SDIR/1-config.fish";
# debugPrint "pathNameMask: $pathNameMask";
# debugPrint -n "export | grep -i pNM: "; and export | grep -i 'pathNameMask';
export fileExt labelMask outputZoomFolders outputAxisFolders pathNameMask;
# debugPrint -n "export | grep -i pNM: "; and export | grep -i 'pathNameMask';

echo 'Generating placeholder tiles from the top-left corner as the origin...';

set -x zStart  "0"            ;
set -x zEnd    "$zoomLevelMax";

"$SDIR/2-generateTiles.fish";

# debugPrint 'TLOrigin END';
