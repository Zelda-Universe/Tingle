#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'errorPrint';
and function errorPrint
  altPrint "ERROR: $argv";
end
