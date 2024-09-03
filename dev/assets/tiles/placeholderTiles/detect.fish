#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint "included0Detect: $included0Detect";
if test "$included0Detect" = 'true'
  exit;
end
set included0Detect 'true';
# debugPrint "included0Detect: $included0Detect";

# debugPrint "srcFile: $srcFile";
set isPHType (
  if begin
    test "$generatePHTiles" = 'true'
    or echo "$srcFile" | grep -qP \
      '<((placeholder)|(fake)|(test)|(debug)|(sample)|(example))>' \
    ;
  end
    echo 'true' ;
  else
    echo 'false';
  end
);
# debugPrint "isPHType: $isPHType";

if test "$isPHType" = 'true'
  # debugPrint "srcFileDims: $srcFileDims";
  if test -z "$srcFileDims"
    errorPrint "srcFileDims not provided; exiting...";
    return 2;
  end
else
  if test -z "$srcFile"
    errorPrint 'srcFile not provided; exiting...';
    return 1;
  end

  if test ! -e "$srcFile"
  	echo "Error: Source file must exist.";
  	exit;
  end
end
