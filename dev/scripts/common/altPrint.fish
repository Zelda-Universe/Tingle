#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'altPrint';
and function altPrint
  echo $argv 1>&2;
end
