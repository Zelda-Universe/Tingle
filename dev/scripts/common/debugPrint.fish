#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));
not type -q 'debugPrint';
function debugPrint
  # echo "DEBUG __DEBUG__: $__DEBUG__";
  if test "$__DEBUG__" = "true"
    # altPrint "DEBUG: $argv";
    altPrint -n "DEBUG: ";
    altPrint $argv;
  end
end
