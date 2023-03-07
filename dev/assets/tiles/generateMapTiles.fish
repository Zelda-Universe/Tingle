#!/usr/bin/env fish

# Dependencies: magick/ImageMagick, bc, ...

## General Function Library

function debugPrint
	test "$__DEBUG_MODE__" = "true"; and echo -e "DEBUG: $argv";
end

function userWait
	test "$manualStep" = "true"; and read -P 'Press any key to continue...';
end

## Step Function Library

# Step 1 - Always required / internal step.
# Determines the max zoom level dimensions that fit around the source image.
function step1
  set srcFileDims (magick identify -format "%wx%h\n" "$srcFile");
  # debugPrint "Source file dimensions: $srcFileDims";

  set maxDim (echo "$srcFileDims" | tr 'x' '\n' | sort -rn | head -n 1);
  # debugPrint "Source file maximum detected dimension: $maxDim";

  while true
  	set zoomLevels (expr $zoomLevels + 1);
  	set numAxisTiles (echo "2 ^ $zoomLevels" | bc);
  	set zoomDim (echo "$numAxisTiles * $tileSize" | bc);

  	test "$zoomDim" -gt "$maxDim"; and break;
  end

  # debugPrint "Max zoom level matched: $zoomLevels";
  # debugPrint "Max zoom level dimension: $zoomDim";
end

# Step 2
# Create a canvas for the new dimensions and place the image in the center.
# Iterate down the zoom levels back to the base of 0 with 1 tile lastly,
# each time cutting the image into the appropriate number of tiles that fit.
# Using the first generated source image once, later it will resized down by
# half for each stage until it is the size of a single tile for the last stage.
function step2 --argument-names srcFile
  set availableZoomLevels (seq 0 1 $zoomLevels);
  # debugPrint "availableZoomLevels: $availableZoomLevels";
  # debugPrint "count availableZoomLevels: "(count $availableZoomLevels);
  test -z "$processZoomLevels" -o "$processZoomLevels" = '*'; and set processZoomLevels $availableZoomLevels;
  if begin;
    test (count $processZoomLevels) -eq 1;
    and echo "$processZoomLevels" | grep -q " "
  end
    set processZoomLevels (echo "$processZoomLevels" | tr ' ' '\n');
  end

  for zoomLevel in $processZoomLevels
    if not echo "$processZoomLevels" | grep -q "\b$zoomLevel\b"
    echo "Error: Zoom Level \"$zoomLevel\" not valid.";
      echo "Valid choices for this source image: \""(string join "\", \"" $availableZoomLevels)"\"";
      echo "Exiting...";
      exit;
    end
  end

  for zoomLevel in $processZoomLevels
    echo;
  	echo "Processing zoom level \"$zoomLevel\"...";

  	set numAxisTiles (echo "2 ^ $zoomLevel" | bc);
  	set zoomDim (echo "$numAxisTiles * $tileSize" | bc);
  	set zoomDims "$zoomDim"x"$zoomDim";
  	set currentExtFile (printf "$tmpFitFileMask" "$zoomLevel");

    test ! -d "$outTrialsDir/$zoomLevel"; and mkdir "$outTrialsDir/$zoomLevel";

  	# Iteration debug information
  	# debugPrint "zoomLevel: $zoomLevel";
  	# debugPrint "numAxisTiles: $numAxisTiles";
  	# debugPrint "zoomDim: $zoomDim";
  	# debugPrint "zoomDims: $zoomDims";
  	# debugPrint "currentExtFile: $currentExtFile";

  	# Create base square image to cut.
    # https://legacy.imagemagick.org/Usage/thumbnails/#fit_summery
    # Don't need those tricks though, since we are forcing a known specific size.
    # https://legacy.imagemagick.org/Usage/resize/#enlarge
  	if test ! -e "$currentExtFile" -o "$force" = "true"
  		echo "Current working file does not already exist, or force has been specified; generating...";
      set srcFileOpts "";
  		if test "$zoomLevel" -lt "$zoomLevels"
        echo "Not the max zoom level; resizing and padding...";
  			set srcFileOpts \( "$srcFile" -resize "$zoomDims>" \)
        set timeFileName "1 - Resizing.txt";
  		else if test "$zoomLevel" -eq "$zoomLevels"
        echo "Max zoom level; padding...";
        set srcFileOpts "$srcFile";
  			set timeFileName "1 - Extenting.txt"
  		end

      time magick \
        -background "transparent" \
        $srcFileOpts \
        -gravity "center" -extent "$zoomDims" \
        "$currentExtFile" \
      ;
      # Why is it always zero, even without a wrapping time command invocation for the entire script....
      # debugPrint "CMD_DURATION: $CMD_DURATION";
      echo "$CMD_DURATION" > "$outTrialsDir/$zoomLevel/$timeFileName";
  	else
  		echo "Current working file already exists; skipping generation...";
  	end
  end
end

function step3 --argument-names outDir
  pushd "$outDir";

  for zoomLevel in $processZoomLevels
    test ! -d "$outTrialsDir/$zoomLevel"; and mkdir "$outTrialsDir/$zoomLevel";

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
  		find -maxdepth 1 -type f -iname "$zoomLevel*.png" | head -n 1 | read firstFile;
  		if test -n "$firstFile" -a "$force" != "true"
  			echo "Current zoom level already contains at least 1 file, and force has not been specified; skipping...";
  			continue;
  		end
  	end

  	set tileFileNamePattern (printf "$tileFileNamePatternMask" "$zoomLevel");
  	# debugPrint "tileFileNamePattern: $tileFileNamePattern";

  	time magick \
  		"$workFile" \
  		-crop {$tileSize}x{$tileSize} \
  		-set filename:tile "$tileFileNamePatternCoords" \
  		+adjoin \
  		"$tileFileNamePattern" \
    ;

    echo "$CMD_DURATION" > "$outTrialsDir/$zoomLevel/2 - Cutting.txt";

  	userWait;
  end

  popd;
end

## Set-up

# Flags
test -z "$force"; and set force                         "false";
test -z "$manualStep"; and set manualStep               "false";
test -z "$outputZoomFolders"; and set outputZoomFolders "false";

# Direct (Required) Input
test -z "$srcFile"; and set srcFile       "$argv[1]";
test -z "$outDir"; and set outDir         "$argv[2]";
test -z "$cleanFirst"; and set cleanFirst "$argv[3]";
test -z "$cleanFirst"; and set cleanFirst "false";

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

set processZoomLevels (string split ' ' (echo "$processZoomLevels" | tr ',' ' '));
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
# debugPrint "cleanFirst: $cleanFirst";
# debugPrint "outputZoomFolders: $outputZoomFolders";
# debugPrint "processSteps: $processSteps";
# debugPrint "processZoomLevels: $processZoomLevels";
# debugPrint "count processZoomLevels: "(count $processZoomLevels);
#
# debugPrint "srcFile: $srcFile";
# debugPrint "srcFileNameSuffix: $srcFileNameSuffix";
# debugPrint "outDir: $outDir";
# debugPrint "outTrialsDir: $outTrialsDir";
# debugPrint "outWorkDir: $outWorkDir";
#
# debugPrint "tmpFitFileMask: $tmpFitFileMask";
# debugPrint "tileSize: $tileSize";
# debugPrint "tileFileNamePatternCoords: $tileFileNamePatternCoords";
# debugPrint "tileFileNamePatternMask: $tileFileNamePatternMask";

# Optional cleaning preparation step
if test "$cleanFirst" = "true"
	echo "Cleaning the output (not work sub-) directory and exiting...";
	find "$outDir" -maxdepth 1 -type f -iname "*.png" -delete;
	find "$outDir" -regextype posix-extended -maxdepth 1 -type d -iregex '.*?/[0-9]+$' -exec rm -rf '{}' \;;
	userWait;
end

# Required settings validation
if test -z "$srcFile" -o ! -e "$srcFile"
	echo "Error: Source file must be provided as the first argument and exist.";
	exit;
end

# I intentionally check this instead of creating it for the user in case
# they provide the wrong argument by accident.  Don't want to create a mess
# for them somewhere in some unintentional place.
if test -z "$outDir" -o ! -e "$outDir" -o ! -d "$outDir"
	echo "Error: Output directory must be provided as the second argument, exist, and be a directory.";
	exit;
end

## Main program execution
# Fit the image into the first highest zoom level it is smaller than by both dimensions.
# Extend the canvas to the power of 2.
# Center the image over the new background.

set zoomLevels 0;

# All output preparation
mkdir -p "$outWorkDir";
mkdir -p "$outTrialsDir";

# Maybe make step 1 optional only if the user provided a custom argument for it,
# but it's several....
step1;
userWait;
echo "$processSteps" | grep -qE "\b2\b"; and step2 "$srcFile";
userWait;
echo "$processSteps" | grep -qE "\b3\b"; and step3 "$outDir";
userWait;
