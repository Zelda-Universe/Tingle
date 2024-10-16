#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

## General Function Library
source "$SDIR/../scripts/common/errorPrint.fish";

echo 'Create a new migration for database changes by providing';
echo 'title-cased terms, typically of the format <TableName> <Verb> <Short Changes Description>';
echo;

if begin
  not read -P 'Migration Proper Name: ' migrPropName;
  or test -z "$migrPropName";
end
  errorPrint 'No migration name provided; exiting...';
  return 1;
end

set migrClassName (
  echo "$migrPropName" \
  | tr -d ' '
);

if test -z "$migrClassName"
  errorPrint 'No encoded migration name found; exiting...';
  return 2;
end

rake db:new_migration name="$migrClassName";
