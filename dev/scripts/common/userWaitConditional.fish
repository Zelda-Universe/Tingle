#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'userWaitConditional';
and function userWaitConditional
  test "$manualStep" = "true";
  and read -P 'Press enter to continue...' 1>&2 < /dev/tty;
end
