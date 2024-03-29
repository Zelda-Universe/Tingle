#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'filenameAddSuffix';
and function filenameAddSuffix --argument-names filePath suffix
  if test -z "$filePath"
    echo 'Error: File Path not provided; exiting...' 1>&2;
    return 1;
  end
  if test -z "$suffix"
    echo 'Error: Suffix not provided; exiting...' 1>&2;
    return 2;
  end

  echo (
    filenameRemoveExtension "$filePath"
  )"$suffix."(
    filenameGetExtension "$filePath"
  );
end
