#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR (readlink -f (dirname (status filename)));

echo 'Cropping tiles...';

pushd "$outDir";

if test -z "$processZoomLevels"
  if test -z "$processZoomLevelsMax"
    errorPrint 'No processZoomLevels as a list of zoom levels to process, or processZoomLevelsMax as an integer of the maximum zoom level to process, provided; exiting...';
    return 3;
  end
end

if test -z "$processZoomLevels" = '*' -o -n "$processZoomLevelsMax"
  set processZoomLevels (seq 0 1 "$processZoomLevelsMax");
end

if test -z "$processZoomLevels"
  errorPrint 'Possible invalid value given, exiting...';
  errorPrint "processZoomLevels: $processZoomLevels";
  errorPrint "processZoomLevelsMax: $processZoomLevelsMax";
  return 4;
end

for zoomLevel in $processZoomLevels
  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

  set currentExtFile (printf "$tmpFitFileMask" "$zoomLevel");
  set workFile "$currentExtFile";
  # debugPrint "currentExtFile: $currentExtFile";
  # debugPrint "workFile: $workFile";

	if test "$outputZoomFolders" = "true";
		if test -d "$zoomLevel" -a "$force" != "true" # TODO: add first file here too
			echo "Current zoom level folder already exists, and force has not been specified; skipping...";
			continue;
		else
			mkdir "$zoomLevel";
		end
	else
		find -maxdepth 1 -type f -iname "$zoomLevel*.png" \
    | head -n 1       \
    | read firstFile  \
    ;
		if test -n "$firstFile" -a "$force" != "true"
			echo "Current zoom level already contains at least 1 file, and force has not been specified; skipping...";
			continue;
		end
	end

	set tileFileNamePattern (
    printf "$tileFileNamePatternMask" "$zoomLevel"
  );
	# debugPrint "tileFileNamePattern: $tileFileNamePattern";

	time magick \
		"$workFile"                                     \
		-crop {$tileSize}x{$tileSize}                   \
		-set 'filename:tile' "$tileFileNamePatternCoords" \
		+adjoin                                         \
		"$tileFileNamePattern"                          \
  ;

  echo "$CMD_DURATION" > "$outTrialsDir/$zoomLevel/2 - Cutting.txt";

	userWaitConditional;
end

popd;
