#!/usr/bin/env fish

not type -q 'default';
and function default
  for value in $argv
    if test -n "$value"
      echo "$value";
      break;
    end
  end
end
