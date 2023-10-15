#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/debugPrint.fish" ;
source "$SDIR/../../scripts/common/errorPrint.fish" ;

source "$SDIR/../../scripts/common/editLines.fish"  ;

test -z "$filePath"; and set filePath "$argv[1]";
if test -z "$filePath"
  errorPrint 'No file given; exiting...';
  return 1;
end
# debugPrint "filePath        : $filePath";

set patternInsert   '^INSERT INTO `[^`]+` VALUES.*$';
set patternSCs      '^;$'                           ;
set patternValNoCom '^\s*\([^)]+\)$'                ;

# debugPrint "patternInsert   : $patternInsert"   ;
# debugPrint "patternSCs      : $patternSCs"      ;
# debugPrint "patternValNoCom : $patternValNoCom" ;

# debugPrint 'editLines patternInsert'  ;
editLines "$filePath" "$patternInsert"    'd'      '1:' ;
# debugPrint 'editLines patternSCs'     ;
editLines "$filePath" "$patternSCs"       'd'      ':-1';
# debugPrint 'editLines patternValNoCom';
editLines "$filePath" "$patternValNoCom"  's|$|,|' ':-1';
