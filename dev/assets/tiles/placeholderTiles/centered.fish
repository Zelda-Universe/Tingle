#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

set -x isPHType 'true';

if not source "$SDIR/1-config.fish"
  return 1;
end

set -x outDir "$SDIR/../../../../tiles/_placeholder";
test ! -e "$outDir"; and mkdir "$outDir";

echo 'Generating placeholder tiles from the center as the origin...';

if false
  test -z "$numTilesFromCenter"   ;
  and set numTilesFromCenter '1'  ;
  set numTFC "$numTilesFromCenter";

  set -x zStart "-$numTFC";
  set -x zEnd   "$numTFC" ;
  set -x xStart "-$numTFC";
  set -x xEnd   "$numTFC" ;
  set -x yStart "-$numTFC";
  set -x yEnd   "$numTFC" ;

  "$SDIR/2-generateTiles.fish";
end

# More accurate?
# As being dynamic per zoom level.
if true
  # set srcFile '<placeholder>';
  # srcFileDims
  "$SDIR/../mapTiles/run.fish";
end
