#!/usr/bin/env fish

not type -q 'altPrint';
and function altPrint
  echo $argv 1>&2;
end
