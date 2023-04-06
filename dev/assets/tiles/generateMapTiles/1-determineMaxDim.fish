#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/
# debugPrint 'status filename: '(status filename);
# set SDIR "$PWD/"(dirname (status filename));
set SDIR (dirname (status filename));
# debugPrint "SDIR: $SDIR";
# Step 1 - Determine Maximum Dimensions
# Always required / internal step.
# Determines the max zoom level dimensions that fit around the source image.
source "$SDIR/../0-detect.fish";

echo 'Determining image\'s maximum zoom level values...';

test -z "$srcFileDims";
and set srcFileDims (magick identify -format "%wx%h\n" "$srcFile");
# debugPrint "Source file dimensions: $srcFileDims";
# debugPrint "srcFileDims: $srcFileDims";

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
	set zoomLevels   (expr $zoomLevels + 1);
	set numAxisTiles (echo "2 ^ $zoomLevels" | bc);
	set zoomDim      (echo "$numAxisTiles * $tileSize" | bc);
  # debugPrint "zoomLevels: $zoomLevels";
  # debugPrint "numAxisTiles: $numAxisTiles";
  # debugPrint "zoomDim: $zoomDim";

	test "$zoomDim" -gt "$maxDim"; and break;
end

# debugPrint "Max zoom level matched: $zoomLevels";
# debugPrint "Max zoom level axis tiles amount: $numAxisTiles";
# debugPrint "Max zoom level dimension: $zoomDim";
