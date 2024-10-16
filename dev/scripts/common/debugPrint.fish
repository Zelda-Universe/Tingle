#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));
source "$SDIR/altPrint.fish";

not type -q 'debugPrint';
and function debugPrint
  # echo "DEBUG: __DEBUG__: $__DEBUG__";
  if test "$__DEBUG__" = 'true'
    # altPrint "DEBUG: $argv";
    altPrint -n 'DEBUG: ';
    altPrint $argv;
  end
end
