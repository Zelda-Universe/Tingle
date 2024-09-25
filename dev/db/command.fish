#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
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
    if test (uname -o) = 'Cygwin'
      set cYmlPath (cygpath -m "$SDIR/config.yml");
    else
      set cYmlPath "$SDIR/config.yml";
    end

    if test -z "$dbConStr"
      # Prepare input values
      begin
        # Host
        begin
          if test -z "$dbHost"
            set dbHost '127.0.0.1';
            # `localhost` was causing errors with sockets on Linux,
            # even though I had see that directly recommended,
            # so just use the loopback IP instead,
            # with the explicit protocol switch too.
          end
        end

        # Username
        begin
          while test -z "$dbUser"
            if test -z "$dbUser"
              set dbUser (
                js-yaml "$cYmlPath" \
                | jq -r '.development.username'
              );
            end
            if test -z "$dbUser"
              read -P "Database Username: " dbUser;
              echo;
            end
          end
        end

        # Password
        begin
          # Only asks once since possibly being optional(?).
          if test -z "$dbPassword"
            set dbPassword (
              js-yaml "$cYmlPath" \
              | jq -r '.development.password'
            );
          end
          if test -z "$dbPassword"
            read -s -P "Database Password: " dbPassword;
            echo;
          end

          set dbPassword (
            echo "$dbPassword" \
            | sed -r "s|([\"\$\\])|\\\\\1|g"
          );
        end

        # Socket
        begin
          if test -z "$dbSocket"
            set dbSocket (
              js-yaml "$cYmlPath" \
              | jq -r '.development.socket // ""'
            );
          end
        end

        # Port
        begin
          # Prefer sockets for security and performance.
          if test -z "$dbSocket" -a -z "$dbPort"
            set dbPort (
              js-yaml "$cYmlPath" \
              | jq -r '.development.port // ""'
            );
          end
        end
      end

      # Build connection string, both statically for required values,
      # and dynamically for optional settings.
      begin
        set dbConStr              \
          --host="$dbHost"        \
          --password=$dbPassword  \
          --user=$dbUser          \
        ;

        # Prefer sockets for security and performance.
        if test -n "$dbSocket"
          set -a dbConStr         \
            --protocol='socket'   \
            --socket="$dbSocket"  \
          ;
        else if test -n "$dbPort"
          set -a dbConStr     \
            --protocol='tcp'  \
            --port="$dbPort"  \
          ;
        end
      end
    end
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
else
  echo $command $argv;
end
