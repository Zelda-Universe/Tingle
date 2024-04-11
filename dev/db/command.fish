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
  test -z "$dbDump"       ; and        set dbDump "false"       ;
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
    while test -z "$dbUser"
      if test -z "$dbConStr"
        if test -z "$dbUser"
          set dbUser (
            js-yaml "$SDIR/config.yml" \
            | jq -r '.development.username'
          );
          # debugPrint "dbUser: $dbUser";
        end
        if test -z "$dbUser"
          read -P "Database Username: " dbUser;
          echo;
        end
      end
    end
    # debugPrint "dbUser: $dbUser";

    # Only asks once as optional if no other connection information is provided first.
    if test -z "$dbPassword"
      if test -z "$dbConStr"
        if test -z "$dbPassword"
          # dbPassword="$(grep 'DBPASSWD=' "$SDIR/../../../.env" | sed 's|\\"|"|g' | cut -d'=' -f2 | head -c -2 | tail -c +2)";
          set dbPassword (
            js-yaml "$SDIR/config.yml" \
            | jq -r '.development.password'
          );
          # debugPrint "dbPassword: $dbPassword";
        end
        if test -z "$dbPassword"
          # echo "$dbConStr" | grep -vq " -p" && \
          # echo "$dbConStr" | grep -vq " --password"; then
          read -s -P "Database Password: " dbPassword;
          echo;
        end
      end
    # else
      #dbPassword="$(echo "$dbPassword" | sed -e 's|)|\\\)|g' -e 's|\x27|\\\\x27|g')";
    end
    # debugPrint "dbPassword: $dbPassword";

    # echo "$dbPassword"
    # echo "$dbPassword" | sed -r "s|([\`'\"\$])|\\\\\1|g";
    # dbPassword="$(echo "$dbPassword" | sed -r "s|([\`'\"\$\\])|\\\\\1|g")";
    set dbPassword (
      echo "$dbPassword" \
      | sed -r "s|([\"\$\\])|\\\\\1|g"
    );
    # debugPrint "dbPassword: $dbPassword";

    if test -z "$dbConStr"
      # set -a dbConStr             \
      #   $dbOthConnOpts            \
      #   --user="$dbUser"          \
      #   --password="$dbPassword"  \
      # ;
      set -a dbConStr --user=$dbUser --password=$dbPassword
      # debugPrint "dbConStr: $dbConStr";
      # debugPrint -n 'dbConStr: '; and count $dbConStr;

      if test -n "$dbHost"
        set -a dbConStr     \
          --host="$dbHost"  \
        ;
      end
      if test -n "$dbSocket"
        set -a dbConStr         \
          --protocol=socket     \
          --socket="$dbSocket"  \
        ;
      else if test -n "$dbPort"
        set dbConStr     \
          --port="$dbPort"  \
        ;
      end
    end
    # debugPrint "dbConStr: $dbConStr";
  end

  if test "$dbDump" = 'true'
    if test -z "$dbDumpCommonOptions" -a "$dbDumpExe" = 'mysqldump'
      set dbDumpCommonOptions "--column-statistics=0"; # This a fix for using the plain, or also the dump, mysql client exes to connect to a Maria Server right?
    end
    set -a dbDumpCommonOptions "$dbConStr";
    set -a dbDumpCommonOptions "$dbName";

    set command             \
      $dbDumpExe            \
      $dbDumpCommonOptions  \
    ;
  else
    if test -z "$dbClientCommonOptions"
      set -a dbClientCommonOptions $dbConStr          ;
      set -a dbClientCommonOptions --database=$dbName ;
    end

    set command               \
      $dbClientExe            \
      $dbClientCommonOptions  \
    ;
  end

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

if test "$dryRun" = 'false'
  $command $argv;
end
