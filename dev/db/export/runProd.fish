#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

if test                         \
  \(                            \
        -z "$dbUser"            \
    -a  -z "$dbUserProd"        \
  \) -o \(                      \
        -z "$dbPassword"        \
    -a  -z "$dbPasswordProd"    \
  \) -o \(                      \
    \(                          \
          -z "$dbPortProd"      \
      -a  -z "$dbPortProd"      \
    \) -a \(                    \
          -z "$dbSocketProd"    \
      -a  -z "$dbSocketProd"    \
    \)                          \
  \)

  errorPrint 'Missing all of these:'          ;
  errorPrint "dbUserProd    : $dbUserProd"    ;
  errorPrint -n 'dbPasswordProd (wc -l): '    ; and altPrint (echo "$dbPasswordProd" | wc -c);
  errorPrint;
  errorPrint 'Missing any of these:'          ;
  errorPrint "dbPortProd    : $dbPortProd"    ;
  errorPrint "dbSocketProd  : $dbSocketProd"  ;

  return 1;
end

test -z "$dbUser";
and set -x dbUser \
  "$dbUserProd"   \
;

test -z "$dbPassword";
and set -x dbPassword \
  "$dbPasswordProd"   \
;

set -a ignoreTables 'schema_migrations';

    set -q dbPortProd             ;
and set -x dbSocket "$dbPortProd" ;

    set -q dbSocketProd             ;
and set -x dbSocket "$dbSocketProd" ;

set -x convergeInPlace 'true';

"$SDIR/run.sh";

set -e convergeInPlace;
