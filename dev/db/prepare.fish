#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# Useful options for non-default scenarios:
# set -x -a options -P '3306';

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../scripts/common/errorPrint.fish";

# Preparation, intialization, and validation.
begin
  # Validate script-dependent commands.
  for exe in 'mariadb' 'js-yaml'
    if not type -q "$exe"
      errorPrint "Executable does not exist: \"$exe\"; exiting...";
      return 1;
    end
  end

  # Prepare to populate empty `dbAdvPP` value by
  # reading manage account credentials from
  # db config yml file.
  if test (uname -o) = 'Cygwin'
    set cYmlPath (cygpath -m "$SDIR/config.yml");
  else
    set cYmlPath "$SDIR/config.yml";
  end
end

# Read and validate input
begin
  ## Mode
  set mode "$argv[1]";

  if test -z "$mode"
    errorPrint 'Mode must not be empty; exiting...';
    return 2;
  end

  if not echo "$mode" \
    | grep -qP '((install)|(refreshAll)|(refreshSpecific))'
    errorPrint 'Mode must be one of either \"install\", \"refreshAll\", or \"refreshSpecific\"; exiting...';
    return 3;
  end

  ## Credentials

  if test -z "$dbRootUser"
    set dbRootUser 'root';
  end

  if test -z "$dbRootPP"
    if not read -s -P 'Database root passphrase: ' dbRootPP
      errorPrint "Reading canceled; exiting...";
      return 4;
    end
    if test -z "$dbRootPP"
      errorPrint "Input still not provided, or is empty; exiting...";
      return 5;
    end
  end

  if test -z "$dbBasicPP"
    set dbBasicPP (
      grep              \
        'DBPASSWD='     \
        "$SDIR/../../.env"  \
      | sed 's|\\\\"|"|g'   \
      | cut -d'=' -f2   \
      | sed -r      \
        -e 's|^"||' \
        -e 's|"$||'
    );
    if test -z "$dbBasicPP"
      if not read -s -P 'Database site passphrase: ' dbBasicPP
        errorPrint "Reading canceled; exiting...";
        return 6;
      end
    end
    if test -z "$dbBasicPP"
      errorPrint "Input still not provided, or is empty; exiting...";
      return 7;
    end
    set dbBasicPP (
      echo "$dbBasicPP" \
      | sed -r "s|(['])|\\\\\1|g"
    );
  end

  if test -z "$dbAdvPP"
    set dbAdvPP (
      js-yaml "$cYmlPath" \
      | jq -r '.development.password'
    );
    if test -z "$dbAdvPP"
      if not read -s -P 'Database manage passphrase: ' dbAdvPP
        errorPrint "Reading canceled; exiting...";
        return 8;
      end
    end
    if test -z "$dbAdvPP"
      errorPrint "Input still not provided, or is empty; exiting...";
      return 9;
    end
    set dbAdvPP (
      echo "$dbAdvPP" \
      | sed -r "s|(['])|\\\\\1|g"
    );
  end
end

## Query Preparation
begin
  set sqlCreateDB                         \
    'CREATE SCHEMA `zeldamaps`'\n         \
    'DEFAULT CHARACTER SET latin1'\n      \
    'DEFAULT COLLATE latin1_swedish_ci'\n \
    ';'                                   \
  ;
  set sqlDropDB \
    'DROP SCHEMA IF EXISTS `zeldamaps`'\n \
    ';' \
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
      "$sqlDropDB"                \
      "$sqlCreateDB"              \
      "$sqlUserAccessCreate"      \
      "$sqlUserAccessGrantEnough" \
      "$sqlUserManageCreate"      \
      "$sqlUserManageGrantEnough" \
    ;
  else if test "$mode" = 'refreshAll'
    set sqlQueries    \
      "$sqlDropDB"    \
      "$sqlCreateDB"  \
    ;
  end
end

## Execution
begin
  if test -n "$sqlQueries"
    echo 'Running queries...';
    echo;

    for sqlQuery in $sqlQueries
      echo 'sqlQuery: '\n"$sqlQuery";

      if not echo "$sqlQuery" | mariadb -u"$dbRootUser" -p"$dbRootPP" $options
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
end
