#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/userWaitConditional.fish";

echo 'Cropping tiles...';

pushd "$outDir";

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

for zoomLevel in $processZoomLevels
  # debugPrint "zoomLevel: $zoomLevel";

  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

  set numAxisTiles (echo "2 ^ $zoomLevel" | bc);
  set axisEndIndex (echo "$numAxisTiles" - 1 | bc);
  set currentExtFile (printf "$tmpFitFileMask" "$zoomLevel");
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "axisEndIndex: $axisEndIndex";
  # debugPrint "currentExtFile: $currentExtFile";

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

    find                        \
      "$dir"                    \
      -maxdepth 1               \
      -type f                   \
      -iname "*.png"            \
    | head -n 1                 \
    | read firstFile            \
    ;
  end

	if test -n "$firstFile" -a "$force" != "true"
		echo "Current zoom level already contains at least 1 file, and force has not been specified; skipping...";
		continue;
	end

	set tileFileNamePattern (
    printf "$tileFileNamePatternMask" "$zoomLevel"
  );
  # debugPrint "tileFileNamePattern: $tileFileNamePattern";
  # pwd
	time magick \
		"$currentExtFile"                                 \
		-crop {$tileSize}x{$tileSize}                     \
		-set 'filename:tile' "$tileFileNamePatternCoords" \
		+adjoin                                           \
		"$tileFileNamePattern"                            \
  ;

  echo "$CMD_DURATION" > "$outTrialsDir/$zoomLevel/2 - Cutting.txt";

	userWaitConditional;
end

popd;
