#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

debugPrint 'GenerateErrorTile START';

set SDIR (readlink -f (dirname (status filename)));
# debugPrint "SDIR: $SDIR";
# debugPrint "SDIR: $SDIR/../../../..";
# debugPrint "rl -f SDIR: "(readlink -f "$SDIR");
# debugPrint "rl -f SDIR ..x4: "(readlink -f "$SDIR/../../../..");

set -x isPHType 'true';

set outDir "$SDIR/../../../../tiles/_placeholder";
test ! -e "$outDir"; and mkdir "$outDir";

pushd "$outDir";

echo 'Generating placeholder error tile...';

set -x filePath "error.png";
# set -x label '';
set -x inputOpts            \
  -stroke       'red'       \
  -strokewidth  '5'         \
  -draw 'line 0,0 256,256'  \
  -draw 'line 256,0 0,256'  \
  'xc:'                     \
;
set -x inputOptsJSON '["'(
  string join '","' -- $inputOpts;
)'"]';

debugPrint "inputOpts: $inputOpts";
debugPrint "count inputOpts: "(count $inputOpts);
# for inputOpt in $inputOpts
#   debugPrint "inputOpt: $inputOpt";
# end
debugPrint "inputOptsJSON: $inputOptsJSON";

"$SDIR/3-generateTile.fish";

debugPrint 'GenerateErrorTile END';
