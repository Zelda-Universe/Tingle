#!/usr/bin/env fish

nspx -x -o (echo "$argv[1]" | sed -r 's|\.[^.]+$||') -f "$argv[1]";