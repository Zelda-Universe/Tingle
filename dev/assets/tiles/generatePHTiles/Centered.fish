#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR "$PWD/"(dirname (status filename));

source "$SDIR/1-config.fish";

# For better accuracy, use the more dynamic per zoom level script in `generateMapTiles/run.fish` using any of the valid '<placeholder>' alternative source file names or `generatePHTiles` flag.
# This is for a more focused approach when you know more of the parameters per zoom level, and use a different approach than the current map software configuration.
test -z "$numTilesFromCenter"; and set numTilesFromCenter '1';

set outDir "$SDIR/../../../../tiles/_placeholder";
test ! -e "$outDir"; and mkdir "$outDir";

pushd "$outDir" > /dev/null;

echo 'Generating placeholder tiles from the center as the origin...';

set zStart  "-$numTilesFromCenter";
set zEnd    "$numTilesFromCenter" ;
set xStart  "-$numTilesFromCenter";
set xEnd    "$numTilesFromCenter" ;
set yStart  "-$numTilesFromCenter";
set yEnd    "$numTilesFromCenter" ;

popd > /dev/null;
