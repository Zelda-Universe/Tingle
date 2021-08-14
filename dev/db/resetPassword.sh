#!/usr/bin/env bash

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

[[ -z "$email" ]] && email="$1";

while
  while
    while [[ -z "$email" ]]; do read -p "Email: " email; done;

    echo -e "\nOpening MySQL connection to query for the user account...";
    userRecord="$(bash -c "mysql $MYSQL_CONNECTION_STRING --vertical -e \"SELECT * FROM \\\`user\\\` WHERE \\\`email\\\` = '$email'\"";)";

    if [[ "$?" -gt "0" ]]; then
      echo -e "${RED}Database error has occurred; exiting...${NC}";
      exit 1;
    fi

    [[ -z "$userRecord" ]]; do
      email=;
      echo -e "${BROWN_ORANGE}No user records found; prompting again...${NC}";
  done

  echo -e "\nFound this user record:\n\n${DARK_GREY}$userRecord${NC}\n";
  read -p "Is there only 1 record, and is it the one you expected? (y/n): " confirmation;

  [[ "$confirmation" != "y" ]]; do
    email=;
    echo -e "\n${BROWN_ORANGE}User record not confirmed; prompting again...${NC}\n";
    confirmation=;
done

# Various random character
# head -c 100 /dev/urandom | shasum -b -a 256 | head --bytes=-3
# head -c 100 /dev/urandom | tr -dc [:graph:] | head -c 40 # gibberish chars
# Source: https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/
# date +%s | sha256sum | base64 | head -c 32 ; echo # Doesn't use randomness, bad
# < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo; # no punc, keyspace not strong enough
# openssl rand -base64 32 # no punc, keyspace not strong enough
# tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1 # gibberish chars
# strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo # Doesn't work? Only prints blank line
# < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6 # not enough punc, keyspace not strong enough
# dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev # not enough punc, keyspace not strong enough
# </dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo "" # one handed, don't use as is with very low keyspace, only use once customizing the method to include more
# date | md5sum | head --bytes=-4 # no punc, keyspace not strong enough
# cat /dev/urandom|tr -dc "a-zA-Z0-9-_\$\?"|fold -w 9|head # not enough punc, keyspace not strong enough
# head -c 100 /dev/urandom | tr -dc '[0-9A-Za-z][:punct:]' | head -c 40 # less gibberish chars, but still some..

# cat /dev/urandom | uuencode - | tail --lines=+2 | head --bytes=100 # Gives a decent result, just not as expected from random encoding.

# "$SDIR/generateRandomCharacters.sh" # I did the math and conversions myself. # What.

passwordGenerationMethod="'$SDIR/generateRandomCharacters.sh'";
newPassword="$(eval "$passwordGenerationMethod")";
# echo "newPassword: $newPassword"; # debug
newPasswordHash="$(php -r 'echo password_hash("$argv[1]", PASSWORD_DEFAULT, ["cost" => 13]);' "$newPassword")";
# echo "newPasswordHash: $newPasswordHash"; # debug

resetCommand="mysql $MYSQL_CONNECTION_STRING -e 'UPDATE \`user\` SET \`password\` = \"$newPasswordHash\" WHERE \`email\` = \"$email\"'";

if [[ "$DRY_RUN" == "true" ]]; then
  echo -e "\nReset Password Command: ${DARK_GREY}$resetCommand${NC}";
  echo -e "Sample Generated Password: ${GREEN}$newPassword${NC}";
else
  echo -e "\nOpening MySQL connection to update the password...";
  if eval "$resetCommand"; then
    echo -e "Password updated to: ${GREEN}$newPassword${NC}";
    echo -e "Copy that and send in an email to the user.";
  else
    echo -e "${RED}Problem encountered trying to replace password; password most likely not changed; exiting...${NC}";
  fi
fi
