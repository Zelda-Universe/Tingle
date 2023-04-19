#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/debugPrint.fish"          ;
source "$SDIR/../../../scripts/common/errorPrint.fish"          ;
source "$SDIR/../../../scripts/common/timing.fish"              ;
source "$SDIR/../../../scripts/common/userWaitConditional.fish" ;

set timeFilePattern "$outTrialsDir/%s/4 - Cutting.txt";

echo 'Cropping tiles...';

pushd "$outDir";

set processZoomLevels (
  string split ' ' (echo "$processZoomLevels" | tr ',' ' ')
);
# debugPrint "processZoomLevels: $processZoomLevels";
# debugPrint "count processZoomLevels: "(count $processZoomLevels);

if test -z "$processZoomLevels"
  if test -z "$processZoomLevelsMax"
    errorPrint 'No processZoomLevels as a list of zoom levels to process, or processZoomLevelsMax as an integer of the maximum zoom level to process, provided; exiting...';
    return 3;
  end
end

if test "$processZoomLevels" = '*' -o -n "$processZoomLevelsMax"
  set processZoomLevels (seq 0 1 "$processZoomLevelsMax");
end

if test -z "$processZoomLevels"
  errorPrint 'Possible invalid value given, exiting...';
  errorPrint "processZoomLevels: $processZoomLevels";
  errorPrint "processZoomLevelsMax: $processZoomLevelsMax";
  return 4;
end

if test -z "$tileFileNamePatternCoords"
  if test "$outputAxisFolders" = "true"
    set tFNPCXYDelim '/';
  else
    set tFNPCXYDelim '_';
  end

  set -x tileFileNamePatternCoords \
    "%[fx:page.x/$tileSize]$tFNPCXYDelim%[fx:page.y/$tileSize]" \
  ;
end
# debugPrint "tileFileNamePatternCoords: $tileFileNamePatternCoords";

if test -z "$tileFileNamePattern"
  if test \
        "$outputAxisFolders" = "true" \
    -o  "$outputZoomFolders" = "true"
    set -x tileFileNamePattern "%s/%%[filename:tile].png";
  else
    set -x tileFileNamePattern "%s_%%[filename:tile].png";
  end
end
# debugPrint "tileFileNamePattern: $tileFileNamePattern";

for zoomLevel in $processZoomLevels
  echo;
	echo "Processing zoom level \"$zoomLevel\"...";
  # debugPrint "zoomLevel: $zoomLevel";

  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

  set numAxisTiles    (echo   "2 ^ $zoomLevel"     | bc     );
  set axisEndIndex    (echo   "$numAxisTiles" - 1  | bc     );
  set currentExtFile  (printf "$tmpFitFileMask" "$zoomLevel");
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "axisEndIndex: $axisEndIndex";
  # debugPrint "currentExtFile: $currentExtFile";

  ## Make root zoom (Z) dir, if does not exist and setting is enabled.
  if test \
        "$outputAxisFolders" = "true" \
  	-o  "$outputZoomFolders" = "true"
		if test -d "$zoomLevel"
			# echo "Current zoom level folder already exists, and force has not been specified; skipping...";
			# continue;
		else
			mkdir "$zoomLevel";
		end
  end

  ## Axis (X) sub dir iteration, if setting is enabled,
  # to make if they don't exist, or if they do, check if they
  # already contain files to skip processing.
  if test "$outputAxisFolders" = "true"
    for x in (seq 0 1 $axisEndIndex)
      # debugPrint "x: $x";

      set indexDir "$zoomLevel/$x";
      # debugPrint "indexDir: $indexDir";
      if test -d "$indexDir";
        find                        \
          "$indexDir"               \
          -maxdepth 1               \
          -type f                   \
          -iname "*.png"            \
        | head -n 1                 \
        | read firstFile            \
        ;
      else
        mkdir "$indexDir";
      end
    end
  else
    if test "$outputZoomFolders" = "true"
      set dir "$zoomLevel";
    else
      set dir ".";
    end
    # debugPrint "dir: $dir";

    find                        \
      "$dir"                    \
      -maxdepth 1               \
      -type f                   \
      -iname "*.png"            \
    | head -n 1                 \
    | read firstFile            \
    ;
  end
  # debugPrint "firstFile: $firstFile";
  
	if test -n "$firstFile" -a "$force" != "true"
		echo 'Current zoom level already contains at least 1 file, and force has not been specified; skipping...';
    set -e firstFile;
		continue;
  else
    echo 'Current zoom level does not contain any files, or force has been specified; continuing...';
	end

	set tileFileName (
    printf "$tileFileNamePattern" "$zoomLevel"
  );
  # debugPrint "tileFileName: $tileFileName";
  # pwd
  
  set timeFilePath (printf "$timeFilePattern" "$zoomLevel");
  # debugPrint "timeFilePath: $timeFilePath";
  
  timerStart;
  # time
  magick \
		"$currentExtFile"                                 \
		-crop {$tileSize}x{$tileSize}                     \
		-set 'filename:tile' "$tileFileNamePatternCoords" \
		+adjoin                                           \
		"$tileFileName"                                   \
  ;
  # echo "$CMD_DURATION" > "$timeFile";
  timerStop;
  # debugPrint "timerDuration: "(timerDuration);
  echo 'Took '(timerDuration)' seconds to process.';
  timerDuration > "$timeFilePath";
  
  set createdFilesCount (
    find                        \
      "$indexDir"               \
      -maxdepth 1               \
      -type f                   \
      -iname "*.png"            \
    | wc -l
  );
  # debugPrint "createdFilesCount: $createdFilesCount";
  
  if test -z "$createdFilesCount" -o "$createdFilesCount" -lt '1'
    errorPrint 'Could not create cropped images; unknown Image Magick error.';
    errorPrint "createdFilesCount: $createdFilesCount";
  end

	userWaitConditional;
end

popd;
