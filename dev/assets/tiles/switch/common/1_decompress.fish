#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

nsz -D (echo "$argv[1]" | tr -d '\r');

# Sample creation/compression command:
# nsz -m 4 -C -l 22 -o (dirname "$nsp")'.nsz' "$nsp"
