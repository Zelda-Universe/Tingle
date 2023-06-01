#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

source "$SDIR/../../scripts/common/editLines.fish";

test -z "$filePath"; and set filePath "$argv[1]";
if test -z "$filePath"
  errorPrint 'No file given; exiting...';
  return 1;
end

set patternInsert   '^INSERT INTO `[^`]+` VALUES.*$';
set patternSCs      '^;$'                           ;
set patternValNoCom '^\s*\([^)]+\)$'                ;

editLines "$filePath" "$patternInsert"    '1:'  'd'     ;
editLines "$filePath" "$patternSCs"       ':-1' 'd'     ;
editLines "$filePath" "$patternValNoCom"  ':-1' 's|$|,|';
