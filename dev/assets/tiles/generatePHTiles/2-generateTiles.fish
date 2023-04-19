#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint '2-generateTiles START';

set -l SDIR (readlink -f (dirname (status filename)));

if test -n "$zoomLevelsJSON"
  set zoomLevels (echo "$zoomLevelsJSON" | jq -r '.[]');
  # debugPrint "zoomLevels: $zoomLevels";
  # debugPrint -n "count zoomLevels: "; and debugPrint (count $zoomLevels);
end

if test -z "$zoomLevels"
  if test \
        -z "$zStart" \
    -o  -z "$zEnd"
    errorPrint 'Missing required parameter; exiting...';
    errorPrint "zStart: $zStart";
    errorPrint "zEnd: $zEnd";

    exit 1;
  end

  set zoomLevels (seq "$zStart" "$zEnd");
end

set scriptGT (readlink -f "$SDIR/3-generateTile.fish");

if test \
      -n "$xStart"  \
  -a  -n "$xEnd"    \
  -a  -n "$yStart"  \
  -a  -n "$yEnd"
  set xStartOrig  "$xStart" ;
  set xEndOrig    "$xEnd"   ;
  set yStartOrig  "$yStart" ;
  set yEndOrig    "$yEnd"   ;
end
set -e xStart xEnd yStart yEnd;

pushd "$outDir";

# debugPrint "zStart: $zStart";
# debugPrint "zEnd: $zEnd";
for z in $zoomLevels
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
        -n "$xStartOrig"  \
    -a  -n "$xEndOrig"    \
    -a  -n "$yStartOrig"  \
    -a  -n "$yEndOrig"
    set xStart  "$xStartOrig" ;
    set xEnd    "$xEndOrig"   ;
    set yStart  "$yStartOrig" ;
    set yEnd    "$yEndOrig"   ;
  else
    set numAxisTiles (echo "2 ^ $z" | bc);
    # debugPrint "numAxisTiles: $numAxisTiles";
    set axisEndIndex (echo "$numAxisTiles" - 1 | bc);
    # debugPrint "axisEndIndex: $axisEndIndex";

    set xStart  '0';
    set xEnd    "$axisEndIndex";
    set yStart  '0';
    set yEnd    "$axisEndIndex";
    # debugPrint "xStart: $xStart";
    # debugPrint "xEnd: $xEnd";
    # debugPrint "yStart: $yStart";
    # debugPrint "yEnd: $yEnd";
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

  set -e xStart xEnd yStart yEnd;
end

popd;

# debugPrint '2-generateTiles END';
