#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint '2-generateTiles START';

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/altPushd.fish"  ;
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/errorPrint.fish";

if test -n "$zoomLevelsJSON"
  set processZoomLevels (
    echo "$zoomLevelsJSON" \
    | jq -r '.[]' \
    | tr -d '\r'
  );
  # debugPrint "processZoomLevels: $processZoomLevels";
  # debugPrint -n "count processZoomLevels: "; and debugPrint (count $zoomLevels);
end

if test -z "$processZoomLevels"
  if test \
        -z "$zStart" \
    -o  -z "$zEnd"
    errorPrint 'Missing required parameter; exiting...';
    errorPrint "zStart: $zStart";
    errorPrint "zEnd: $zEnd";

    exit 1;
  end

  set processZoomLevels (seq "$zStart" "$zEnd");
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

altPushd "$outDir";

# debugPrint "zStart: $zStart";
# debugPrint "zEnd: $zEnd";
for z in $processZoomLevels
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

  set numAxisTiles (echo "2 ^ $z"             | bc);
  set axisEndIndex (echo "$numAxisTiles" - 1  | bc);
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "axisEndIndex: $axisEndIndex";

  test -n         "$xStartOrig"   ;
  and set xStart  "$xStartOrig"   ;
  or  set xStart  '0'             ;
  test -n         "$xEndOrig"     ;
  and set xEnd    "$xEndOrig"     ;
  or  set xEnd    "$axisEndIndex" ;
  test -n         "$yStartOrig"   ;
  and set yStart  "$yStartOrig"   ;
  or  set yStart  '0'             ;
  test -n         "$yEndOrig"     ;
  and set yEnd    "$yEndOrig"     ;
  or  set yEnd    "$axisEndIndex" ;

  # debugPrint "xStart: $xStart";
  # debugPrint "xEnd  : $xEnd"  ;
  # debugPrint "yStart: $yStart";
  # debugPrint "yEnd  : $yEnd"  ;

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
