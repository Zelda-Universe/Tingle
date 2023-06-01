#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/errorPrint.fish"            ;
source "$SDIR/getFilePatternLineNums.fish";

function editLines --argument-names filePath pattern procLinesArrExpr sedCmd
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

  set lineNums (
    getFilePatternLineNums  \
      "$filePath"           \
      "$pattern"            \
    | jq -sr ".[$procLinesArrExpr][]"
  );
  # debugPrint "lineNums: $lineNums";
  # debugPrint -n "count lineNums: "; and count $lineNums;

  if test -z "$lineNums"
    # errorPrint 'Pattern not found in file, at all, or after first match, from no line numbers being produced; exiting...';
    return 1;
  end

  set sedExprOpts (
    for num in $lineNums
      echo -- "-e" "$num $sedCmd";
    end
  );
  # debugPrint "sedExprOpts: $sedExprOpts";

  if test -n "$filePath"
    sed -i $sedExprOpts "$filePath"
    # sed $sedExprOpts "$filePath" # Testing
  else
    sed $sedExprOpts;
  end
  ;
end
