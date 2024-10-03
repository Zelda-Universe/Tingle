#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# Dependencies: gm/GraphicsMagick or magick/ImageMagick, bc, ...

# Useful defaults updates:
# - outputAxisFolders: true

# Useful development configurations:
# - srcFile
# - outDir
# - manualStep
# - processTasks
# - processZoomLevel
# - processZoomLevels
# - processZoomLevelMax
# - allowWildcardZoomLevel 'false'

set -l SDIR (readlink -f (dirname (status filename)));



## General Function Library
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/userWaitConditional.fish";

# debugPrint 'Entering run.fish...';

## Set-up
begin
  # Flags
  test -z "$force";             and set force             "false"   ;
  test -z "$manualStep";        and set manualStep        "false"   ;
  test -z "$outputZoomFolders"; and set outputZoomFolders "false"   ;
  test -z "$outputAxisFolders"; and set outputAxisFolders "false"   ;

  # Direct (Required) Input
  # debugPrint "srcFile: $srcFile";
  # debugPrint "outDir: $outDir";
  test -z "$srcFile"    ;       and set -x srcFile        "$argv[1]";
  test -z "$outDir"     ;       and set -x outDir         "$argv[2]";
  test -z "$cleanFirst" ;       and set cleanFirst        "$argv[3]";
  # debugPrint "srcFile: $srcFile";
  # debugPrint "outDir: $outDir";
  # debugPrint "cleanFirst: $cleanFirst";
  test -z "$cleanFirst" ;       and set cleanFirst        "false"   ;

  # Derived and Static Intermediate Settings

  source "$SDIR/../placeholderTiles/detect.fish" ;
  if not source "$SDIR/0-config.fish"
    return 1;
  end
  if not source "$SDIR/../0-config-zoom.fish"
    return 2;
  end

  test -z "$tileSize";
  and set -x tileSize "256";

  if test "$isPHType" = 'true'
    set availableTasks '1' '2' 'generateTiles';
  else
    set availableTasks        \
      '1' \
      '2' \
      '3' \
      'determineMaxDim'       \
      'createBaseZoomImages'  \
      'cropTiles'             \
    ;
    # "listFinishedGames" # ?
  end
  set -a availableTasks 'none' 'exit' 'quit';

  test -z "$processTasks";
  and set processTasks '1' '2' '3';
  if begin
    test (count $processTasks) -eq 1;
    and echo "$processTasks" | grep -q " ";
  end
    set processTasks (echo "$processTasks" | tr ' ' '\n');
  end

  for step in $processTasks
    if not echo "$availableTasks" | grep -q "\b$step\b"
      echo "Error: Step \"$step\" not valid.";
      echo "Valid choices are: \""(string join "\", \"" $availableTasks)"\"";
      echo "Exiting...";
      return 3;
    end
  end

  source "$SDIR/setImageProg.fish";
  # debugPrint "imageProg: $imageProg";

  set srcFileDir (dirname "$srcFile");
  set mapInfoJSONFile "$srcFileDir/mappingInfo.json";
  # debugPrint "mapInfoJSONFile: $mapInfoJSONFile";
  if test -f "$mapInfoJSONFile"
    set mapInfoJSON (cat "$mapInfoJSONFile");
    # debugPrint "mapInfoJSON: $mapInfoJSON";

    set -x zoomLevels    (echo "$mapInfoJSON" | jq -r '.zoomLevels'  );
    set -x numAxisTiles  (echo "$mapInfoJSON" | jq -r '.numAxisTiles');
    set -x zoomDim       (echo "$mapInfoJSON" | jq -r '.zoomDim'     );
    # debugPrint "zoomLevels  : $zoomLevels"  ;
    # debugPrint "numAxisTiles: $numAxisTiles";
    # debugPrint "zoomDim     : $zoomDim"     ;
  end
  # Settings debug information
  # debugPrint "force: $force";
  # debugPrint "manualStep: $manualStep";
  # debugPrint "outputZoomFolders: $outputZoomFolders";
  # debugPrint "outputAxisFolders: $outputAxisFolders";

  # debugPrint "cleanFirst: $cleanFirst";

  # Optional cleaning preparation step
  if test "$cleanFirst" = "true"
  	echo "Cleaning the output (not work sub-) directory and exiting...";
  	find "$outDir" -maxdepth 1 -type f -iname "*.png" -delete;
  	find "$outDir"                \
      -regextype 'posix-extended' \
      -maxdepth 1                 \
      -type d                     \
      -iregex '.*?/[0-9]+$'       \
      -exec rm -rf '{}' \;        \
    ;
  	userWaitConditional;
  end
end



## Main program execution
# Fit the image into the first highest zoom level it is smaller than by both dimensions.
# Extend the canvas to the power of 2.
# Center the image over the new background.

# All output preparation
mkdir -p "$outWorkDir";
mkdir -p "$outTrialsDir";

# Maybe make step 1 optional only if the user provided a custom argument for it,
# but it's several....
if test -z "$zoomLevels"
  if echo "$processTasks" | grep -qP "((1)|(determineMaxDim))"
    if not source "$SDIR/1-determineMaxDim.fish"
      return;
    end
    userWaitConditional;
  else
    # debugPrint '1-determineMaxDim task not processed.';
  end

  jq -M -n                              \
    --arg zoomLevels    "$zoomLevels"   \
    --arg numAxisTiles  "$numAxisTiles" \
    --arg zoomDim       "$zoomDim"      \
    '
      .zoomLevels=$zoomLevels     |
      .numAxisTiles=$numAxisTiles |
      .zoomDim=$zoomDim
    ' \
    | tee "$mapInfoJSONFile" >/dev/null \
  ;
  userWaitConditional;
end
# debugPrint "zoomLevels: $zoomLevels";

# debugPrint "processTasks: $processTasks";

if test "$isPHType" = 'true'
  if echo "$processTasks" | grep -qP "((2)|(generateTiles))";
    "$SDIR/../generatePHTiles/TLOrigin.fish";
    userWaitConditional;
  else
    # debugPrint '2-generateTiles task not processed.';
  end
else
  if echo "$processTasks" | grep -qP "((2)|(createBaseZoomImages))"
    if not "$SDIR/2-createBaseZoomImages.fish"
      return;
    end
    userWaitConditional;
  else
    # debugPrint '2-createBaseZoomImages task not processed.';
  end

  if echo "$processTasks" | grep -qP "((3)|(cropTiles))"
    if not "$SDIR/3-cropTiles.fish"
      return;
    end
    userWaitConditional;
  else
    # debugPrint '3-cropTiles task not processed.';
  end
end

# debugPrint 'Leaving run.fish...';
