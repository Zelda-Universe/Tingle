#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

function filenameRemoveExtension --argument-names filePath
  if test -z "$filePath"
    echo 'Error: File Path not provided; exiting...' 1>&2;
    return 1;
  end

  # Alt: `sed -r 's|\.[^.]{0,16}$||')`

  if test -n "$filePath"
    echo "$filePath"
  else
    cat
  # end | sed -r 's|\.[^.]+$||';
end | sed -r 's|\.[[:alnum:].]+$||';
end
