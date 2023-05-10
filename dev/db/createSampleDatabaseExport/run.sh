#!/usr/bin/env bash

## Function Library
{
  statusPrint() {
    [[ "$QUIET" != "true" ]] && echo -en $*;
  }

  pauseWhenEnabled() {
    [[ "$PAUSE" == "true" ]] && read -s -n 1;
  }

  issueStep() {
    if [[ "$#" -eq "1" ]]; then
      commandString="$1";
    elif [[ "$#" -eq "2" ]]; then
      description="$1";
      commandString="$2";
    fi

    if [[ "$VERBOSE" == "true" ]]; then
      statusPrint "\n${BROWN_ORANGE}Command${NC}: ${DARK_GREY}$commandString${NC}";
    fi

    issueCommand "$commandString";

    if [[ -n "$description" ]]; then
      statusPrint "${BLUE} >${NC} $(echo -n "$description" | $messageRedirectionString)";
      [[ "$BRIEF_MESSAGES" == "true" && "${#description}" -gt "$availableMessageCharacters" ]] && statusPrint "...";
    fi

    pauseWhenEnabled;
  }

  issueCommand() {
    commandString="$1";

    if [[ "$DRY_RUN" == "false" ]]; then
      if eval "$commandString"; then
        statusPrint "\n[${GREEN}Success${NC}] ";
      else
        lastCommandStatus="$?";

        statusPrint "\n[${RED}Failed ${NC}] ";

        if [[ "$CLEAN_ON_FAILURE" == "true" ]]; then
          clean;
        fi

        if [[ "$FAIL_FAST" == "true" ]]; then
          exit "$lastCommandStatus";
        fi
      fi
    else
      statusPrint "\n[${DARK_GREY}Not Run${NC}] ";
    fi
  }

  clean() {
    issueStep \
      "Cleaning the no longer needed intermediate SQL files." \
      "rm -f $allIntermediateFilePaths" \
    ;
  }

  cleanAndExit() {
    exitStatusToApply="${1:-2}";
    statusPrint "\n";
    clean;
    statusPrint "Exiting...";
    exit "$exitStatusToApply";
  }
}

## Initialization
{
  # Source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
  BROWN_ORANGE='\033[0;33m';
  LIGHT_GREY='\033[0;37m';
  DARK_GREY='\033[1;30m';
  BLUE='\033[0;34m';
  GREEN='\033[0;32m';
  RED='\033[0;31m';
  NC='\033[0m'; # No Color

  SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
}

## Main Environment Configuration
{
  [[ -z "$QUIET" ]] && QUIET="false";
  [[ -z "$VERBOSE" ]] && VERBOSE="false";
  [[ -z "$BRIEF_MESSAGES" ]] && BRIEF_MESSAGES="false";
  [[ -z "$PAUSE" ]] && PAUSE="false";
  [[ -z "$DRY_RUN" ]] && DRY_RUN="false";
  [[ -z "$FAIL_FAST" ]] && FAIL_FAST="true";
  [[ -z "$CLEAN_ON_FAILURE" ]] && CLEAN_ON_FAILURE="true";

  [[ -z "$DB_NAME" ]] && DB_NAME="zeldamaps";
  [[ -z "$MYSQL_OTHER_CONNECTION_OPTIONS" ]] && MYSQL_OTHER_CONNECTION_OPTIONS="";
  [[ -z "$MYSQL_CONNECTION_STRING" ]] && MYSQL_CONNECTION_STRING="$MYSQL_OTHER_CONNECTION_OPTIONS -u'$MYSQL_USER' -p'$MYSQL_PASS'";
}

## Derived Configuration & Internal Variables
{
  # `marker_tab` looked like user data that could be skipped, but apparently not, as no markers appeared using the current query 'monster' :X
  noAITables="user user_completed_marker";
  ignoreTablesOptions='';
  for table in $noAITables; do ignoreTablesOptions+="--ignore-table='$DB_NAME.$table' "; done;
  structureOptions="--no-data";
  dataOptions="--no-create-info --skip-add-drop-table --skip-extended-insert";
  if [[ "$VERBOSE" == "true" ]]; then
    errorRedirectionString="";
    mysqlVerboseString="-v";
  else
    errorRedirectionString="2>/dev/null";
    mysqlVerboseString="";
  fi
  if [[ "$BRIEF_MESSAGES" == "true" ]]; then
    availableMessageCharacters="$(expr "$(tput cols)" - 12 - 3)"; # For the result messages, their wrapping characters, the message prefix, and then the ellipsis.
    messageRedirectionString="head --bytes=$availableMessageCharacters";
  else
    messageRedirectionString="cat";
  fi
  # Additional SQL query function files to use but not modify.
  generateDevUsersQueryFilePath="$SDIR/exportDatabaseForDev-generateDevUsers.sql";
  sqlizeSedFilePath="$SDIR/exportDatabaseForDev-sqlize.sed";

  # Intermediate, temporary, working files to be deleted at the end of the process.
  keepAIFilePath="$SDIR/zeldamaps-structure_with-AI.sql";
  toRemoveAIFilePath="$SDIR/zeldamaps-structure_to-remove-AI.sql";
  aiRemovedFilePath="$SDIR/zeldamaps-structure_AI-removed.sql";
  dataFilePath="$SDIR/zeldamaps-data.sql";
  sanitizedPartialUserDataFilePath="$SDIR/zeldamaps-sanitizedPartialUserData.txt";
  generatedDevUserDataFilePath="$SDIR/zeldamaps-devUserData.sql";

  allIntermediateFilePaths="'$keepAIFilePath' '$toRemoveAIFilePath' '$aiRemovedFilePath' '$dataFilePath' '$sanitizedPartialUserDataFilePath' '$generatedDevUserDataFilePath'";

  # Resultant, generated file to keep at the end of the process.
  # completeFilePath="$SDIR/zeldamaps-complete.sql";
  completeFilePath="$SDIR/zeldamaps.sql"; # Since the it is already version-tracked, we can just overwrite the main file now.
}

## Main Program Flow
{
  trap 'statusPrint "\n${RED}User cancels process.${NC}"; cleanAndExit 2;' INT KILL TERM STOP;

  issueStep \
    "Exporting majority of the database structure, keeping the auto increment values to match the data later on." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlVerboseString $structureOptions $ignoreTablesOptions --add-drop-database --databases $DB_NAME > '$keepAIFilePath' $errorRedirectionString" \
  ;

  issueStep \
    "Exporting the rest of the database structure, with no way to immediately remove the auto increment values to match not having data later on." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlVerboseString $structureOptions $DB_NAME $noAITables > '$toRemoveAIFilePath' $errorRedirectionString" \
  ;

  issueStep \
    "Exporting majority of the database data, ignoring certain tables with more sensitive user or otherwise less useful data for development." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlVerboseString $dataOptions $ignoreTablesOptions $DB_NAME > '$dataFilePath' $errorRedirectionString" \
  ;


  issueStep \
    "Exporting and sanitizing only the required user records by id, with their visiblity and level data for later use in development so that all markers can be displayed." \
    "mysql $MYSQL_CONNECTION_STRING $mysqlVerboseString $DB_NAME > '$sanitizedPartialUserDataFilePath' $errorRedirectionString < '$generateDevUsersQueryFilePath'" \
  ;

  if [[ "$VERBOSE" == "true" ]]; then
    issueStep \
      "Removing embedded verbose query." \
      "sed -i '1,27d' '$sanitizedPartialUserDataFilePath'" \
    ;
  fi

  issueStep \
    "Preparing the generated user data into a SQL format." \
    "sed -i -r -f '$sqlizeSedFilePath' '$sanitizedPartialUserDataFilePath'" \
  ;

  issueStep \
    "Writing SQL INSERT header." \
    "echo 'INSERT INTO \`user\`' > '$generatedDevUserDataFilePath'" \
  ;

  issueStep \
    "Writing header data fields." \
    "head -n 1 '$sanitizedPartialUserDataFilePath' >> '$generatedDevUserDataFilePath'" \
  ;
  issueStep \
    "Writing intermediate VALUES term." \
    "echo 'VALUES' >> '$generatedDevUserDataFilePath'" \
  ;
  issueStep \
    "Writing data fields." \
    "tail -n +2 '$sanitizedPartialUserDataFilePath' >> '$generatedDevUserDataFilePath'" \
  ;
  #   "tail -n +2 dev/db/userLevels.txt | sed -r 's|([[:digit:]]+)\s+([[:digit:]]+)\s+([[:digit:]]+)|\(\1, \'test\1\', \'test\1\', \2, \3\)|g'";
  issueStep \
    "Writing terminating colon." \
    "echo ';' >> '$generatedDevUserDataFilePath'" \
  ;


  issueStep \
    "Removing auto increment values in sensitive data table schemas." \
    "sed -r 's| AUTO_INCREMENT=[[:digit:]]+||g' '$toRemoveAIFilePath' > '$aiRemovedFilePath'" \
  ;

  issueStep \
    "Combining intermediate SQL files into a single convenient script for later import and version control." \
    "cat '$keepAIFilePath' '$aiRemovedFilePath' '$dataFilePath' '$generatedDevUserDataFilePath' > '$completeFilePath'" \
  ; # "cat '$keepAIFilePath' '$aiRemovedFilePath' '$dataFilePath' > '$completeFilePath'" \
  clean;
}
