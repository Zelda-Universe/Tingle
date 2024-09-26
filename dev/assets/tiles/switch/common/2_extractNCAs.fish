#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../../scripts/common/filenameRemoveExtension.fish";

if test (count $argv) -lt '1'
  errorPrint 'Must provide NSP path as arugment; exiting...';
  exit 1;
end

set nspPath   "$argv[1]"                          ;
set nspSubDir (filenameRemoveExtension "$nspPath");

# nspx              \
#   --extract       \
#   -o "$nspSubDir" \
#   -f "$nspPath"   \
# ;

hactool --disablekeywarns \
  --pfs0dir="$nspSubDir"'_pfs0' \
  -t'pfs0' -x "$nspPath" \
;
