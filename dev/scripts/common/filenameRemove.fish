#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/filenameRemoveExtension.fish";

not type -q 'filenameRemove';
and function filenameRemove --argument-names fileName
  # Alt: `grep -oP '\.[^.]{0,16}$'`

  if test -n "$fileName"
    echo "$fileName"
  else
    cat
  # end | grep --color=never -Po '([^.]+)$';
  # end | sed -r 's|^[^.]+.||';
  end \
  | sed -r 's|^'(
    filenameRemoveExtension "$fileName" \
    | sed -r 's|([][()])|\\\\\\1|g'
  )'||';
end
