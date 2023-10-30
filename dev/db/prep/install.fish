#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

## Mode

if test "$argv[1]" = 'refresh'
  set modeInstall 'false' ;
  set modeRefresh 'true'  ;
else
  set modeInstall 'true'  ;
  set modeRefresh 'false' ;
end

## Credentials

# if test -z "$dbUser"
#   set dbUser 'root';
# end

if test -z "$dbRootPP"
  if not read -s -P 'Database Root Passphrase: ' dbPP;
    errorPrint 'This information is required for root account database access; exiting...';
    exit 1;
  end
end
if test -z "$dbBasicPP"
  if not set -x dbBasicPP (
    read -s -P 'Database Basic Account Passphrase: ' \
    | sed -r 's|\'|\\\\\'|g'
    )

    errorPrint 'This information is required for default project account database access; exiting...';
    exit 2;
  end
end
if test -z "$dbAdvPP"
  if not set -x dbAdvPP (
    read -s -P 'Database Advanced Account Passphrase: ' \
    | sed -r 's|\'|\\\\\'|g'
    )
    errorPrint 'This information is required for manage project account database access; exiting...';
    exit 3;
  end
end

## Query Preparation

set sqlCreateDB                         \
  'CREATE SCHEMA `zeldamaps`'\n         \
  'DEFAULT CHARACTER SET latin1'\n      \
  'DEFAULT COLLATE latin1_swedish_ci'\n \
  ';'                                   \
;

## When installing, add more queries to create users with certain permissions.
if test "$modeInstall" = 'true'
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
if test "$modeInstall" = 'true'
  set sqlQueries                \
    "$sqlCreateDB"              \
    "$sqlUserAccessCreate"      \
    "$sqlUserAccessGrantEnough" \
    "$sqlUserManageCreate"      \
    "$sqlUserManageGrantEnough" \
  ;
else if test "$modeRefresh" = 'true'
  set sqlQueries                \
    "$sqlCreateDB"              \
  ;
end

## Execution

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

if pushd "$SDIR/../samples/zeldamaps"
  find -type f -iname '*.sql' -printf '%f\n' \
  | sort | while read file
    echo "Importing \"$file\"...";
    if not '../../command.fish' < "$file" ;
      errorPrint 'Last query file import failed; skipping remaining files...';
      exit 5;
    end
  end

  popd;
end
