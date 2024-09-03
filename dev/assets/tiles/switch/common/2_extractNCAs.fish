#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../../scripts/common/filenameRemoveExtension.fish";

set nspPath   "$argv[1]"                          ;
set nspSubDir (filenameRemoveExtension "$nspPath");

# nspx              \
#   --extract       \
#   -o "$nspSubDir" \
#   -f "$nspPath"   \
# ;

# or hactool pfs i think
# this one??
hactool -t'xci' --securedir="$nspSubDir" "$nspPath"