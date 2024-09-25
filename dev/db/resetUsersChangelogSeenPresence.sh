#!/usr/bin/env bash

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

# Currently this script may require interaction for the MySQL user account.
[[ -z "$DRY_RUN" ]] && DRY_RUN="false";

[[ -z "$DB_NAME" ]] && DB_NAME='zeldamaps';
[[ -z "$MYSQL_OTHER_CONNECTION_OPTIONS" ]] && MYSQL_OTHER_CONNECTION_OPTIONS="";
[[ -z "$MYSQL_CONNECTION_STRING" ]] && MYSQL_CONNECTION_STRING="$MYSQL_OTHER_CONNECTION_OPTIONS -u'$MYSQL_USER' -p'$MYSQL_PASS' '$DB_NAME'";
# echo "MYSQL_CONNECTION_STRING: $MYSQL_CONNECTION_STRING";

# Source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
BROWN_ORANGE='\033[0;33m';
LIGHT_GREY='\033[0;37m';
DARK_GREY='\033[1;30m';
GREEN='\033[0;32m';
RED='\033[0;31m';
NC='\033[0m'; # No Color

while [[ "$confirmation" != "y" ]]; do
  read -p "Reset the \`seen_latest_changelog\` for all users to `false` for a new release version already deployed? (y/n): " confirmation;

  if [[ "$confirmation" == "n" ]]; then
    echo -e "User cancel received; exiting...";
    exit;
  fi
done

resetCommand="mysql $MYSQL_CONNECTION_STRING -e '
  UPDATE \`user\`
  SET \`seen_latest_changelog\` = 0
  WHERE \`seen_latest_changelog\` = 1
  ;
'";

if [[ "$DRY_RUN" == "true" ]]; then
  echo -e "\nReset Command: ${DARK_GREY}$resetCommand${NC}";
else
  echo -e "\nOpening MySQL connection to update the password...";
  if eval "$resetCommand"; then
    echo -e "All user records successfully reset.";
  else
    echo -e "At least some user records unsuccessfully reset.";
  fi
fi
