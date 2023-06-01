#!/usr/bin/env fish

function getFilePatternLineNums --argument-names filePath pattern
  grep -nP "$pattern" "$filePath" \
  | cut -d':' -f1 \
  ;
end
# | grep -nP '^'  \ # Add Line numbers if I would parse those instead.
