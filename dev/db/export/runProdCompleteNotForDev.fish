#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

set -x -a ignoreTables '';

set -x convergeInPlace 'false';

set -x dbSocket "$dbSocketProd";

"$SDIR/runProd.fish";
