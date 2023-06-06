#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

source "$SDIR/../../scripts/common/editLines.fish";

test -z "$filePath"; and set filePath "$argv[1]";
if test -z "$filePath"
  errorPrint 'No file given; exiting...';
  return 1;
end

set patternCT         '^CREATE TABLE' ;
set patternCTEndParen '^\)'           ;

set lineNumCT (
  getFilePatternLineNums  \
    $filePath             \
    $patternCT
)[1];
if test -z $lineNumCT
  return 1;
end

set lineNumsCTEndParen (
  getFilePatternLineNums  \
    $filePath             \
    $patternCTEndParen
);
if test -z $lineNumsCTEndParen
  return 2;
end

for lineNumParen in $lineNumsCTEndParen
  if test $lineNumParen -gt $lineNumCT;
    set lineNumCTEndParen $lineNumParen;
    break;
  end
end
# debugPrint "lineNumParen: $lineNumParen";

set line (sed -n {$lineNumCTEndParen}p "$filePath");
# debugPrint "line: $line";

if string match -q '* COLLATE=*' $line
  return 3;
end

sed -i "$lineNumCTEndParen s|;\$| COLLATE=latin1_swedish_ci;|" $filePath;
