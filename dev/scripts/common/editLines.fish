#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/altPrint.fish"              ;
source "$SDIR/errorPrint.fish"            ;
source "$SDIR/getFilePatternLineNums.fish";

function editLines --argument-names filePath pattern sedCmd procLinesArrExpr
  if test -z "$filePath"
    errorPrint 'No file provided; exiting...';
    return 1;
  end

  if test -z "$pattern"
    errorPrint 'No pattern provided; exiting...';
    return 2;
  end

  if test -z "$sedCmd"
    errorPrint 'No sed command provided; exiting...';
    return 3;
  end

  if test -z "$procLinesArrExpr"
    set procLinesArrExpr '0:';
  end

  set lineNums (
    getFilePatternLineNums  \
      "$filePath"           \
      "$pattern"            \
    | jq -sr ".[$procLinesArrExpr][]"
  );
  # debugPrint "lineNums: $lineNums";
  # debugPrint -n "count lineNums: "; and count $lineNums;

  if test -z "$lineNums"
    # altPrint 'Pattern not found in file, at all, or after first match, from no line numbers being produced; exiting...';
    return;
  end

  set sedExprOpts (
    for num in $lineNums
      echo -- "-e" "$num $sedCmd";
    end
  );
  # debugPrint "sedExprOpts: $sedExprOpts";

  sed -i $sedExprOpts "$filePath"
  # sed $sedExprOpts "$filePath" # Testing
end
