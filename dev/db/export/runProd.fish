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
  \)

  errorPrint 'Missing all of these:'          ;
  errorPrint "dbUserProd    : $dbUserProd"    ;
  errorPrint -n 'dbPasswordProd (wc -l): '    ; and altPrint (echo -n "$dbPasswordProd" | wc -c);

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

set -x convergeInPlace 'true';

"$SDIR/run.sh";
