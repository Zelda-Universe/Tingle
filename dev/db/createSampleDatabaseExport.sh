#!/usr/bin/env bash

# Users the `mysqldump` command with provided SQL statements and shell commands
# to create a customized backup and sample database data file to use to operate
# the project.

## Function Library
{
  statusPrint() {
    [[ "$QUIET" != "true" ]] && echo -en $* 1>&2;
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
      statusPrint "\n${BROWN_ORANGE}Command${NC}: ${DARK_GREY}$commandString${NC}\n";
    fi

    issueCommand "$commandString";

    if [[ -n "$description" ]]; then
      statusPrint "${BLUE} >${NC} $(echo -n "$description" | $messageRedirectionString)\n";
      [[ "$BRIEF_MESSAGES" == "true" && "${#description}" -gt "$availableMessageCharacters" ]] && statusPrint "...";
    fi

    pauseWhenEnabled;
  }

  issueCommand() {
    commandString="$1";

    if [[ "$DRY_RUN" == "false" ]]; then
      if eval "$commandString"; then
        statusPrint "[${GREEN}Success${NC}] ";
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
      statusPrint "[${DARK_GREY}Not Run${NC}] ";
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
  SAMPLES_DIR="$SDIR/samples";
}

## Main Environment Configuration
{
  [[ -z "$QUIET" ]] &&                       QUIET="false";
  [[ -z "$VERBOSE" ]] &&                   VERBOSE="false";
  [[ -z "$BRIEF_MESSAGES" ]]     && BRIEF_MESSAGES="false";
  [[ -z "$PAUSE" ]] &&                       PAUSE="false";
  [[ -z "$DRY_RUN" ]] &&                   DRY_RUN="false";
  [[ -z "$FAIL_FAST" ]] &&               FAIL_FAST="true";
  [[ -z "$CLEAN_ON_FAILURE" ]] && CLEAN_ON_FAILURE="true";
  [[ -z "$CONVERGE_SQL" ]] &&         CONVERGE_SQL="false";
  
  [[ -z "$DB_NAME" ]] &&                   DB_NAME="zeldamaps";

  # Loops as requirement.
  while [[ -z "$MYSQL_USER" ]]; do
    read -p "Database Username: " MYSQL_USER;
  done
  # Only asks once as optional if no other connection information is provided first.
  if [[ -z "$MYSQL_PASS" ]]; then
    if [[ -z "$MYSQL_CONNECTION_STRING" ]]; then
      # echo "$MYSQL_CONNECTION_STRING" | grep -vq " -p" && \
      # echo "$MYSQL_CONNECTION_STRING" | grep -vq " --password"; then
      read -s -p "Database Password: " MYSQL_PASS;
      echo;
    fi
  # else
    #MYSQL_PASS="$(echo "$MYSQL_PASS" | sed -e 's|)|\\\)|g' -e 's|\x27|\\\\x27|g')";
  fi
    
  [[ -z "$MYSQL_OTHER_CONNECTION_OPTIONS" ]] && MYSQL_OTHER_CONNECTION_OPTIONS="";
  [[ -z "$MYSQL_CONNECTION_STRING" ]] && MYSQL_CONNECTION_STRING="$MYSQL_OTHER_CONNECTION_OPTIONS -u'$MYSQL_USER' -p'$MYSQL_PASS'";
}

## Derived Configuration & Internal Variables
{
  mysqlDumpOtherOptions="--column-statistics=0";
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
  generateDevUsersQueryFilePath="$SDIR/createSampleDatabaseExport-generateDevUsers.sql";
  sqlizeSedFilePath="$SDIR/createSampleDatabaseExport-sqlize.sed";
  convergeSedFilePath="$SDIR/createSampleDatabaseExport-converge.sed"

  # Intermediate, temporary, working files to be deleted at the end of the process.
  keepAIFilePath="$SAMPLES_DIR/01-structure_with-AI.sql";
  toRemoveAIFilePath="$SAMPLES_DIR/02-structure_to-remove-AI.sql";
  aiRemovedFilePath="$SAMPLES_DIR/03-structure_AI-removed.sql";
  dataFilePath="$SAMPLES_DIR/04-data.sql";
  sanitizedPartialUserDataFilePath="$SAMPLES_DIR/05-sanitizedPartialUserData.txt";
  generatedDevUserDataFilePath="$SAMPLES_DIR/06-devUserData.sql";

  allIntermediateFilePaths="'$keepAIFilePath' '$toRemoveAIFilePath' '$aiRemovedFilePath' '$dataFilePath' '$sanitizedPartialUserDataFilePath' '$generatedDevUserDataFilePath'";
  
  [[ "$CONVERGE_SQL" == "true" ]] && convergeSuffix="-converged";

  # Resultant, generated file to keep at the end of the process.
  # completeFilePath="$SDIR/zeldamaps-complete.sql";
  completeFilePath="$SAMPLES_DIR/tingle.sql"; # Since the it is already version-tracked, we can just overwrite the main file now.
  completeConvergedFilePath="$SAMPLES_DIR/tingle$convergeSuffix.sql";
}

## Main Program Flow
{
  trap 'statusPrint "\n${RED}User cancels process.${NC}"; cleanAndExit 2;' INT KILL TERM STOP;

  issueStep \
    "Exporting majority of the database structure, keeping the auto increment values to match the data later on." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlDumpOtherOptions $mysqlVerboseString $structureOptions $ignoreTablesOptions --add-drop-database --databases $DB_NAME > '$keepAIFilePath' $errorRedirectionString" \
  ;

  issueStep \
    "Exporting the rest of the database structure, with no way to immediately remove the auto increment values to match not having data later on." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlDumpOtherOptions $mysqlVerboseString $structureOptions $DB_NAME $noAITables > '$toRemoveAIFilePath' $errorRedirectionString" \
  ;

  issueStep \
    "Exporting majority of the database data, ignoring certain tables with more sensitive user or otherwise less useful data for development." \
    "mysqldump $MYSQL_CONNECTION_STRING $mysqlDumpOtherOptions $mysqlVerboseString $dataOptions $ignoreTablesOptions $DB_NAME > '$dataFilePath' $errorRedirectionString" \
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
  
  issueStep \
    "Converting result to Unix-style LF-only line endings." \
    "dos2unix '$completeFilePath'" \
  ;
  
  clean;
  
  if [[ "$CONVERGE_SQL" == "true" ]]; then
    issueStep \
      "Converging database SQL formats by eliminating less important details." \
      "sed -r -f '$convergeSedFilePath' '$completeFilePath' > '$completeConvergedFilePath'" \
    ;
    
    echo;
    echo "Important Note: The 'CONVERGE_SQL' option is enabled.  Do NOT store these exported SQL files permanently in source control OR import them into any database.  They are for comparing important differences more easily and quickly by removing any less important differences that may be defaults or other details.  The data differences are ONLY to be manually and carefully reviewed and ported through migrations using the more exact, unique, and explicit details to converge the databases more properly.";
  fi
}
