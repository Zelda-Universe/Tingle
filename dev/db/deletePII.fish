#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# Check for user entry, confirm deletion, manually read id,
# then erase specified field values, and print data completed.

# Input & Validation
begin
  test -z "$dbusername";
  and read -P 'dbusername: ' dbusername;
  or exit;
  test -z "$dbpw";
  and read -s -P 'dbpw: ' dbpw;
  or exit;
  test -z "$databaseName";
  and read -s -P 'databaseName: ' databaseName;
  or exit;
  test -z "$databaseName";
  and set databaseName 'zeldamaps';
  or exit;

  test -n "$connStr";
  and set connStr (echo $connStr | tr ' ' '\n');
  test -z "$usernameTarget";
  and read -P 'usernameTarget: ' usernameTarget;

  if test -z "$usernameTarget"
    exit;
  end
end

# Print found records.
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

  set timestamp "$(date '+%s')";

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
