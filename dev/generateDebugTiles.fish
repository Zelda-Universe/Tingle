#!/usr/bin/env fish

## Info

# Author: Pysis

# Dependencies:
# - fish shell
# - Basic shell utilities:
#   - variables
#   - subshell
#   - test
#   - eval
#   - seq
#   - set
#   - printf
#   - pushd
#   - popd
#   - exit
#   - break
# - ImageMagick (convert, identify)

set SDIR "$PWD/"(dirname (status filename));

test -z "$outDir"; and set outDir "$argv[1]";

test -z "$numTilesFromCenter"; and set numTilesFromCenter "1";
test -z "$outputZoomFolders"; and set outputZoomFolders "false";

if test -z "$nameMask"
  if test "$outputZoomFolders" = "true"
    set nameMask '{$z}/{$x}_{$y}';
  else
    set nameMask '{$z}_{$x}_{$y}';
  end
end

test -z "$fileNameMask"; and set fileNameMask "%s";
test -z "$background"; and set background "#333344";
test -z "$font"; and set font "$SDIR/../fonts/HyliaSerifBeta-Regular.otf";
test -z "$fill"; and set fill "white";
test -z "$tileSize"; and set tileSize "256";
test -z "$pointsize"; and set pointsize "48";
test -z "$gravity"; and set gravity "center";
test -z "$bordercolor"; and set bordercolor '#999999';
test -z "$bordersize"; and set bordersize "5";

# I intentionally check this instead of creating it for the user in case
# they provide the wrong argument by accident.  Don't want to create a mess
# for them somewhere in some unintentional place.
if test -z "$outDir" -o ! -e "$outDir" -o ! -d "$outDir"
  echo "Error: Output directory must be provided as the first argument, exist, and be a directory.";
  exit;
end

pushd "$outDir" > /dev/null;

for z in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
  test ! -d "$z"; and mkdir -- "$z";
  for x in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
    for y in (seq "-$numTilesFromCenter" "$numTilesFromCenter")
      eval set name $nameMask;
      set -l fileName "$name.png"
      convert \
        -background $background \
        -font "$font" \
        -fill $fill \
        -size {$tileSize}x{$tileSize} \
        -pointsize $pointsize \
        -gravity $gravity \
        -bordercolor $bordercolor \
        -border $bordersize \
        "label:$name" \
        "$fileName" \
      ;
    end
    break;
  end
end

popd > /dev/null;
