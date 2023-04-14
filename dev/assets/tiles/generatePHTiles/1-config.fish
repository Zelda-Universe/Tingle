#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# set SDIR "$PWD/"(dirname (status filename));
set SDIR (dirname (status filename));
# debugPrint "SDIR: $SDIR";
# debugPrint "SDIR: $SDIR/../../../..";
# debugPrint "rl -f SDIR ..x4: "(readlink -f "$SDIR/../../../..");

# debugPrint "included1Config: $included1Config";
if test "$included1Config" = 'true'
  exit;
end
set included1Config 'true';
# debugPrint "included1Config: $included1Config";

test -z "$outDir"             ; and set outDir            "$argv[1]";
test -z "$outputZoomFolders"  ; and set outputZoomFolders 'false'   ;
test -z "$fileExt"            ; and set fileExt           'png'     ;

if test -z "$pathNameMask"
  if test "$outputAxisFolders" = 'true'
    set pathNameMask '{$z}/{$x}/{$y}';
  else
    if test "$outputZoomFolders" = 'true'
      set pathNameMask '{$z}/{$x}_{$y}';
    else
      set pathNameMask '{$z}_{$x}_{$y}';
    end
  end
end
if test -n "$labelMaskChoice"
  if test "$labelMaskChoice" = 'pathName'
    test -z "$labelMask"; and set labelMask "$pathNameMask";
  else if test "$labelMaskChoice" = 'gridText'
    test -z "$labelMask"; and set labelMask '{$z}\n{$x}x{$y}';
  else if test "$labelMaskChoice" = 'gridTextLabeled'
    test -z "$labelMask"; and set labelMask 'Z: {$z}\n\nX: {$x} Y:{$y}';
  else if test "$labelMaskChoice" = 'vertText'
    test -z "$labelMask"; and set labelMask '{$z}\n\n{$x}\n{$y}';
  else if test "$labelMaskChoice" = 'vertTextLabeled'
    test -z "$labelMask"; and set labelMask 'Z: {$z}\ X: {$x} Y:{$y}';
  end
end

test -z "$force"        ; and set force         'false'   ;

# Maybe obselete since eval and pathNameMask?
# test -z "$fileNameMask" ; and set fileNameMask  '%s'      ;
test -z "$background"   ; and set background    '#333344' ;
test -z "$font"         ; and set font                      \
  (
    readlink -f \
      "$SDIR/../../../../fonts/HyliaSerifBeta-Regular.otf"  \
    ;
  )
;
# debugPrint "font: $font";
test -z "$fill"         ; and set fill          'white'   ;
test -z "$tileSize"     ; and set tileSize      '256'     ;
test -z "$pointsize"    ; and set pointsize     '48'      ;
test -z "$gravity"      ; and set gravity       'center'  ; # or north =/
test -z "$bordercolor"  ; and set bordercolor   '#999999' ;
test -z "$bordersize"   ; and set bordersize    '5'       ;

test "$isPHType" != 'true' -a -z "$outDir";
and read -P 'Output Directory: ' outDir;

# I intentionally check this instead of creating it for the user in case
# they provide the wrong argument by accident.  Don't want to create a mess
# for them somewhere in some unintentional place.
if test "$isPHType" != 'true' -a \( \
  -z "$outDir" \
  -o ! -e "$outDir" \
  -o ! -d "$outDir" \
  \)
  echo "Error: Output directory must be provided as the first argument, exist, and be a directory.";
  exit;
end
