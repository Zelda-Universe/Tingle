#!/usr/bin/env bash

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# Uses the database client and dump executables with provided SQL
# statements and shell commands to create a customized backup and sample
# database data file to use to operate the project.

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

## Function Library
{
  source "$SDIR/../../scripts/common/altPrint.bash";
  source "$SDIR/../../scripts/common/debugPrint.bash";
  source "$SDIR/../../scripts/common/errorPrint.bash";

  includes() {
    pattern="$1";
    text="$2";

    echo "$pattern" \
    | grep -q "\b$text\b";
  }

  pTWSC() {
    printTextWithSentimentColoring "$@";
  }

  printTextWithSentimentColoring() {
    text="$1";
    text="$(echo "$text" | tr '[A-Z]' '[a-z]')";
    if [[ \
          "$text" == 'true' \
      ||  "$text" == 'success' \
    ]]; then
      echo -n "${GREEN}";
    elif [[ \
          "$text" == 'false' \
      ||  "$text" == 'failure' \
    ]]; then
      echo -n "${RED}";
    fi
    echo "$text${NC}";
  }

  statusPrint() {
    [[ "$quiet" != "true" ]] && echo -en $* 1>&2;
  }

  pauseWhenEnabled() {
    [[ "$pause" == "true" ]] && read -s -n 1;
  }

  issueStep() {
    # debugPrint 'issueStep Start';
    if [[ "$#" -eq "1" ]]; then
      commandString="$1";
    elif [[ "$#" -eq "2" ]]; then
      description="$1";
      commandString="$2";
    fi
    # debugPrint "issueStep commandString: $commandString";

    if [[ "$verbose" == "true" ]]; then
      # statusPrint "\n${BROWN_ORANGE}Command${NC}: ${DARK_GREY}$(
      #   echo "$commandString" \
      #   | sed -r "s|(-p(assword=)?)['\"]?[^ \t\n]+['\"]? |\1...|g"
      # )${NC}\n";
      # debugPrint "issueStep commandString: $commandString";
      statusPrint "${BROWN_ORANGE}Command${NC}: ${DARK_GREY}$(
        echo "$commandString"
      )${NC}\n";
    fi

    issueCommand "$commandString";
    commandStatus="$?";
    # debugPrint "commandStatus: $commandStatus";

    if [[ -n "$description" ]]; then
      statusPrint "${BLUE} >${NC} $(echo -n "$description" | $messageRedirectionString)";
      [[ "$briefMessages" == "true" && "${#description}" -gt "$availableMessageCharacters" ]] && statusPrint "...";
      statusPrint '\n';
    fi

    pauseWhenEnabled;

    if [[ "$commandStatus" -gt '0' ]]; then
      # debugPrint 'issueStep cleanAndExit';
      cleanAndExit;
    fi
    # debugPrint 'issueStep End';
  }

  issueCommand() {
    # debugPrint 'issueCommand Start';
    commandString="$1";
    # debugPrint "commandString: $commandString";
    # commandString="$(echo "$commandString" | sed 's|"|\\"|g')";
    # debugPrint "commandString: $commandString";

    if [[ "$dryRun" == "false" ]]; then
      eval "$commandString";
      commandStatus="$?";
      # debugPrint "commandStatus: $commandStatus";
      if [[ "$commandStatus" -eq '0' ]]; then
        # debugPrint 'issueCommand Success';
        statusPrint "[${GREEN}Success${NC}] ";
      else
        # debugPrint 'issueCommand Failed';

        statusPrint "[${RED}Failure${NC}] ";

        if [[ "$cleanOnFailure" == "true" ]]; then
          issueStepClean;
        fi

        if [[ "$failFast" == "true" ]]; then
          # debugPrint "issueCommand return commandStatus: $commandStatus";
          return "$commandStatus";
        fi
      fi
    else
      statusPrint "[${DARK_GREY}Not Run${NC}] ";
    fi
    # debugPrint 'issueCommand End';
  }

  cleanAndExit() {
    exitStatusToApply="${1:-2}";
    # statusPrint "\n";
    issueStepClean;
    statusPrint "Exiting...";
    exit "$exitStatusToApply";
  }

  issueStepClean() {
    # [[ -n "$allIntermediateDirPaths" ]] && \
    # issueStep \
    #   "Cleaning the no longer needed intermediate directories for SQL files." \
    #   "rmdir $allIntermediateDirPaths" \
    # ;
    [[ -n "$allIntermediateFilePaths" ]] && \
    issueStep \
      "Cleaning the no longer needed intermediate SQL files." \
      "rm -f $allIntermediateFilePaths" \
    ;
  }

  # dos2unix
  issueStepD2UConditional() {
    file="$1";

    detectedOS="$(uname)";
    if [[ \
          "$detectedOS" == 'Windows' \
      ||  "$detectedOS" == 'Cygwin' \
    ]]; then
      issueStep \
        "Converting result to Unix-style LF-only line endings." \
        "dos2unix '$file' 2> /dev/null" \
      ;
    fi
  }

  issueStepsRemoveAIValue() {
    # Other variables are common/global between any route.
    # Also even if the variable naming is consistent, the values won't be.
    # Might not matter in the code, but wanted to make this explicitly obvious at least, when understanding the statements for any future coding.
    toRemoveAIFilePath="$1";
    aiRemovedFilePath="$2";
    tableNames="$3";
    if [[ -z "$tableNames" ]]; then
      tableNames="$removeAITables";
      descPrefixToRemoveAI='Exporting the rest of the database structure';
      descPrefixAIRemove='Removing auto increment values in sensitive data tables';
    else
      descPrefixToRemoveAI="Exporting structure for table \"$tableName\"";
      descPrefixAIRemove='Removing auto increment value in this sensitive data table';
    fi

    issueStep \
      "$descPrefixToRemoveAI, with no way to immediately remove the auto increment values to match not having the same data later on." \
      "'$dbDumpExe'             \
        $dbDumpCommonOptions    \
        $structureOnlyOptions   \
        $tableNames             \
        > '$toRemoveAIFilePath' \
        $errorRedirectionString \
      " \
    ;

    issueStep \
      "$descPrefixAIRemove, since it will be auto-generated later when data is inserted." \
      "sed -r \
        's| AUTO_INCREMENT=[[:digit:]]+||g' \
        '$toRemoveAIFilePath'   \
        > '$aiRemovedFilePath'  \
      " \
    ;
  }

  issueStepsUserSanAndGen() {
    # debugPrint 'issueStepsUserSanAndGen Start';
    # Other variables are common/global between any route.
    # Also even if the variable naming is consistent, the values won't be.
    # Might not matter in the code, but wanted to make this explicitly obvious at least, when understanding the statements for any future coding.
    sanitizedPartialUserDataFilePath="$1";
    generatedDevUserDataFilePath="$2";

    issueStep \
      "Exporting and sanitizing only the required user records by id, with their visiblity and level data for later use in development so that all markers can be displayed." \
      "'$dbClientExe'                         \
        $dbClientCommonOptions                \
        < '$generateDevUsersQueryFilePath'    \
        | $orgExtInsCmd                       \
        > '$sanitizedPartialUserDataFilePath' \
        $errorRedirectionString               \
      " \
    ;

    # Only for MySQL.  All versions, or just old ones?
    if \
      echo "$dbClientExe" | grep -Pq '^mysql' \
      && [[ "$verbose" == "true" ]] \
    ; then
      issueStep \
        "Removing embedded verbose query." \
        "sed -i '1,27d' \
          '$sanitizedPartialUserDataFilePath' \
        ;" \
      ;
    fi

    issueStep \
      "Preparing the generated user data into a SQL format." \
      "sed -i -r -f \
        '$sqlizeSedFilePath'                \
        '$sanitizedPartialUserDataFilePath' \
      " \
    ;

    issueStep \
      "Writing SQL INSERT header." \
      "echo 'INSERT INTO \`user\`' > '$generatedDevUserDataFilePath'" \
    ;

    issueStep \
      "Writing header data fields." \
      "head -n 1                            \
        '$sanitizedPartialUserDataFilePath' \
        >> '$generatedDevUserDataFilePath'  \
      " \
    ;
    issueStep \
      "Writing intermediate VALUES term." \
      "echo 'VALUES' >> '$generatedDevUserDataFilePath'" \
    ;
    issueStep \
      "Writing data fields." \
      "tail -n +2                           \
        '$sanitizedPartialUserDataFilePath' \
        >> '$generatedDevUserDataFilePath'  \
      " \
    ;

    #   "tail -n +2 dev/db/userLevels.txt | sed -r 's|([[:digit:]]+)\s+([[:digit:]]+)\s+([[:digit:]]+)|\(\1, \'test\1\', \'test\1\', \2, \3\)|g'";
    issueStep \
      "Writing terminating colon." \
      "echo ';' >> '$generatedDevUserDataFilePath'" \
    ;

    # debugPrint 'issueStepsUserSanAndGen End';
  }

  issueStepConvergePrepareConditional() {
    filePath="$1";

    if [[                             \
        "$converge" == "true"         \
    &&  "$convergeInPlace" == "true"  \
    ]]; then
      issueStep \
        "Preparing existing data for later converging replacement." \
        "bakStr=\"\$(grep -P '^-- Dump completed on (.+)?\$' '$filePath')\"" \
      ;
    fi
  }

  issueStepConvergeConditional() {
    filePath="$1";
    convergedFilePath="$2";

    if [[ "$converge" == "true" ]]; then
      if [[ "$convergeInPlace" == "true" ]]; then
        issueStep \
          "Converging database SQL formats by replacing less important details with those from the previous file." \
          "sed -r -i 's|^-- Dump completed on (.+)?\$|$bakStr|' '$filePath';
          " \
        ;
      else
        issueStep \
          "Converging database SQL formats by eliminating less important details." \
          "sed -r -f                \
            '$convergeSedFilePath'  \
            '$filePath'             \
            > "$convergedFilePath";
          " \
        ;
      fi
    fi
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
}

## Main Environment Configuration
{
  [[ -z "$briefMessages"    ]] &&       briefMessages="false"       ;
  [[ -z "$cleanOnFailure"   ]] &&      cleanOnFailure="true"        ;
  [[ -z "$converge"         ]] &&            converge="false"       ;
  [[ -z "$convergeInPlace"  ]] &&     convergeInPlace="false"       ;
  [[ -z "$dbName"           ]] &&              dbName="tingle"      ;
  [[ -z "$dbClientExe"      ]] &&         dbClientExe="mariadb"     ;
  [[ -z "$dbDumpExe"        ]] &&           dbDumpExe="mariadb-dump";
  [[ -z "$dryRun"           ]] &&              dryRun="false"       ;
  [[ -z "$failFast"         ]] &&            failFast="true"        ;
  [[ -z "$oneFile"          ]] &&             oneFile="false"       ;
  [[ -z "$outputName"       ]] &&          outputName="tingle"      ;
  [[ -z "$pause"            ]] &&               pause="false"       ;
  [[ -z "$quiet"            ]] &&               quiet="false"       ;
  [[ -z "$tableNames"       ]] &&          tableNames=""            ;
  [[ -z "$verbose"          ]] &&             verbose="false"       ;

  # debugPrint "databaseUser: $databaseUser";
  # debugPrint "databasePassword: $([[ -n "$databasePassword" ]] && echo 'Set' || echo 'Not Set').";
  # debugPrint "quiet: $quiet";
  # debugPrint "verbose: $verbose";
  # debugPrint "briefMessages: $briefMessages";
  # debugPrint "pause: $pause";
  # debugPrint "dryRun: $dryRun";
  # debugPrint "failFast: $failFast";
  # debugPrint "cleanOnFailure: $cleanOnFailure";
  # debugPrint "converge: $converge";
  # debugPrint "convergeInPlace: $convergeInPlace";
  # debugPrint "oneFile: $oneFile";
  # debugPrint "dbName: $dbName";
  # debugPrint "outputName: $outputName";
  # debugPrint "dbDumpExe: $dbDumpExe";
  # debugPrint "dbClientExe: $dbClientExe";
}

## Derived Configuration & Internal Variables
{
  samplesDir="$SDIR/../samples";

  ## Database connection Details
  {
    # Loops as required.
    while [[ -z "$databaseUser" ]]; do
      read -p "Database Username: " databaseUser;
    done

    # Only asks once as optional if no other connection information is provided first.
    if [[ -z "$databasePassword" ]]; then
      if [[ -z "$DATABASE_CONNECTION_STRING" ]]; then
        # echo "$DATABASE_CONNECTION_STRING" | grep -vq " -p" && \
        # echo "$DATABASE_CONNECTION_STRING" | grep -vq " --password"; then
        read -s -p "Database Password: " databasePassword;
        echo;
      fi
    # else
      #databasePassword="$(echo "$databasePassword" | sed -e 's|)|\\\)|g' -e 's|\x27|\\\\x27|g')";
    fi

    # debugPrint "databasePassword: $databasePassword";
    # echo "$databasePassword"
    # echo "$databasePassword" | sed -r "s|([\`'\"\$])|\\\\\1|g";
    # databasePassword="$(echo "$databasePassword" | sed -r "s|([\`'\"\$\\])|\\\\\1|g")";
    # exit

    # [[ -z "$otherConnectionOptions" ]] && otherConnectionOptions="";
    [[ -z "$databaseConnectionString" ]] && databaseConnectionString="$otherConnectionOptions -u'$databaseUser' -p"$databasePassword"";
  }

  [[ -z "$dbDumpCommonOptions" && "$dbDumpExe" = 'mysqldump' ]] && dbDumpCommonOptions="--column-statistics=0"; # This a fix for using the plain, or also the dump, mysql client exes to connect to a Maria Server right?
  dbDumpCommonOptions="$dbDumpCommonOptions $databaseConnectionString";
  dbDumpCommonOptions="$dbDumpCommonOptions $dbName";

  if [[ -z "$dbClientCommonOptions" ]]; then
    dbClientCommonOptions="$dbClientCommonOptions $databaseConnectionString";
    dbClientCommonOptions="$dbClientCommonOptions --database=$dbName";
    dbClientCommonOptions="$dbClientCommonOptions $verboseString";
  fi

  # `marker_tab` looked like user data that could be skipped, but apparently not, as no markers appeared using the current query 'monster' :X # Which monster specifically?  In the server code??
  removeAITables='user user_completed_marker'; # With transformed data.
  noDataTables='user_completed_marker';

  ignoreTablesOptions='';
  for table in $removeAITables; do
    ignoreTablesOptions+="--ignore-table='$dbName.$table' ";
  done

  # For the more involved remove AI process.s
  structureOnlyOptions="--no-data";
  dataOnlyOptions="$dataOnlyOptions --no-create-info";
  dataOnlyOptions="$dataOnlyOptions --skip-add-drop-table";
  # dataOnlyOptions="$dataOnlyOptions --skip-extended-insert";

  if [[ "$verbose" == 'true' ]]; then
    errorRedirectionString="";
    verboseString="-v";
  else
    errorRedirectionString="2>/dev/null";
    verboseString="";
  fi

  if [[ "$briefMessages" == "true" ]]; then
    availableMessageCharacters="$(expr "$(tput cols)" - 12 - 3)"; # For the result messages, their wrapping characters, the message prefix, and then the ellipsis.
    messageRedirectionString="head --bytes=$availableMessageCharacters";
  else
    messageRedirectionString="cat";
  fi

  generateDevUsersQueryFilePath="$SDIR/generateDevUsers.sql";
              sqlizeSedFilePath="$SDIR/sqlize.sed"          ;
            convergeSedFilePath="$SDIR/converge.sed"        ;

  # Intermediate, temporary, working directories and files to be deleted at the end of the process, and a few other variables.
  if [[ "$oneFile" = 'true' ]]; then
        keepAIFilePath="$samplesDir/01-structure_keep-AI.sql";
    toRemoveAIFilePath="$samplesDir/02-structure_to-remove-AI.sql";
     aiRemovedFilePath="$samplesDir/03-structure_AI-removed.sql";
          dataFilePath="$samplesDir/04-data.sql";
    sanitizedPartialUserDataFilePath="$samplesDir/05-sanitizedPartialUserData.txt";
    generatedDevUserDataFilePath="$samplesDir/06-devUserData.sql";

    allIntermediateFilePaths="            \
      '$keepAIFilePath'                   \
      '$toRemoveAIFilePath'               \
      '$aiRemovedFilePath'                \
      '$dataFilePath'                     \
      '$sanitizedPartialUserDataFilePath' \
      '$generatedDevUserDataFilePath'     \
    ";

    # Resultant, generated file to keep at the end of the process.
    # completeFilePath="$SDIR/zeldamaps-complete.sql";
    completeFilePath="$samplesDir/$outputName.sql"; # Since the DB is already internally version-tracked, we can just overwrite the main file now.
    completeConvergedFilePath="$samplesDir/$outputName$convergeSuffix.sql";
  else
    completeDirPath="$samplesDir/$outputName";
    [[ ! -d "$completeDirPath" && "$dryRun" != 'true' ]] && mkdir "$completeDirPath";
  fi

  [[ "$convergeInPlace" == 'true' && "$converge" != 'true' ]] \
  && converge='true';
  [[ "$converge" == 'true' && "$convergeInPlace" != 'true' ]] \
  && convergeSuffix="-converged";

  orgExtInsCmd="
    sed -r                        \
      -e 's|\),\(|),\n  (|g'      \
      -e 's|(VALUES )\(|\1\n  (|' \
      -e 's|\);|)\n;|'            \
  ";

  # debugPrint "samplesDir: $samplesDir";
  # debugPrint "removeAITables: $removeAITables";
  # debugPrint "dbDumpCommonOptions: $dbDumpCommonOptions";
  # debugPrint "ignoreTablesOptions: $ignoreTablesOptions";
  # debugPrint "structureOnlyOptions: $structureOnlyOptions";
  # debugPrint "dataOnlyOptions: $dataOnlyOptions";
  # debugPrint "errorRedirectionString: $errorRedirectionString";
  # debugPrint "availableMessageCharacters: $availableMessageCharacters";
  # debugPrint "messageRedirectionString: $messageRedirectionString";
  # debugPrint "convergeSuffix: $convergeSuffix";
  # debugPrint "tableNames: $tableNames";
}

## Usage message
{
  if [[ "$1" == '-h' || "$1" == '--help' ]]; then
    echo 'Usage: $0 [-h|--help]';
    echo;
    echo 'Configuration:';
    echo -e "\tbriefMessages  - Condenses verbose step command description messages to fit withing a single line of terminal width (hopefully..). (Current: $briefMessages)";
    echo -e "\tcleanOnFailure - Removes result files when an error occurs with a step command. (Current: $cleanOnFailure)";
    echo -e "\tconverge    - Enables mode to further process resultant SQL data so that it can be more efficiently compared. (Current: $converge)";
    echo -e "\tconvergeInPlace - Like converge, but does not alter the result file name, and runs an alternate, more limited, set of pattern replacements to better show only content changes with the primary samples. Do not store this!! (Current: $convergeInPlace)";
    echo -e "\tdbClientExe    - The executable to use when issuing certain custom commands to the database server. (Current: $dbClientExe)";
    echo -e "\tdbDumpExe      - The executable to use when exporting data from the database server. (Current: $dbDumpExe)";
    echo -e "\tdbName         - The name of the database schema to work with. (Current: $dbName)";
    echo -e "\tdryRun         - Output step commands, but do not execute them. (Current: $dryRun)";
    echo -e "\tfailFast       - Stop when a single step encounters a problem. (Current: $failFast)";
    echo -e "\toneFile        - Enables the mode to output result data in a single file in the root directory, versus separate ones in a respective subdirectory. (Current: $oneFile)";
    echo -e "\toutputName     - Customizable name for the result directory or single file. (Current: $outputName)";
    echo -e "\tpause          - Wait for the user to press the enter key to execute each step. (Current: $pause)";
    echo -e "\tquiet          - Do not output anything. (Current: $quiet)";
    echo -e "\tverbose        - Output more messages, such as the step commands being executed. (Current: $verbose)";
    exit;
  fi
}

## Config message (condensed)
{
  if [[ "$1" == '-c' || "$1" == '--config' ]]; then
    echo 'Configuration:'                                     ;
    echo -e "\tbriefMessages  :  $(pTWSC "$briefMessages"   )";
    echo -e "\tcleanOnFailure :  $(pTWSC "$cleanOnFailure"  )";
    echo -e "\tconverge       :  $(pTWSC "$converge"        )";
    echo -e "\tconvergeInPlace:  $(pTWSC "$convergeInPlace" )";
    echo -e "\tdbClientExe    :  $dbClientExe"                ;
    echo -e "\tdbDumpExe      :  $dbDumpExe"                  ;
    echo -e "\tdbName         :  $dbName"                     ;
    echo -e "\tdryRun         :  $(pTWSC "$dryRun"          )";
    echo -e "\tfailFast       :  $(pTWSC "$failFast"        )";
    echo -e "\toneFile        :  $(pTWSC "$oneFile"         )";
    echo -e "\toutputName     :  $outputName"                 ;
    echo -e "\tpause          :  $(pTWSC "$pause"           )";
    echo -e "\tquiet          :  $(pTWSC "$quiet"           )";
    echo -e "\tverbose        :  $(pTWSC "$verbose"         )";
    exit;
  fi
}

## Main Program Flow
{
  trap ' \
    statusPrint "${RED}User cancels process; checking to clean now...${NC}"; \
    cleanAndExit 1; \
  ' INT KILL TERM STOP;

  # debugPrint "Script Start";

  ## Basic Preliminary Tests
  {
    issueStep \
      'Test executing database client.' \
      "type -t "$dbClientExe" > /dev/null";
    issueStep \
      'Test executing database dump.' \
      "type -t "$dbDumpExe" > /dev/null";
    issueStep \
      'Test client connection to database.' \
      "echo \
      | '$dbClientExe' \
        $dbClientCommonOptions \
        $errorRedirectionString \
      " \
    ;
    issueStep \
      'Test dump connection to database.' \
      "'$dbDumpExe' \
        $dbDumpCommonOptions \
        > /dev/null \
        $errorRedirectionString \
      " \
    ;
  }

  # debugPrint "oneFile: $oneFile";
  if [[ "$oneFile" = 'true' ]]; then
    ## Export to a single, ultimate combined file.
    # debugPrint "oneFile Start";

    issueStepConvergePrepareConditional "$completeFilePath";

    issueStep \
      "Exporting majority of the database structure, keeping the auto increment values to match the data later on." \
      "'$dbDumpExe'             \
        $dbDumpCommonOptions    \
        $structureOnlyOptions   \
        $ignoreTablesOptions    \
        --add-drop-database     \
        > '$keepAIFilePath'     \
        $errorRedirectionString \
      " \
    ;

    issueStepsRemoveAIValue \
      "$toRemoveAIFilePath" \
      "$aiRemovedFilePath"  \
    ;

    issueStep \
      "Exporting majority of the database data, ignoring certain tables with more sensitive user or otherwise less useful data for development." \
      "'$dbDumpExe'             \
        $dbDumpCommonOptions    \
        $dataOnlyOptions        \
        | $orgExtInsCmd         \
        $ignoreTablesOptions    \
        > '$dataFilePath'       \
        $errorRedirectionString \
      " \
    ;

    issueStepsUserSanAndGen \
      "$sanitizedPartialUserDataFilePath" \
      "$generatedDevUserDataFilePath" \
    ;

    issueStep \
      "Combining intermediate SQL files into a single convenient script for later import and version control." \
      "cat \
        '$keepAIFilePath' \
        '$aiRemovedFilePath' \
        '$dataFilePath' \
        '$generatedDevUserDataFilePath' \
        > '$completeFilePath' \
      " \
    ;

    issueStepD2UConditional "$completeFilePath";

    ## Converge Action
    issueStepConvergeConditional    \
      "$completeFilePath"           \
      "$completeConvergedFilePath"  \
    ;

    # debugPrint "oneFile End";
  else
    # debugPrint "Not oneFile Start";
    ## Export to multiple, individual files.
    defaultTableNames="$(            \
      "$dbClientExe"          \
      $dbClientCommonOptions  \
      -e 'SHOW TABLES'        \
      --batch                 \
      --skip-column-names     \
    ;)";
    [[ -z "$tableNames" ]] && tableNames="$defaultTableNames";
    # debugPrint "defaultTableNames: $defaultTableNames";
    # debugPrint "tableNames: $tableNames";

    for tableName in $tableNames; do
      # debugPrint "Table Start";
      # debugPrint "tableName: $tableName";

      # Validate table exists.
      if ! includes \
        "$defaultTableNames" \
        "$tableName" \
      ; then
        errorPrint "Table \"$tableName\" not found; exiting...";
        exit 2;
      fi

      resultFile="$completeDirPath/$tableName.sql";
      resultConvergedFilePath="$completeDirPath/$tableName$convergeSuffix.sql";
      # debugPrint "resultFile: $resultFile";

      issueStepConvergePrepareConditional "$resultFile";

      # Detect and execute fixing the AI value for each applicable table using a more complex process, or not, and just use the simpler, direct, single-step process.
      if includes \
        "$removeAITables" \
        "$tableName" \
      ; then
        # debugPrint "removeAITable Start";
        ## Handle tables that require transforming data with an updated AI value.

        toRemoveAIFilePath="$samplesDir/$tableName-01-structure_to-remove-AI.sql";
        aiRemovedFilePath="$samplesDir/$tableName-02-structure_AI-removed.sql";

        allIntermediateFilePaths=" \
          '$toRemoveAIFilePath'    \
          '$aiRemovedFilePath'     \
        ";

        issueStepsRemoveAIValue \
          "$toRemoveAIFilePath" \
          "$aiRemovedFilePath"  \
          "$tableName"          \
        ;

        if includes \
          "$noDataTables" \
          "$tableName" \
        ; then
          # debugPrint "No Data Table Start";

          issueStep \
            "Simply using the only intermediate SQL file as the individual table script for later, more specific and efficient, import and version control." \
            "mv \
              '$aiRemovedFilePath'  \
              '$resultFile'         \
            " \
          ;

          # debugPrint "No Data Table End";
        else
          # debugPrint "Data Table Start";
          sanitizedPartialUserDataFilePath="$samplesDir/$tableName-03-sanitizedPartialUserData.txt";
          generatedDevUserDataFilePath="$samplesDir/$tableName-04-devUserData.sql";

          allIntermediateFilePaths="            \
            $allIntermediateFilePaths           \
            '$sanitizedPartialUserDataFilePath' \
            '$generatedDevUserDataFilePath'     \
          ";

          issueStepsUserSanAndGen               \
            "$sanitizedPartialUserDataFilePath" \
            "$generatedDevUserDataFilePath"     \
          ;

          issueStep \
            "Combining intermediate SQL files into the individual table script for later, more specific and efficient, import and version control." \
            "cat \
              '$aiRemovedFilePath'            \
              '$generatedDevUserDataFilePath' \
              > '$resultFile'                 \
            " \
          ;

          # debugPrint "Data Table End";
        fi

        issueStepClean;

        # debugPrint "removeAITable End";
      else
        # debugPrint "Not removeAITable Start";

        ## Handle tables that don't require transforming data with the same AI value.
        issueStep \
          "Exporting complete table \"$tableName\" to an individual completed result file, keeping the auto increment values to match the data later on." \
          "'$dbDumpExe'             \
            $dbDumpCommonOptions    \
            $tableName              \
            | $orgExtInsCmd         \
            > '$resultFile'         \
            $errorRedirectionString \
          " \
        ;

        # debugPrint "Not removeAITable End";
      fi

      issueStepD2UConditional "$resultFile";

      ## Converge Action
      issueStepConvergeConditional  \
        "$resultFile"               \
        "$resultConvergedFilePath"  \
      ;

      # debugPrint "Table End";
    done

    # debugPrint "Not oneFile End";
  fi

  ## Converge Warning Message
  if [[ "$converge" == "true" ]]; then
    echo;
    echo "Important Note: The 'converge' option is enabled.  Do NOT store these exported SQL files permanently in source control OR import them into any database, ESPECIALLY if they are overwritten in place!
    They are for comparing important differences more easily and quickly by removing any less important or always differing information such as defaults and other details *to the content*, but are still important for proper function for the data in its respective sources.
    The data differences are ONLY to be manually and carefully reviewed, ported through migrations using the more exact, unique, and explicit details to converge the databases more properly, then deleted after committing those migration code files.";
  fi
  # debugPrint "Script End";
}
