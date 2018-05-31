#!/usr/bin/env bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

testUserSQLTemplateHeader='INSERT INTO
  `user` (
  username,
  password,
  name,
  email,
  created,
  ip,
  last_login,
  level,
  visible
) VALUES';

testUserSQLTemplateValueRow='
  $index + 1 | tostring as $index | "
  (
    \"test" + $index + "\",
    \"\",
    \"test" + $index + "\",
    \"test" + $index + "@test.com\",
    \"" + $date + "\",
    \"127.0.0.1\",
    \"" + $date + "\",
    1,
    1
  )
"';



echo "$testUserSQLTemplateHeader";

jq -cjr '
  [
    .[].timestamp |
    (. - 1, ., . + 1) |
    strftime("%Y-%m-%d %H:%M:%S")
  ] | to_entries |
  map(
    . as { key: $index, value: $date } |
    '"$testUserSQLTemplateValueRow"'
  ) | join(", ")
' "$SDIR/../../versionsInfo.json";

echo ';';
