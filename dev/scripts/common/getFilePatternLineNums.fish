#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

function getFilePatternLineNums \
  --argument-names filePath pattern

  if test -z "$filePath"
    # read output;
    # set output (cat);
    while read line
      set -a output "$line";
    end
    # errorPrint 'No file provided; exiting...';
    # return 1;
  else
    if test ! -f "$filePath"
      errorPrint 'File does not exist, or is not a file; exiting...';
      return 2;
    else
      set output (cat "$filePath");
    end
  end

  string join -- \n $output \
  | grep -nP "$pattern"     \
  | cut -d':' -f1           \
  ;
end
# | grep -nP '^'  \ # Add Line numbers if I would parse those instead.
