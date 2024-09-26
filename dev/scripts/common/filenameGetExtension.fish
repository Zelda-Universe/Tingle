#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/filenameRemove.fish";

not type -q 'filenameGetExtension';
and function filenameGetExtension --argument-names file
  # filenameRemove "$file" | tail -c +2;
  # filenameRemove "$file";
  filenameRemove "$file" | sed -r 's|^\.||';
end
