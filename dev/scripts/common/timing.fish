#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set timeStart -1;
set timeEnd -1;

not type -q 'timerStart';
and function timerStart
  set timeStart (date "+%s");
end

not type -q 'timerStop';
and function timerStop
  set timeEnd (date "+%s");
end

not type -q 'timerDuration';
and function timerDuration
  if test "$timeStart" -lt 0 -o "$timeEnd" -lt 0
    echo 'Error: Time start or stop was not set yet; returning...' 1>&2;
    return;
  end

  echo "$timeEnd" - "$timeStart" | bc;
end