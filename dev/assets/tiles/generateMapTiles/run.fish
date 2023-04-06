#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# Dependencies: magick/ImageMagick, bc, ...

# debugPrint 'status filename: '(status filename);
# set SDIR "$PWD/"(dirname (status filename));
set SDIR (dirname (status filename));
# debugPrint "SDIR: $SDIR";

## General Function Library
source "$SDIR/../../../scripts/common/altPrint.fish";
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/userWaitConditional.fish";

## Set-up
begin
  # Flags
  test -z "$force"; and set force                         "false";
  test -z "$manualStep"; and set manualStep               "false";
  test -z "$outputZoomFolders"; and set outputZoomFolders "false";

  # Direct (Required) Input
  test -z "$srcFile"    ; and set srcFile     "$argv[1]";
  test -z "$outDir"     ; and set outDir      "$argv[2]";
  test -z "$cleanFirst" ; and set cleanFirst  "$argv[3]";
  # debugPrint "cleanFirst: $cleanFirst";
  test -z "$cleanFirst" ; and set cleanFirst  "false"   ;

  # Derived and Static Intermediate Settings
  test -z "$outWorkDir"; and set outWorkDir (dirname "$srcFile")"/Work";
  test -z "$outTrialsDir"; and set outTrialsDir (dirname "$srcFile")"/Trials/2 - Cutting";
  set srcFileNameSuffix (basename "$srcFile" | sed -r 's|(\.[^.]*?)$| - Extented - Zoom %s\1|g');
  test -z "$tmpFitFileMask"; and set tmpFitFileMask "$outWorkDir/$srcFileNameSuffix";
  test -z "$tileSize"; and set tileSize "256";
  test -z "$tileFileNamePatternCoords"; and set tileFileNamePatternCoords "%[fx:page.x/$tileSize]_%[fx:page.y/$tileSize]";
  if test -z "$tileFileNamePatternMask"
  	if test "$outputZoomFolders" = "true"
  		set tileFileNamePatternMask "%s/%%[filename:tile].png";
  	else
  		set tileFileNamePatternMask "%s_%%[filename:tile].png";
  	end
  end

  set availableSteps "2" "3" "listFinishedGames";
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
      exit;
    end
  end

  set processZoomLevels (
    string split ' ' (echo "$processZoomLevels" | tr ',' ' ')
  );
  for zoomLevel in $processZoomLevels
    if echo "$zoomLevel" | grep -v '[-0-9*]'
      echo "Error: Zoom level \"$zoomLevel\" is invalid; only enter integers with optional hyphens; exiting...";
      exit;
    end

    if test "$zoomLevel" = '*'
      set newProcessZoomLevels "$zoomLevel"
      break;
    end

    set range (string split '-' $zoomLevel);
    if test (count $range) -gt 1
      set expandedRange "";
      if test "$range[1]" -gt "$range[2]"
        set expandedRange (seq "$range[2]" 1 "$range[1]");
      else
        set expandedRange (seq "$range[1]" 1 "$range[2]");
      end
      set -a newProcessZoomLevels $expandedRange;
    else
      set -a newProcessZoomLevels "$zoomLevel";
    end
  end
  set processZoomLevels $newProcessZoomLevels;

  # Settings debug information
  # debugPrint "force: $force";
  # debugPrint "manualStep: $manualStep";
  # debugPrint "outputZoomFolders: $outputZoomFolders";

  # debugPrint "srcFile: $srDir";
  # debugPrint "cleanFirst: $cleanFirst";

  # debugPrint "outWorkDir: $outWorkDir";
  # debugPrint "outTrialsDir: $outTrialsDir";

  # debugPrint "srcFileNameSuffix: $srcFileNameSuffix";
  # debugPrint "tmpFitFileMask: $tmpFitFileMask";
  # debugPrint "tileSize: $tileSize";
  # debugPrint "tileFileNamePatternCoords: $tileFileNamePatternCoords";
  # debugPrint "tileFileNamePatternMask: $tileFileNamePatternMask";

  # debugPrint "availableSteps: $availableSteps";
  # debugPrint "processSteps: $processSteps";
  # debugPrint "processZoomLevels: $processZoomLevels";
  # debugPrint "count processZoomLevels: "(count $processZoomLevels);

  # Optional cleaning preparation step
  if test "$cleanFirst" = "true"
  	echo "Cleaning the output (not work sub-) directory and exiting...";
  	find "$outDir" -maxdepth 1 -type f -iname "*.png" -delete;
  	find "$outDir" -regextype posix-extended -maxdepth 1 -type d -iregex '.*?/[0-9]+$' -exec rm -rf '{}' \; ;
  	userWaitConditional;
  end

  # Required settings validation

  # I intentionally check this instead of creating it for the user in case
  # they provide the wrong argument by accident.  Don't want to create a mess
  # for them somewhere in some unintentional place.
  if test -z "$outDir" -o ! -e "$outDir" -o ! -d "$outDir"
  	echo "Error: Output directory must be provided as the second argument, exist, and be a directory.";
  	exit;
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
source "$SDIR/1-determineMaxDim.fish";
userWaitConditional;

if \
  test "$isPHType" != 'true';
  and echo "$processSteps" | grep -qP "((2)|(createBaseZoomImages))";
  "$SDIR/2-createBaseZoomImages.fish";
  userWaitConditional;
end

if test "$isPHType" = 'true'
  if echo "$processSteps" | grep -qP "((2)|(generateTiles))";
    "$SDIR/../generatePHTiles/BasicTLOrigin.fish";
    userWaitConditional;
  end
else
  if echo "$processSteps" | grep -qP "((3)|(cropTiles))";
    "$SDIR/2-cropTiles.fish";
    userWaitConditional;
  end
end
