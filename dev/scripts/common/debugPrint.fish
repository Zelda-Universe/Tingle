#!/usr/bin/env fish

not type -q 'debugPrint';
function debugPrint
  # echo "DEBUG __DEBUG__: $__DEBUG__";
  if test "$__DEBUG__" = "true"
    # altPrint "DEBUG: $argv";
    altPrint -n "DEBUG: ";
    altPrint $argv;
  end
end
