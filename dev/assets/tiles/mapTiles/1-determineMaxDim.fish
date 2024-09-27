#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/errorPrint.fish";

# debugPrint 'Entering 1-determineMaxDim.fish...';

# Step 1 - Determine Maximum Dimensions
# Always required / internal step.
# Determines the max zoom level dimensions that fit around the source image.
source "$SDIR/../placeholderTiles/detect.fish";
source "$SDIR/0-config.fish";

echo 'Determining image\'s maximum zoom level values...';

if test -z "$imageProg"
  errorPrint 'imageProg empty; exiting...';
  exit 1;
end

# debugPrint "srcFile: $srcFile";

# https://imagemagick.org/script/escape.php
test -z "$srcFileDims";
and set srcFileDims (
  # "$imageProg" identify -format "%wx%h\n" "$srcFile";
  # file -b "$srcFile" | cut -d',' -f2 | string trim;
  "$imageProg" identify -ping -format '%wx%h\n' "$srcFile";
);
# debugPrint "Source file dimensions: $srcFileDims";
# debugPrint "srcFileDims: $srcFileDims";

if test -z "$srcFileDims"
  errorPrint 'srcFileDims still empty; unknown error using magick; exiting...';
  exit 1;
end

set maxDim (
  echo "$srcFileDims" \
  | tr 'x' '\n'       \
  | sort -rn          \
  | head -n 1         \
);
# debugPrint "Source file maximum detected dimension: $maxDim";
# debugPrint "maxDim: $maxDim";

set zoomLevels '0';

while true
	set zoomLevels   (expr $zoomLevels + 1                 );
	set numAxisTiles (echo "2 ^ $zoomLevels"           | bc);
	set zoomDim      (echo "$numAxisTiles * $tileSize" | bc);
  # debugPrint "zoomLevels: $zoomLevels";
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "zoomDim: $zoomDim";

	test "$zoomDim" -gt "$maxDim"; and break;
end

export zoomLevels numAxisTiles zoomDim;

echo "Max zoom level matched          : $zoomLevels"  ;
echo "Max zoom level axis tiles amount: $numAxisTiles";
echo "Max zoom level dimension        : $zoomDim"     ;

# debugPrint 'Leaving 1-determineMaxDim.fish...';
