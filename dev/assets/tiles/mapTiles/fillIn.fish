#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/altPushd.fish"  ;
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/errorPrint.fish";
source "$SDIR/../../../scripts/common/timing.fish"    ;

set timerScope 'FillIn';

if not source "$SDIR/../0-config-zoom.fish"
  return 1;
end

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

for z in $processZoomLevels
  # debugPrint "z: $z";
  
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
  
  if test "$xStart" -lt '0' -o "$yStart" -lt '0'
    errorPrint 'The following variables should not be lower than 0; exiting...';
    errorPrint "xStart: $xStart";
    errorPrint "yStart: $yStart";
    return 2;
  end
  if test "$xEnd" -gt "$axisEndIndex" -o "$yEnd" -gt "$axisEndIndex"
    errorPrint "The following variables should not be greater than the axisEndIndex \"$axisEndIndex\" for zoom level \"$z\"; exiting...";
    errorPrint "xEnd: $xEnd";
    errorPrint "yEnd: $yEnd";
    return 2;
  end
  
  # debugPrint "xStart: $xStart";
  # debugPrint "xEnd  : $xEnd"  ;
  # debugPrint "yStart: $yStart";
  # debugPrint "yEnd  : $yEnd"  ;
  
  # timerStart;
  # set -S timeStart
  # debugPrint "timeStart: $timeStart";
  timerStart "$timerScope";
  # set -S timeStartArrFillIn
  # debugPrint "timeStartArrFillIn: $timeStartArrFillIn";
  # exit
  for x in (seq "$xStart" 1 "$xEnd")
    # debugPrint "x: $x";
    for y in (seq "$yStart" 1 "$yEnd")
      # debugPrint "y: $y";
      
      # if test "$dryRun" = 'true'
      #   echo 'Skipping execution due to dry run setting being enabled...';
      # else
      "$SDIR/cropTile.fish" "$z" "$x" "$y";
      # end
      # exit
    end
  end
  timerStop "$timerScope";
  # debugPrint "timerDuration: "(timerDuration);
  echo 'Took '(timerDuration "$timerScope")' seconds to process.';
  # timerDuration > "$timeFilePath";
end
