#!/usr/bin/env fish

function filenameRemoveExtension --argument-names filename
  #Alt: `sed -r 's|\.[^.]{0,16}$||')`
  echo "$filename" | sed -r 's|\.[^.]+$||';
end
