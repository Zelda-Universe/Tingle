#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/altPushd.fish"                ;
source "$SDIR/../../../scripts/common/debugPrint.fish"              ;
source "$SDIR/../../../scripts/common/errorPrint.fish"              ;
source "$SDIR/../../../scripts/common/filenameRemoveExtension.fish" ;
source "$SDIR/../../../scripts/common/timing.fish"                  ;
source "$SDIR/../../../scripts/common/userWaitConditional.fish"     ;
source "$SDIR/../z-verbose-magick.fish"                             ;

if not source "$SDIR/0-config.fish"
  return 1;
end
if not source "$SDIR/../0-config-zoom.fish"
  return 2;
end

if test "$workFiles" = 'true'
  set timeFilePattern "$outTrialsDir/%s/3b - Row Cutting.txt";
else
  if test "$imageProgGM" = 'true'
    set timeFilePattern "$outTrialsDir/%s/4a - Cutting.txt";
  else
    set timeFilePattern "$outTrialsDir/%s/4 - Cutting.txt";
  end
end
# debugPrint "timeFilePattern: $timeFilePattern";

echo;
echo;
echo 'Cropping tiles...';

if not altPushd "$outDir"
  errorPrint "Could not enter output directory \"$outDir\"; exiting...";
  return 1;
end

if test -z "$tileFileNamePatternCoords"
  if test "$outputAxisFolders" = "true"
    set tFNPCXYDelim '/';
  else
    set tFNPCXYDelim '_';
  end

  if test "$imageProgIM" = 'true'
    set tileFileNamePatternCoords \
      "%[fx:page.x/$tileSize]$tFNPCXYDelim%[fx:page.y/$tileSize]" \
    ;
  end
end
# debugPrint "tileFileNamePatternCoords: $tileFileNamePatternCoords";

test -z "$tileFileNamePattern"
and set tileFileNamePattern '';
test -z "$tFNPCZDelim"
and set tFNPCZDelim '';
if test -z "$tileFileNamePattern"
  if test \
        "$outputAxisFolders" = 'true' \
    -o  "$outputZoomFolders" = 'true'
    set tFNPCZDelim '/';
  else
    set tFNPCZDelim '_';
  end
  # debugPrint "tFNPCZDelim: $tFNPCZDelim";
end
# debugPrint "tileFileNamePattern: $tileFileNamePattern";

test -z "$tFNPCOpts";
and set tFNPCOpts '';
if test "$imageProgIM" = 'true'
  set tileFileNamePattern "%s$tFNPCZDelim%%[filename:tile].png";
  set tFNPCOpts     \
    -set            \
    'filename:tile' \
    "$tileFileNamePatternCoords" \
  ;
else if test "$imageProgGM" = 'true'
  # set tileFileNamePattern "%s$tFNPCZDelim%%02d.png";
  set tileFileNamePattern "%s$tFNPCZDelim%%d.png";
end
# debugPrint "tileFileNamePattern: $tileFileNamePattern";

source "$SDIR/resolveWildcard.fish";

for zoomLevel in $processZoomLevels
  echo;

  set numAxisTiles    (echo   "2 ^ $zoomLevel"     | bc     );
  set axisEndIndex    (echo   "$numAxisTiles" - 1  | bc     );
  set currentExtFile  (printf "$tmpFitFileMask" "$zoomLevel");
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "axisEndIndex: $axisEndIndex";
  # debugPrint "currentExtFile: $currentExtFile";

  if test \
        "$zoomLevel" -gt "$zLLimit" \
    -a  "$forceBigJob" != 'true'
    echo "Skipping zoom level \"$zoomLevel\" since it is greater than the recommended limit of \"$zLLimit\"...";
    continue;
  end

  test ! -d "$outTrialsDir/$zoomLevel";
  and mkdir "$outTrialsDir/$zoomLevel";

  # Make output (Z) subdirs, if they do not exist and setting is enabled,
  # or check if they have any files already.
  # debugPrint "workFiles: $workFiles";
  if test "$workFiles" = 'true'
    set dir '.';
    # debugPrint "dir: $dir";

    find                        \
      "$dir"                    \
      -maxdepth 1               \
      -type f                   \
      -iname "*.png"            \
    | head -n 1                 \
    | read firstFile            \
    ;
    # debugPrint "firstFile: $firstFile";

  	if test -n "$firstFile" -a "$force" != "true"
  		echo 'Current zoom level already contains at least 1 tile file, and force has not been specified; skipping producing them...';
      set -e firstFile;
  		continue;
    else
      echo 'Current zoom level does not contain any existing tile files, or force has been specified; continuing to produce them...';
  	end
  else
  	echo "Processing zoom level \"$zoomLevel\"...";
    # debugPrint "zoomLevel: $zoomLevel";

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
          test -z "$firstFile";
          and find                    \
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
        set dir "$indexDir";
      end
    else
      if test "$outputZoomFolders" = "true"
        set dir "$zoomLevel";
      else
        set dir '.';
      end
    end
    # debugPrint "dir: $dir";

    if test "$outputAxisFolders" != "true"
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
  end

	set tileFileName (
    printf "$tileFileNamePattern" "$zoomLevel"
  );
  # debugPrint "tileFileName: $tileFileName";

  set timeFilePath (printf "$timeFilePattern" "$zoomLevel");
  # debugPrint "timeFilePath: $timeFilePath";

  if test "$rows" = 'true'
    set cropOpt x{$tileSize}            ;
  else
    set cropOpt {$tileSize}x{$tileSize} ;
  end

  # debugPrint "currentExtFilesJSON: $currentExtFilesJSON";
  if test -n "$currentExtFilesJSON"
    set currentExtFiles (
      echo "$currentExtFilesJSON" \
      | jq -r '.[]' \
      | tr -d '\r'
    );
  else
    set currentExtFilesDir (filenameRemoveExtension "$currentExtFile");
    # debugPrint "currentExtFilesDir: $currentExtFilesDir";

    if not altPushd "$outWorkDir"
      errorPrint 'altPushd outWorkDir; exiting...';
      return 5;
    end

    if test \
            "$reduceJob" = 'true' \
      -a -d "$currentExtFilesDir"
      set currentExtFiles (
        find                    \
          "$currentExtFilesDir" \
          -type   'f'           \
          -iname  '*.png'       \
        | sort -n -t'-' -k'3.7'
      );
    else
      set currentExtFiles "$currentExtFile";
    end

    popd;
  end
  # debugPrint "currentExtFiles: $currentExtFiles";
  # debugPrint "count currentExtFiles: "(count $currentExtFiles);
  # debugPrint "head 150 currentExtFiles: "(echo "$currentExtFiles" | head -c 150);

  if test -z "$currentExtFile" -a ! -f "$currentExtFile"
    errorPrint 'Padded image file and cut rows do not exist to source from; exiting...';
    return 6;
  end

  if test "$dryRun" = 'true'
    echo 'Skipping execution and timing due to dry run setting being enabled...';
    return;
  end

  if test -z "$imageProg"
    errorPrint 'Image program not set; exiting...';
    return 1;
  end

  echo;
  echo 'Cutting padded image into tile sections...';

  # debugPrint "currentExtFiles: $currentExtFiles";
  timerStart;
  for currentExtFile in $currentExtFiles
    echo "Processing padded file \"$currentExtFile\"...";

    set -e headerOpts;
    if test -z "$headerOpts"
      if test -n "$monitorOpts"
        set -a headerOpts $monitorOpts;
      end
      set -a headerOpts "$outWorkDir/$currentExtFile";
    end
    if test -z "$middleOpts"
      set -a middleOpts -crop "$cropOpt";
      if test -n "$tFNPCOpts"
        set -a middleOpts $tFNPCOpts;
      end
    end

    if test "$DRY_RUN" = 'true'
      echo "$imageProg"   \
        convert           \
        $headerOpts       \
    		$middleOpts       \
    		+adjoin           \
    		"$tileFileName"   \
        2>&1              \
      ;
    else
      "$imageProg"        \
        convert           \
        $headerOpts       \
    		$middleOpts       \
    		+adjoin           \
    		"$tileFileName"   \
        2>&1              \
      ;
    end
    # 2>&1 | grep -v 'geometry does not contain image'  \
    set statusSaved "$status";
  end
  timerStop;
  timerDurationReportAndSave "$timeFilePath";

  if test "$statusSaved" -gt '0'
    errorPrint 'Creating base file; exiting...';
    return 1;
  end

  if test "$DRY_RUN" = 'true'
    echo 'Files would be created now, if no errors, and the actual command were executed.';
  else
    if test "$outputZoomFolders" = "true"
      set dir "$zoomLevel";
    else if test "$outputAxisFolders" = "true"
      if test "$imageProgGM" = 'true'
        set dir "$zoomLevel";
      else
        set dir "$zoomLevel/0";
      end
    else
      set dir '.';
    end
    # debugPrint "dir: $dir";

    set createdFilesCount (
      find              \
        "$dir"          \
        -maxdepth 1     \
        -type f         \
        -iname "*.png"  \
      | wc -l
    );
    # debugPrint "createdFilesCount: $createdFilesCount";

    if test -z "$createdFilesCount" -o "$createdFilesCount" -lt '1'
      errorPrint 'Could not create cropped images; unknown error.';
      errorPrint "createdFilesCount: $createdFilesCount";
    else
      if test "$imageProgGM" = 'true'
        if test "$outputAxisFolders" = "true"
          set tFNPCXYDelim2 '/';
        else
          set tFNPCXYDelim2 '_';
        end
        set x '0';
        set y '0';
        pushd "$dir";
        echo;
        echo 'Sorting resulting tile files since Graphics Magick is being used, and it does not support naming based on coordinates...';
        timerStart;
        find              \
          -maxdepth 1     \
          -type f         \
          -iname "*.png"  \
          -printf '%f\n'  \
        | sort -n         \
        | while read filePath
          if test "$outputAxisFolders" = "true" -a ! -e "$x"
            mkdir "$x";
          end

          mv -n "$filePath" "$zoomLevel$tFNPCXYDelim$x$tFNPCXYDelim2$y.png";

          if test "$x" = "$axisEndIndex"
            set x '0';
            set y (echo "$y + 1" | bc);
          else
            set x (echo "$x + 1" | bc);
          end
        end
        timerStop;
        timerDurationReportAndSave "$outTrialsDir/$zoomLevel/4b - Sorting.txt";
        popd;
      end
    end
  end

	userWaitConditional;
end

popd;
