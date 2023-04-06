#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR "$PWD/"(dirname (status filename));

source "$SDIR/1-config.fish";

# For better accuracy, use the more dynamic per zoom level script in `generateMapTiles/run.fish` using any of the valid '<placeholder>' alternative source file names or `generatePHTiles` flag.
# This is for a more focused approach when you know more of the parameters per zoom level, and use a different approach than the current map software configuration.
test -z "$numTilesFromCenter"; and set numTilesFromCenter '1';

pushd "$outDir" > /dev/null;

for z in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
  test "$outputZoomFolders" = 'true' -a ! -d "$z";
  and mkdir -- "$z";

  for y in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
    for x in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
      eval set -l pathName "$pathNameMask";
      # debugPrint "pathName: $pathName";
      set -l filePath "$pathName.$fileExt";
      # debugPrint "filePath: $filePath";
      convert \
        -background   "$background"   \
        -font         "$font"         \
        -fill         "$fill"         \
        -size         {$tileSize}x{$tileSize} \
        -pointsize    "$pointsize"    \
        -gravity      "$gravity"      \
        -bordercolor  "$bordercolor"  \
        -border       "$bordersize"   \
        "label:$pathName"             \
        "$filePath"                   \
      ;
    end
    # break;
  end
end

popd > /dev/null;
