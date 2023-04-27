#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set timeStart -1;
set timeEnd   -1;

not type -q 'timerStart';
and function timerStart --argument-names scope
  if test -n "$scope"
    set -g timeStartArr$scope (date "+%s");
    export timeStartArr$scope;
    # debugPrint "timeStartArr\$scope: timeStartArr$scope";
    # debugPrint "eval echo \"\$timeStartArr$scope\": "(eval echo "\$timeStartArr$scope");
    # set -S timeStartArrFillIn
    # debugPrint 'set | grep timeStart: '(set | grep timeStart);
  else
    set timeStart (date "+%s");
    # set -S timeStart
  end
end

not type -q 'timerStop';
and function timerStop --argument-names scope
  if test -n "$scope"
    set -g timeEndArr$scope (date "+%s");
  else
    set timeEnd (date "+%s");
  end
end

not type -q 'timerDuration';
and function timerDuration --argument-names scope
  if test -n "$scope"
    # debugPrint 'set | grep timeStart: '(set | grep timeStart);
    set timeStartArrScoped  "timeStartArr$scope";
    # debugPrint "timeStartArrScoped: $timeStartArrScoped";
    # debugPrint "\$\$timeStartArrScoped: $$timeStartArrScoped";
    set timeEndArrScoped    "timeEndArr$scope"  ;
    # debugPrint "timeEndArrScoped: $timeEndArrScoped";
    # debugPrint "\$\$timeEndArrScoped: $$timeEndArrScoped";
    if test "$$timeStartArrScoped" -lt 0 -o "$$timeEndArrScoped" -lt 0
      errorPrint "Time start or stop with scope \"$scope\" was not set yet; returning...";
      return 1;
    else
      echo "$$timeEndArrScoped - $$timeStartArrScoped" | bc;
    end
  else
    if test "$timeStart" -lt 0 -o "$timeEnd" -lt 0
      errorPrint 'Time start or stop was not set yet; returning...';
      return 1;
    else
      echo "$timeEnd" - "$timeStart" | bc;
    end
  end
end