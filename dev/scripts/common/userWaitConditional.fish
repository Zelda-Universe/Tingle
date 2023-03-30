#!/usr/bin/env fish

not type -q 'userWaitConditional'; and function userWaitConditionalConditional
  test "$manualStep" = "true";
  and read -P 'Press enter to continue...' 1>&2 < /dev/tty;
end
