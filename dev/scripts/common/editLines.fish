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
    | jq -sMr ".[$procLinesArrExpr][]"
  );
  # debugPrint "lineNums: $lineNums";
  # debugPrint -n "count lineNums: "; and count $lineNums;
  # echo $lineNums | xxd; # Testing

  if test -z "$lineNums"
    # altPrint 'Pattern not found in file, at all, or after first match, from no line numbers being produced; exiting...';
    return;
  end

  set sedExprOpts (
    for num in $lineNums
      echo -- '-e';
      echo "$num$sedCmd";
      # echo 's|123|h|g'; # Testing
    end
    echo -- '--';
  );
  # debugPrint "sedExprOpts: $sedExprOpts";
  # debugPrint 'count sedExprOpts: '(count $sedExprOpts);

  # echo sed -i $sedExprOpts "$filePath"; # Testing
  sed -i $sedExprOpts "$filePath";
  # echo sed $sedExprOpts "$filePath"; # Testing
  # echo sed $sedExprOpts "$filePath" | xxd; # Testing
  # string join -- \n sed $sedExprOpts "$filePath"; # Testing
  # sed $sedExprOpts "$filePath" | head; # Testing
  # cat "$filePath" | sed $sedExprOpts | head; # Testing
end
