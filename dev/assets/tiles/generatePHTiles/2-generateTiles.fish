#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint '2-generateTiles START';

set SDIR (dirname (status filename));

if test \
      -z "$zStart" \
  -o  -z "$zEnd"
  errorPrint 'Missing required parameter; exiting...';
  errorPrint "zStart: $zStart";
  errorPrint "zEnd: $zEnd";

  exit 1;
end
# debugPrint "pathNameMask: $pathNameMask";

set scriptGT (readlink -f "$SDIR/3-generateTile.fish");

pushd "$outDir";

for z in (seq "$zStart" "$zEnd")
  # debugPrint "z: $z";

  if test \( \
          "$outputZoomFolders" = 'true' \
      -o  "$outputAxisFolders" = 'true' \
    \) \
    -a ! -d "$z"
    mkdir -- "$z";
  else
    # debugPrint 'no mkdir z';
  end

  if test \
        -z "$xStart"  \
    -o  -z "$xEnd"    \
    -o  -z "$yStart"  \
    -o  -z "$yEnd"
    set numAxisTiles (echo "2 ^ $z" | bc);
    # debugPrint "numAxisTiles: $numAxisTiles";

    set xStart  '0';
    set xEnd    "$numAxisTiles";
    set yStart  '0';
    set yEnd    "$numAxisTiles";
  end

  for x in (seq "$xStart" "$xEnd")
    # debugPrint "x: $x";

    if test \
      "$outputAxisFolders" = 'true' \
      -a ! -d "$z/$x";
      mkdir -- "$z/$x";
    else
      # debugPrint 'no mkdir z/x';
    end

    for y in (seq "$yStart" "$yEnd")
      # debugPrint "y: $y";

      eval set -l pathName "$pathNameMask";
      # debugPrint "pathName: $pathName";
      set -xl filePath "$pathName.$fileExt";
      # debugPrint "filePath: $filePath";
      eval set -xl label "$labelMask";
      # debugPrint "label: $label";

      # debugPrint '2-generateTiles before continue';
      test \
        -e "$filePath" \
        -a "$force" != 'true';
      and continue;
      # debugPrint '2-generateTiles after continue';

      "$scriptGT";

      # break;
    end
    # break;
  end
end

popd;

# debugPrint '2-generateTiles END';
