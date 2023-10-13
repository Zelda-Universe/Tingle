#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

if test "$argv[1]" = 'refresh'
  set modeInstall 'false' ;
  set modeRefresh 'true'  ;
else
  set modeInstall 'true'  ;
  set modeRefresh 'false' ;
end


if not read -s -P 'Database Passphrase: ' dbPP;
  errorPrint 'This information is required for root account database access; exiting...';
  exit 1;
end


set sqlCreateDB '
  CREATE SCHEMA `zeldamaps`
  DEFAULT CHARACTER SET latin1
  DEFAULT COLLATE latin1_swedish_ci
  ;
';

if test "$modeInstall" = 'true'
  set sqlUserAccessCreate "
  CREATE USER 'zeldamaps'@'localhost'
  IDENTIFIED BY '<password>'
  ;
  ";
  set sqlUserAccessGrantEnough "
  GRANT
  SELECT,
  INSERT,
  UPDATE,
  DELETE
  ON `zeldamaps`.*
  TO 'zeldamaps'@'localhost'
  ;
  ";
  # set sqlUserAccessGrantAll "
  #   GRANT
  #   ALL PRIVILEGES
  #   ON `zeldamaps`.*
  #   TO 'zeldamaps'@'localhost'
  #   ;
  # ";

  set sqlUserManageCreate "
  CREATE USER 'zeldamaps-manage'@'localhost'
  IDENTIFIED BY '<password>'
  ;
  ";
  set sqlUserManageGrantEnough "
  GRANT
    SELECT,
    INSERT,
    UPDATE,
    DELETE,
    DROP,
    CREATE,
    LOCK TABLES,
    ALTER
  ON `zeldamaps`.*
  TO 'zeldamaps-manage'@'localhost'
  ;
  ";
end

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

echo 'Running queries...';
echo;

# for sqlQuery in $sqlQueries
#   echo "sqlQuery: $sqlQuery";
#   if not echo "$sqlQuery" | mariadb -uroot -p$dbPP
#     exit $status;
#   else
#     echo;
#   end
# end

if pushd "$SDIR/../samples/zeldamaps"
  find -type f -iname '*.sql' \
  | sort | while read file
    echo "Importing \"$file\"..."   ;
    '../../command.fish' < "$file" ;
  end

  popd;
end
