#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/errorPrint.fish";

not type -q 'altWrite';
and function altWrite --argument-names outputFile
  if test -z "$outputFile"
    errorPrint "outputFile must be provided as the first argument; exiting...";
    return 1;
  end
  
  echo $argv[2..] | tee -a "$outputFile" > /dev/null;
end
