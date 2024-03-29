#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# Dependencies: magick/ImageMagick, bc, ...

set -l SDIR (readlink -f (dirname (status filename)));



## General Function Library
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/userWaitConditional.fish";



## Set-up
begin
  # Flags
  test -z "$force";             and set force             "false"   ;
  test -z "$manualStep";        and set manualStep        "false"   ;
  test -z "$outputZoomFolders"; and set outputZoomFolders "false"   ;
  test -z "$outputAxisFolders"; and set outputAxisFolders "false"   ;

  # Direct (Required) Input
  test -z "$srcFile"    ;       and set -x srcFile        "$argv[1]";
  test -z "$outDir"     ;       and set -x outDir         "$argv[2]";
  test -z "$cleanFirst" ;       and set cleanFirst        "$argv[3]";
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

  test -z "$tileSize"; and set -x tileSize "256";

  if test "$isPHType" = 'true'
    set availableSteps "2" "generateTiles";
  else
    set availableSteps "2" "3" "createBaseZoomImages" "cropTiles";
    # "listFinishedGames" # ?
  end

  test -z "$processSteps"; and set processSteps $availableSteps;
  if begin;
    test (count $processSteps) -eq 1;
    and echo "$processSteps" | grep -q " ";
  end
    set processSteps (echo "$processSteps" | tr ' ' '\n');
  end

  for step in $processSteps
    if not echo "$availableSteps" | grep -q "\b$step\b"
      echo "Error: Step \"$step\" not valid.";
      echo "Valid choices are: \""(string join "\", \"" $availableSteps)"\"";
      echo "Exiting...";
      return 3;
    end
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
  	find "$outDir" \
      -regextype posix-extended \
      -maxdepth 1 \
      -type d \
      -iregex '.*?/[0-9]+$' \
      -exec rm -rf '{}' \; \
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
if test -z "$zoomLevels";
  if not source "$SDIR/1-determineMaxDim.fish"
    return;
  end
  userWaitConditional;
end
# debugPrint "zoomLevels: $zoomLevels";

if test "$isPHType" = 'true'
  if echo "$processSteps" | grep -qP "((2)|(generateTiles))";
    "$SDIR/../generatePHTiles/TLOrigin.fish";
    userWaitConditional;
  end
else
  if echo "$processSteps" | grep -qP "((2)|(createBaseZoomImages))";
    if not "$SDIR/2-createBaseZoomImages.fish"
      return;
    end
    userWaitConditional;
  end

  if echo "$processSteps" | grep -qP "((3)|(cropTiles))";
    if not "$SDIR/3-cropTiles.fish"
      return;
    end
    userWaitConditional;
  end
end
