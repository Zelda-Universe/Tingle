#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# Step 2 - Create Base Zoom Images
# Create a canvas for the new dimensions and place the image in the center.
# Iterate down the zoom levels back to the base of 0 with 1 tile lastly,
# each time cutting the image into the appropriate number of tiles that fit.
# (Why do I mention cutting here?  This script only generates the base image.
# Possibly as an example, just worded badly.)
# Using the first generated source image once, later it will resized down by
# half for each stage until it is the size of a single tile for the last stage.

set -l SDIR (readlink -f (dirname (status filename)));

## Header

begin
  source "$SDIR/../../../scripts/common/debugPrint.fish"              ;
  source "$SDIR/../../../scripts/common/errorPrint.fish"              ;
  source "$SDIR/../../../scripts/common/filenameRemoveExtension.fish" ;
  source "$SDIR/../../../scripts/common/timing.fish"                  ;
  source "$SDIR/../z-verbose-magick.fish"                             ;

  if not source "$SDIR/0-config.fish"
    return 1;
  end
  if not source "$SDIR/../0-config-zoom.fish"
    return 2;
  end

  set timeFilePattern "$outTrialsDir/%s/%s";
  # debugPrint "timeFilePattern: $timeFilePattern";

  source "$SDIR/resolveWildcard.fish";
end

# Root debug information
# debugPrint "force: $force";

echo 'Creating base zoom images...';

## Main execution
for zoomLevel in $processZoomLevels
  echo;

	echo "Processing zoom level \"$zoomLevel\"...";

	set numAxisTiles       (echo "2 ^ $zoomLevel"            | bc) ;
  set scale              (echo "scale=8; 100 / (2 ^ ($zoomLevels - $zoomLevel))" | bc) ;
	set zoomDim            (echo "$numAxisTiles * $tileSize" | bc) ;
	set zoomDims           "$zoomDim"x"$zoomDim"                   ;
	set currentExtFileName (printf "$tmpFitFileMask" "$zoomLevel") ;
  set currentExtFile     "$outWorkDir/$currentExtFileName"       ;

  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

	# Iteration debug information
  # debugPrint "zoomLevel     : $zoomLevel"     ;
  # debugPrint "numAxisTiles  : $numAxisTiles"  ;
  # debugPrint "scale         : $scale"         ;
  # debugPrint "tileSize      : $tileSize"      ;
  # debugPrint "zoomDim       : $zoomDim"       ;
  # debugPrint "zoomDims      : $zoomDims"      ;
  # debugPrint "currentExtFile: $currentExtFile";

	# Create base square image to cut.
  # https://legacy.imagemagick.org/Usage/thumbnails/#fit_summery
  # Don't need those tricks though, since we are forcing a known specific size.
  # https://legacy.imagemagick.org/Usage/resize/#enlarge

  if test "$dryRun" = 'true'
    echo 'Skipping execution and timing due to dry run setting being enabled...';
    return;
  end
	if test ! -e "$currentExtFile" -o "$force" = "true"
    if test ! -e "$currentExtFile"
      echo -n 'Padded file does not already exist';
    else if "$force" = "true"
  	  echo -n 'force has been specified';
    end
    echo '; generating...';

    set srcFileOpts "";
  	if test "$zoomLevel" -lt "$zoomLevels"
      echo "Not the max zoom level; resizing and padding...";
  		set srcFileOpts     \
        -define "jpeg:size=$zoomDims" \
        "$srcFile"        \
        # -density '72'         \
        -set density '72'         \
        -scale "$scale%"  \
      ;
      set timeFileName "3 - Resizing & Padding.txt";
  	else if test "$zoomLevel" -eq "$zoomLevels"
      echo "Max zoom level; padding..."   ;
      set srcFileOpts  "$srcFile"         ;
  		set timeFileName "3 - Padding.txt";
  	end
    if test "$zoomLevel" -gt "$zLLimit"
      set timeFileName (echo "$timeFileName" | sed 's|3|3a|');
    end
    set timeFilePath (printf "$timeFilePattern" "$zoomLevel" "$timeFileName");
    # debugPrint "timeFilePath: $timeFilePath";

    timerStart;
    "$imageProg" convert            \
      $monitorOpts                  \
      -background "transparent"     \
      $srcFileOpts                  \
      -gravity    "center"          \
      -extent     "$zoomDims"       \
      +repage                       \
      "$currentExtFile"             \
    ;
    timerStop;
    timerDurationReportAndSave "$timeFilePath";

    if test ! -e "$currentExtFile"
      errorPrint 'Could not create base image; unknown Magick error.';
      errorPrint "status: $status";
      errorPrint "currentExtFile: $currentExtFile";

      return 4;
    end
  else
    echo 'Padded file already exists and force not specified; skipping generation...';
  end

  if test ! -e "$currentExtFile"
    errorPrint 'Base padded file still does not exist; exiting...';
    return 5;
  end

  if test \
        "$zoomLevel"      -gt "$zLLimit"  \
    -a  "$reduceJob"      !=  'true'      \
    -a  "$forceBigJob"    !=  'true'      \
    -a  "$forceReduceJob" !=  'true'
    errorPrint "Skipping zoom level \"$zoomLevel\" since it is greater than the recommended limit of \"$zLLimit\"...";;
    continue;
  end

  if test \(                              \
      \(                                  \
            "$zoomLevel"  -le "$zLLimit"  \
        -o  "$forceBigJob"  = 'true'      \
      \)                                  \
      -a  "$reduceJob"      = 'true'      \
      \)                                  \
    -o "$forceReduceJob"    = 'true'
    echo 'Creating additional smaller files from the base padded image in case it helps since the reduceJob or forceReduceJob setting is enabled...';

    set folder (filenameRemoveExtension "$currentExtFile");
    test ! -d "$folder";
    and mkdir "$folder";
    # debugPrint "folder: $folder";

    set -x outDir                     "$folder"               ;
    set -x processZoomLevels          "$zoomLevel"            ;
    set -x rows                       'true'                  ;
    set -x workFiles                  'true'                  ;

    "$SDIR/3-cropTiles.fish";
  end
end
