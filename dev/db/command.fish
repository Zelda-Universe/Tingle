#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

## Function Library
begin
  source "$SDIR/../scripts/common/debugPrint.fish";
end

## Main Environment Configuration
begin
  test -z "$dbHost"       ; and        set dbHost ""            ;
  test -z "$dbName"       ; and        set dbName "zeldamaps"   ;
  # test -z "$dbOthConnOpts"; and set dbOthConnOpts ""            ;
  test -z "$dbPort"       ; and        set dbPort ""            ;
  test -z "$dbSocket"     ; and      set dbSocket ""            ;
  # test -z "$dbConStr"     ; and      set dbConStr ""            ;
  test -z "$dryRun"       ; and        set dryRun "false"       ;
  test -z "$dbClientExe"  ; and   set dbClientExe "mariadb"     ;
  test -z "$dbDumpExe"    ; and     set dbDumpExe "mariadb-dump";
  test -z "$verbose"      ; and       set verbose "false"       ;
end

## Derived Configuration & Internal Variables
begin
  ## Database connection Details
  begin
    while test -z "$databaseUser"
      if test -z "$dbConStr"
        if test -z "$databaseUser"
          set databaseUser (
            js-yaml "$SDIR/config.yml" \
            | jq -r '.development.username'
          );
          # debugPrint "databaseUser: $databaseUser";
        end
        if test -z "$databaseUser"
          read -P "Database Username: " databaseUser;
          echo;
        end
      end
    end

    # Only asks once as optional if no other connection information is provided first.
    if test -z "$databasePassword"
      if test -z "$dbConStr"
        if test -z "$databasePassword"
          # databasePassword="$(grep 'DBPASSWD=' "$SDIR/../../../.env" | sed 's|\\"|"|g' | cut -d'=' -f2 | head -c -2 | tail -c +2)";
          set databasePassword (
            js-yaml "$SDIR/config.yml" \
            | jq -r '.development.password'
          );
          # debugPrint "databasePassword: $databasePassword";
        end
        if test -z "$databasePassword"
          # echo "$dbConStr" | grep -vq " -p" && \
          # echo "$dbConStr" | grep -vq " --password"; then
          read -s -P "Database Password: " databasePassword;
          echo;
        end
      end
    # else
      #databasePassword="$(echo "$databasePassword" | sed -e 's|)|\\\)|g' -e 's|\x27|\\\\x27|g')";
    end

    # debugPrint "databasePassword: $databasePassword";
    # echo "$databasePassword"
    # echo "$databasePassword" | sed -r "s|([\`'\"\$])|\\\\\1|g";
    # databasePassword="$(echo "$databasePassword" | sed -r "s|([\`'\"\$\\])|\\\\\1|g")";
    set databasePassword (
      echo "$databasePassword" \
      | sed -r "s|([\"\$\\])|\\\\\1|g"
    );
    # debugPrint "databasePassword: $databasePassword";

    if test -z "$dbConStr"
      set -a dbConStr                   \
        $dbOthConnOpts                  \
        --user="$databaseUser"          \
        --password="$databasePassword"  \
      ;
      # set -a dbConStr --user=$databaseUser --password=$databasePassword
      # debugPrint "dbConStr: $dbConStr";
      # debugPrint -n 'dbConStr: '; and count $dbConStr;

      if test -n "$dbHost"
        set dbConStr -a     \
          --host="$dbHost"  \
        ;
      end
      if test -n "$dbSocket"
        set dbConStr -a         \
          --protocol=socket     \
          --socket="$dbSocket"  \
        ;
      else if test -n "$dbPort"
        set dbConStr -a     \
          --port="$dbPort"  \
        ;
      end
    end
  end

  if test -z "$dbClientCommonOptions"
    set -a dbClientCommonOptions $dbConStr          ;
    set -a dbClientCommonOptions --database=$dbName ;
  end

  set command               \
    $dbClientExe            \
    $dbClientCommonOptions  \
  ;

  if test "$verbose" = 'true'
    set -a command "-v";
  end
end

# if test (count $argv) -gt 0
#   for arg in $argv
#   set -a command -e $arg;
# end

# debugPrint "command: $command";
# debugPrint -n 'count command: '; and count $command;
# for commandTerm in $command
#   debugPrint "commandTerm: $commandTerm";
# end

if test "$dryRun" = 'false' -o "$force" = 'true'
  $command;
end
