#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'errorPrint';
and function errorPrint
  altPrint "ERROR: $argv";
end
