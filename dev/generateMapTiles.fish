#!/usr/bin/env fish

## Info

# Author: Pysis
# Help from: Danilos Passos

# Dependencies:
# - fish shell
# - Basic shell utilities:
#   - variables
#   - loops
#   - subshell
#   - echo
#   - mkdir
#   - test
#   - printf
#   - read
#   - set
#   - seq
#   - pushd
#   - popd
#   - exit
#   - continue
#   - function
#   - functions
# - bc
# - ImageMagick (convert, identify)

# Overwrites functions:
# - debugPrint
# - userWait

# Tools tried:
# - gdal2tiles.py
# - mapslicer
# - Mapeditor(?)
# - GenerateSlippyMapTiles.py - https://gist.github.com/jeffThompson/a08e5b8146352f3974bfa4100d0317f6

# Tools not tried or couldn't try:
# - Tiled(?) (Editor)
# - MapTiler

## Set-up

function debugPrint
	test "$__DEBUG_MODE__" = "true"; and echo -e "DEBUG: $argv";
end

function userWait
	test "$manualStep" = "true"; and read -P 'Press any key to continue...';
end

# TODO: only works with absolute file paths currently.
# could add detection for relative modes with branched paths later on
# for setting derivative files using the double dot syntax.

# Flags
test -z "$force"; and set force "false";
test -z "$manualStep"; and set manualStep "false";
test -z "$outputZoomFolders"; and set outputZoomFolders "true";
test -z "$keepWorkFolder"; and set keepWorkFolder "false";

# Direct (Required) Input
test -z "$srcFile"; and set srcFile "$argv[1]";
test -z "$outDir"; and set outDir "$argv[2]";
test -z "$cleanFirst"; and set cleanFirst "$argv[3]";

# Derived and Static Intermediate Settings
test -z "$outWorkDir"; and set outWorkDir "work";
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

# Settings debug information
debugPrint "srcFile: $srcFile";
debugPrint "srcFileNameSuffix: $srcFileNameSuffix";
debugPrint "outDir: $outDir";
debugPrint "outWorkDir: $outWorkDir";
debugPrint "tmpFitFileMask: $tmpFitFileMask";
debugPrint "tileSize: $tileSize";
debugPrint "tileFileNamePatternCoords: $tileFileNamePatternCoords";
debugPrint "tileFileNamePatternMask: $tileFileNamePatternMask";

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

## Main program

# Step 1
# Fit the image into the first highest zoom level it is smaller than by both dimensions.
# Extend the canvas to the power of 2.
# Center the image over the new background.
set srcFileDims (identify -format "%wx%h\n" "$srcFile");
echo "Source file dimensions: $srcFileDims";

set maxDim (echo "$srcFileDims" | tr 'x' '\n' | sort -rn | head -n 1);
echo "Source file maximum detected dimension: $maxDim";

set zoomLevels 0;
while true
	set zoomLevels (expr $zoomLevels + 1);
	set numAxisTiles (echo "2 ^ $zoomLevels" | bc);
	set zoomDim (echo "$numAxisTiles * $tileSize" | bc);

	test "$zoomDim" -gt "$maxDim"; and break;
end

debugPrint "Max zoom level matched: $zoomLevels";
debugPrint "Max zoom level dimension: $zoomDim";

userWait;

# Step 2
# Create a canvas for the new dimensions and place the image in the center.
# Iterate down the zoom levels back to the base of 0 with 1 tile lastly,
# each time cutting the image into the appropriate number of tiles that fit.
# Using the first generated source image once, later it will resized down by
# half for each stage until it is the size of a single tile for the last stage.

pushd "$outDir" > /dev/null;

# All output preparation
mkdir -p "$outWorkDir";

for zoomLevel in (seq $zoomLevels -1 0)
	echo "Generating zoom level $zoomLevel tiles...";

	set numAxisTiles (echo "2 ^ $zoomLevel" | bc);
	set zoomDim (echo "$numAxisTiles * $tileSize" | bc);
	set zoomDims {$zoomDim}x{$zoomDim};
	set currentExtFile (printf "$tmpFitFileMask" "$zoomLevel");

	# Iteration debug information
	debugPrint "zoomLevel: $zoomLevel";
	debugPrint "numAxisTiles: $numAxisTiles";
	debugPrint "zoomDim: $zoomDim";
	debugPrint "zoomDims: $zoomDims";
	debugPrint "currentExtFile: $currentExtFile";

	# Create base square image to cut.
	if test ! -e "$currentExtFile" -o "$force" = "true"
		echo "Current working file does not already exist, or force has been specified; generating...";
		if test "$zoomLevel" -lt "$zoomLevels"
			convert "$srcFile" -resize "$zoomDims" "$currentExtFile";
		else if test "$zoomLevel" -eq "$zoomLevels"
			convert "$srcFile" -gravity "center" -extent "$zoomDims" "$currentExtFile";
		end
	else
		echo "Current working file already exists; skipping generation...";
	end
	set srcFile "$currentExtFile";
	debugPrint "srcFile: $srcFile";

	# TODO: can do a zoom level check here if the user wants it or not
	# depending on the requirement, could check for hyphen to determine parsing mode,
	# use seq to create levels to work with all explicitly,
	# then grep with word boundaries carefully to only select a single potential element to check

	
	if test "$outputZoomFolders" = "true";
		if test -d "$zoomLevel" -a "$force" != "true"
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

	set tileFileNamePattern (printf "$tileFileNamePatternMask" {$zoomLevel});
	debugPrint "tileFileNamePattern: $tileFileNamePattern";

	convert \
		"$srcFile" \
		-crop {$tileSize}x{$tileSize} \
		-set filename:tile "$tileFileNamePatternCoords" \
		+adjoin \
		"$tileFileNamePattern" \
	;

	userWait;
end

if test "$keepWorkFolder" != "true" -a -d "$keepWorkFolder"
	echo "Removing work directory...";
	rm -rf "$outWorkDir";
end

popd > /dev/null;

# Clean up the self-declared function
functions -e debugPrint;
functions -e userWait;