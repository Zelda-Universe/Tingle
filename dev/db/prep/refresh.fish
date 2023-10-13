#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

"$SDIR/install.fish" 'refresh';
