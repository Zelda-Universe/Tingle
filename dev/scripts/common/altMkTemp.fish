#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'altMkTemp';
and function altMkTemp
  set path (mktemp $argv);

  if test (uname -o) = 'Cygwin'
    cygpath -m "$path";
  else
    echo "$path";
  end
end
