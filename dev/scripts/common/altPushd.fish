#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'altPushd';
and function altPushd
  if test (uname -o) = 'Cygwin'
    pushd (cygpath $argv);
  end
end
