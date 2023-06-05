#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

function getFilePatternLineNums --argument-names filePath pattern
  grep -nP "$pattern" "$filePath" \
  | cut -d':' -f1 \
  ;
end
# | grep -nP '^'  \ # Add Line numbers if I would parse those instead.
