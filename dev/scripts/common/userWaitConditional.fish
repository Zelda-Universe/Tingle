#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

not type -q 'userWaitConditional'; and function userWaitConditionalConditional
  test "$manualStep" = "true";
  and read -P 'Press enter to continue...' 1>&2 < /dev/tty;
end
