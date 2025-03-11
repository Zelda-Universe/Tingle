#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# Check for user entry, confirm deletion, manually read id,
# then erase specified field values, and print data completed.

# Incompatibilites (Example: fish shell 2.2.0 < 3.7.0):
# read -P

# Input & Validation
begin
  if test -z "$dbusername"
    if not read -P 'dbusername: ' dbusername
      return;
    end
  end
  if test -z "$dbpw"
    if not read -s -P 'dbpw: ' dbpw
      return;
    end
  end
  if test -z "$databaseName"
    if not read -s -P 'databaseName: ' databaseName;
      return;
    end
  end
  if test -z "$databaseName"
    if not set databaseName 'zeldamaps';
      return;
    end
  end

  test -n "$connStr";
  and set connStr (echo $connStr | tr ' ' '\n');
  test -z "$usernameTarget";
  and read -P 'usernameTarget: ' usernameTarget;

  if test -z "$usernameTarget"
    exit;
  end
end

# Print found records.
begin
  set records (
    if not mysql -B                 \
        -u"$dbusername"             \
        -p"$dbpw"                   \
        --database="$databaseName"  \
        $connStr                    \
        -e "
          SELECT *
          FROM `user`
          WHERE `username` = '$usernameTarget'
        ;"  \
      ;

      exit 1;
    end
  );
  string join \n $records;
  # debugPrint 'records (20c): '(echo "$records" | head -c 20);
  # debugPrint 'records (amt): '(count $records);
  if test -z "$records"
    echo 'No records found; exiting...';
    exit;
  end
end

# Confirm deletion
begin
  echo;

  read -P 'Really delete this account?: ' -n 1 choice;

  echo;

  if test "$choice" != 'y'
    exit;
  end
end

# Delete
begin
  test -z "$id";
  and read -P 'Id: ' id;

  set timestamp (date '+%s');

  if not mysql -B               \
    -u"$dbusername"             \
    -p"$dbpw"                   \
    --database="$databaseName"  \
    $connStr                    \
    -e "
      UPDATE `user`
      SET
        `username`  = '<deleted-$timestamp>',
        `password`  = '<deleted>'           ,
        `name`      = '<deleted>'           ,
        `email`     = '<deleted-$timestamp>',
        `ip`        = '<deleted>'
      WHERE `id`    = '$id'
    ;"
    exit 2;
  end
end

# Print confirming record not found now.
begin
  mysql -B                      \
    -u"$dbusername"             \
    -p"$dbpw"                   \
    --database="$databaseName"  \
    $connStr                    \
    -e "
      SELECT *
      FROM `user`
      WHERE `username` = '$usernameTarget'
    ;"    \
  ;
  # | cat \
end

echo -n 'Completed at ';
date '+%Y-%m-%d %H:%M:%S';
