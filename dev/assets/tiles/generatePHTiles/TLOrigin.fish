#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# set SDIR "$PWD/"(dirname (status filename));
set SDIR (dirname (status filename));
# TODO add mode, have centered, really need TL origin 2^(zoom*2) images only incrementing, no negative values, don't know where i got that idea...., so basically all even amounts except for ZL = 0
source "$SDIR/../0-detect.fish";
source "$SDIR/1-config.fish";

# This is for a more focused approach when you know the exact zoom level to support.

if test -z "$zoomLevels"
  if test -n "$zoomLevel"
    debugPrint "zoomLevel: $zoomLevel";
    # set zoomLevels "$zoomLevel";
  end
  if test -n "$zoomLevelMax"
    # debugPrint "zoomLevelMax: $zoomLevelMax";
    set zoomLevels (seq 0 1 "$zoomLevelMax");
  end

  if test -z "$zoomLevels"
    errorPrint 'No zoomLevels, zoomLevel, or zoomLevelMax specified, or invalid value(s) given; exiting...';
    errorPrint "zoomLevels: $zoomLevels";
    errorPrint "zoomLevel: $zoomLevel";
    errorPrint "zoomLevelsMax: $zoomLevelsMax";
    exit 3;
  else
    set -e zoomLevel;
  end
end

set outDir "$SDIR/../../../../tiles/_placeholder";
test ! -e "$outDir"; and mkdir "$outDir";
pushd "$outDir";

echo 'Generating placeholder tiles...';

# for z in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
for zoomLevel in $zoomLevels
  set z "$zoomLevel";
  test "$outputZoomFolders" = 'true' -a ! -d "$z";
  and mkdir -- "$z";

  set numAxisTiles (echo "2 ^ $zoomLevel" | bc);

  for y in (seq 0 "$numAxisTiles")
    for x in (seq 0 "$numAxisTiles")
      eval set -l pathName  "$pathNameMask";
      eval set -l label     "$labelMask";
      # debugPrint "pathName: $pathName";
      set -l filePath "$pathName.$fileExt";
      # debugPrint "filePath: $filePath";

      test -e "$filePath" -a "$force" != 'true'; and continue;

      convert \
        -background   "$background"           \
        -font         "$font"                 \
        -fill         "$fill"                 \
        -size         {$tileSize}x{$tileSize} \
        -pointsize    "$pointsize"            \
        -gravity      "$gravity"              \
        -bordercolor  "$bordercolor"          \
        -border       "$bordersize"           \
        "label:$label"                        \
        "$filePath"                           \
      ;
    end
    # break;
  end
end

popd;
