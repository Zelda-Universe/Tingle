#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../scripts/common/errorPrint.fish";

## Mode
set mode "$argv[1]";

if test -z "$mode"
  errorPrint 'Mode must not be empty; exiting...';
  return 1;
end

if not echo "$mode" \
  | grep -qP '((install)|(refreshAll)|(refreshSpecific))'
  errorPrint 'Mode must be one of either \"install\", \"refreshAll\", or \"refreshSpecific\"; exiting...';
  return 2;
end

## Credentials

# if test -z "$dbUser"
#   set dbUser 'root';
# end

## Query Preparation

set sqlCreateDB                         \
  'CREATE SCHEMA `zeldamaps`'\n         \
  'DEFAULT CHARACTER SET latin1'\n      \
  'DEFAULT COLLATE latin1_swedish_ci'\n \
  ';'                                   \
;

## When installing, add more queries to create users with certain permissions.
if test "$mode" = 'install'
  set sqlUserAccessCreate           \
    'CREATE USER '\n                \
    'IF NOT EXISTS'\n               \
    "'zeldamaps'@'localhost'"\n     \
    "IDENTIFIED BY '$dbBasicPP'"\n  \
    ';'                             \
  ;
  set sqlUserAccessGrantEnough      \
    'GRANT'\n                       \
    '  SELECT,'\n                   \
    '  INSERT,'\n                   \
    '  UPDATE,'\n                   \
    '  DELETE'\n                    \
    'ON `zeldamaps`.*'\n            \
    "TO 'zeldamaps'@'localhost'"\n  \
    ';'                             \
  ;
  # set sqlUserAccessGrantAll "
  #   GRANT
  #   ALL PRIVILEGES
  #   ON `zeldamaps`.*
  #   TO 'zeldamaps'@'localhost'
  #   ;
  # ";

  set sqlUserManageCreate               \
    'CREATE USER '\n                    \
    'IF NOT EXISTS'\n                   \
    "'zeldamaps-manage'@'localhost'"\n  \
    "IDENTIFIED BY '$dbAdvPP'"\n        \
    ';'                                 \
  ;
  set sqlUserManageGrantEnough            \
    'GRANT'\n                             \
    '  SELECT,'\n                         \
    '  INSERT,'\n                         \
    '  UPDATE,'\n                         \
    '  DELETE,'\n                         \
    '  DROP,'\n                           \
    '  CREATE,'\n                         \
    '  LOCK TABLES,'\n                    \
    '  ALTER'\n                           \
    'ON `zeldamaps`.*'\n                  \
    "TO 'zeldamaps-manage'@'localhost'"\n \
    ';'                                   \
  ;
end

## Based on the mode, add the appropriate queries to the processing list.
if test "$mode" = 'install'
  set sqlQueries                \
    "$sqlCreateDB"              \
    "$sqlUserAccessCreate"      \
    "$sqlUserAccessGrantEnough" \
    "$sqlUserManageCreate"      \
    "$sqlUserManageGrantEnough" \
  ;
else if test "$mode" = 'refreshAll'
  set sqlQueries                \
    "$sqlCreateDB"              \
  ;
end

## Execution

if test -n "$sqlQueries"
  echo 'Running queries...';
  echo;

  for sqlQuery in $sqlQueries
    echo 'sqlQuery: '\n"$sqlQuery";

    if not echo "$sqlQuery" | mariadb -p"$dbRootPP"
      errorPrint 'Last query execution failed; skipping remaining queries...';
      exit 4;
    else
      echo;
    end
  end
end

echo 'Loading sample data...';
echo;

if pushd "$SDIR/samples/zeldamaps"
  if test -n "$tableNames"
    echo 'Limiting loading to specified tables...';
    echo "$tableNames";
    echo;
  end
  # debugPrint "tableNames: $tableNames";

  find -type f -iname '*.sql' -printf '%f\n' \
  | sort | while read file
    # debugPrint "fRE f: "(filenameRemoveExtension "$file");

    if begin
      test -z "$tableNames";
      or echo "$tableNames" \
      | grep -qP '\b'(filenameRemoveExtension "$file")'\b'
    end
      echo "Importing \"$file\"...";
      if not "$SDIR/command.fish" < "$file"
        errorPrint 'Last query file import failed; skipping remaining files...';
        exit 5;
      end
    end
  end

  popd;
end
