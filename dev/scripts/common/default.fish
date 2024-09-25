#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'default';
and function default
  for value in $argv
    if test -n "$value"
      echo "$value";
      break;
    end
  end
end
