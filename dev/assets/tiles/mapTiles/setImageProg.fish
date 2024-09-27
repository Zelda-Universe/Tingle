#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint 'Entering setImageProg.fish...';

# debugPrint "imageProg   : $imageProg"   ;
# debugPrint "imageProgIM : $imageProgIM" ;
# debugPrint "imageProgGM : $imageProgGM" ;
# debugPrint "preferIM    : $preferIM"    ;
# debugPrint "preferGM    : $preferGM"    ;

if test -z "$imageProg"
  if test -z "$imageProg" -a -z "$imageProgIM" -a "$preferGM" != 'true'
    if type -q 'magick'
      set -x imageProgIM 'true'  ;
      if test -z "$imageProg"
        set -x imageProg 'magick';
      end
    else
      set -x imageProgIM 'false' ;
    end
  end

  # debugPrint "imageProg   : $imageProg"   ;
  # debugPrint "imageProgIM : $imageProgIM" ;
  # debugPrint "imageProgGM : $imageProgGM" ;
  # debugPrint "preferIM    : $preferIM"    ;
  # debugPrint "preferGM    : $preferGM"    ;

  if test -z "$imageProg" -a -z "$imageProgGM" -a "$preferIM" != 'true'
    if type -q 'gm'
      set -x imageProgGM 'true'  ;
      if test -z "$imageProg"
        set -x imageProg 'gm'    ;
      end
    else
      set -x imageProgGM 'false' ;
    end
  end

  # debugPrint "imageProg   : $imageProg"   ;
  # debugPrint "imageProgIM : $imageProgIM" ;
  # debugPrint "imageProgGM : $imageProgGM" ;
  # debugPrint "preferIM    : $preferIM"    ;
  # debugPrint "preferGM    : $preferGM"    ;

  if test -z "$imageProg"
    errorPrint 'imageProg still empty; exiting...';
    return 1;
  end
end

# debugPrint 'Leaving setImageProg.fish...';
