#!/usr/bin/env bash

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

[[ -z "$DB_NAME" ]] && DB_NAME="zeldamaps";
[[ -z "$MYSQL_OTHER_CONNECTION_OPTIONS" ]] && MYSQL_OTHER_CONNECTION_OPTIONS="";
[[ -z "$MYSQL_CONNECTION_STRING" ]] && MYSQL_CONNECTION_STRING="$MYSQL_OTHER_CONNECTION_OPTIONS -u'$MYSQL_USER' -p'$MYSQL_PASS'";

GREEN='\033[0;32m';
RED='\033[0;31m';
NC='\033[0m'; # No Color

sqlQuerySelect='
  SELECT
    `seen_version_major`,
    `seen_version_minor`,
    `seen_version_patch`,
    `seen_latest_changelog`
  FROM
    `user`
  ORDER BY
    `last_login` ASC
  ;
';

result="$(
  echo "$sqlQuerySelect" | \
  mysql \
    $MYSQL_CONNECTION_STRING \
    --skip-column-names \
    $DB_NAME | \
    uniq -c | \
    awk '{ print $1 }' | \
    xargs \
  ;
)";

if [[ "$result" = "1 3 3 3 3 3 2" ]]; then
  echo -e "${GREEN}Records are correct.${NC}";
else
  echo -e "${Red}Records are incorrect.${NC}";
fi
