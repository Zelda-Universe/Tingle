#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

if test -z "$imageProg" -a -z "$imageProgGM"
  if type -q 'gm'
    set -x imageProgGM 'true'  ;
    if test -z "$imageProg"
      set -x imageProg 'gm'    ;
    end
  else
    set -x imageProgGM 'false' ;
  end
end

if test -z "$imageProg" -a -z "$imageProgIM"
  if type -q 'magick'
    set -x imageProgIM 'true'  ;
    if test -z "$imageProg"
      set -x imageProg 'magick';
    end
  else
    set -x imageProgIM 'false' ;
  end
end
