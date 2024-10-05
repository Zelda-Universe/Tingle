#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));


if test                       \
  \(                          \
        -z "$dbUser"          \
    -a  -z "$dbUserProd"      \
  \) -o \(                    \
        -z "$dbPassword"      \
    -a  -z "$dbPasswordProd"  \
  \)
  errorPrint 'Missing any of these:';
  errorPrint "dbUserProd: $dbUserProd";
  errorPrint "dbPasswordProd: $dbPasswordProd";

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

not set -q ignoreTables;
and set -x ignoreTables 'schema_migrations';

"$SDIR/run.sh";
