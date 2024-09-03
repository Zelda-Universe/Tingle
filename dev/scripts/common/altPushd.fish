#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'altPushd';
and function altPushd
  if test (uname -o) = 'Cygwin'
    set path (cygpath $argv);
  else
    set path $argv;
  end

  pushd $path;
end
