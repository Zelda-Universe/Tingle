#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

if test -z "$dbUserProd" -o  -z "$dbPasswordProd"
  errorPrint 'Missing any of these:';
  errorPrint "dbUserProd    : $dbUserProd" ;
  errorPrint -n 'dbPasswordProd (wc -l): ' ;
  and altPrint (echo -n "$dbPasswordProd" | wc -c);

  return 1;
end

if test -z "$dbSocketProd" -a -z "$dbPortProd"
  echo 'dbSocketProd and dbPortProd both not set; exiting...';
  return 2;
end

set -x dbUser   \
  "$dbUserProd" \
;

set -x dbPassword   \
  "$dbPasswordProd" \
;

if test -n "$dbSocketProd"
  set -x dbSocket "$dbSocketProd";
end
if test -n "$dbPortProd"
  set -x dbPort "$dbPortProd";
end

if test -z "$convergeInPlace"
  set -x convergeInPlace 'true';
end
if not set -q ignoreTables
  set -x -a ignoreTables 'schema_migrations';
end
set -x otherConnectionOptions '--skip-ssl';

"$SDIR/run.sh";
