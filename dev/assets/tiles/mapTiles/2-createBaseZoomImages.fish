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

  if test -z "$zoomLevels"
    errorPrint 'Detected zoomLevels for the image is empty; exiting...';
    return 3;
  end
  set availableZoomLevels (seq 0 1 $zoomLevels);
  # debugPrint "availableZoomLevels: $availableZoomLevels";
  # debugPrint "count availableZoomLevels: "(count $availableZoomLevels);
  
  test -z "$processZoomLevels" -o "$processZoomLevels" = '*';
  and set processZoomLevels $availableZoomLevels;
  # debugPrint "processZoomLevels: $processZoomLevels";
  # debugPrint "count processZoomLevels: "(count $processZoomLevels);

  ## After Derived/Cleaned / Other Input Validation?
  # May have just fixed a bug here where it never would have been triggered originally.
  for zoomLevel in $processZoomLevels
    if not echo "$availableZoomLevels" | grep -q "\b$zoomLevel\b"
    echo "Error: Zoom Level \"$zoomLevel\" not valid.";
      echo 'Valid choices for this source image: "'(string join '", "' $availableZoomLevels)'"';
      echo 'Exiting...';
      exit;
    end
  end
end

# Root debug information
# debugPrint "force: $force";

echo 'Creating base zoom images...';

## Main execution
for zoomLevel in $processZoomLevels
  echo;
  
	echo "Processing zoom level \"$zoomLevel\"...";

	set numAxisTiles       (echo "2 ^ $zoomLevel"            | bc) ;
	set zoomDim            (echo "$numAxisTiles * $tileSize" | bc) ;
	set zoomDims           "$zoomDim"x"$zoomDim"                   ;
	set currentExtFileName (printf "$tmpFitFileMask" "$zoomLevel") ;
  set currentExtFile     "$outWorkDir/$currentExtFileName"       ;

  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

	# Iteration debug information
  # debugPrint "zoomLevel: $zoomLevel";
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "tileSize: $tileSize";
  # debugPrint "zoomDim: $zoomDim";
  # debugPrint "zoomDims: $zoomDims";
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
  	echo "Padded file does not already exist, or force has been specified; generating...";

    set srcFileOpts "";
  	if test "$zoomLevel" -lt "$zoomLevels"
      echo "Not the max zoom level; resizing and padding...";
  		set srcFileOpts  \( "$srcFile" -resize "$zoomDims>" \);
      set timeFileName "3 - Resizing & Padding.txt"       ;
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
    magick                          \
      $monitorOpts                  \
      -background "transparent"     \
      $srcFileOpts                  \
      -gravity    "center"          \
      -extent     "$zoomDims"       \
      +repage                       \
      "$currentExtFile" \
    ;
    timerStop;
    timerDurationReportAndSave "$timeFilePath";
    
    if test ! -e "$currentExtFile"
      errorPrint 'Could not create base image; unknown Image Magick error.';
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
    set -x tileFileNamePatternCoords  '%[fx:page.y/256]'      ;
    set -x tileFileNamePattern        "%%[filename:tile].png" ;
    set -x workFiles                  'true'                  ;
    
    "$SDIR/3-cropTiles.fish";
  end
end
