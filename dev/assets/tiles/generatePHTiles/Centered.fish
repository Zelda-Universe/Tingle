#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR (readlink -f (dirname (status filename)));

source "$SDIR/1-config.fish";

# For better accuracy, use the more dynamic per zoom level script in `generateMapTiles/run.fish` using any of the valid '<placeholder>' alternative source file names or `generatePHTiles` flag.
# This is for a more focused approach when you know more of the parameters per zoom level, and use a different approach than the current map software configuration.
test -z "$numTilesFromCenter";
and set numTilesFromCenter '1';

set outDir "$SDIR/../../../../tiles/_placeholder";
test ! -e "$outDir"; and mkdir "$outDir";

echo 'Generating placeholder tiles from the center as the origin...';

set numTFC "$numTilesFromCenter";
set zStart  "-$numTFC";
set zEnd    "$numTFC" ;
set xStart  "-$numTFC";
set xEnd    "$numTFC" ;
set yStart  "-$numTFC";
set yEnd    "$numTFC" ;

"$SDIR/2-generateTiles.fish";
