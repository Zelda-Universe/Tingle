#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

set -x converge         'false';
set -x convergeInPlace  'false';

if test -z "$ignoreTables"
  set -x ignoreTables   '';
end

"$SDIR/runProd.fish";
