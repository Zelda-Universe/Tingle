#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint 'TLOrigin START';

set -l SDIR (dirname (status filename));
# TODO add mode, have centered, really need TL origin 2^(zoom*2) images only incrementing, no negative values, don't know where i got that idea...., so basically all even amounts except for ZL = 0

# This script is for a more focused approach when you know the exact zoom level to support.

set -x outDir (readlink -f "$SDIR/../../../../tiles/_placeholder");
test ! -e "$outDir"; and mkdir "$outDir";
# debugPrint "pathNameMask: $pathNameMask";
if not source "$SDIR/1-config.fish"
  return 1;
end
if not source "$SDIR/../0-config-zoom.fish"
  return 2;
end
# debugPrint "pathNameMask: $pathNameMask";
# debugPrint -n "export | grep -i pNM: "; and export | grep -i 'pathNameMask';
export fileExt labelMask outputZoomFolders outputAxisFolders pathNameMask;
# debugPrint -n "export | grep -i pNM: "; and export | grep -i 'pathNameMask';

echo 'Generating placeholder tiles from the top-left corner as the origin...';

"$SDIR/2-generateTiles.fish";

# debugPrint 'TLOrigin END';
