#!/usr/bin/env bash

statusPrint() {
  [[ "$QUIET" != "true" ]] && echo -n $*;
}

pauseWhenEnabled() {
  [[ "$PAUSE" == "true" ]] && read;
}

runCommandAndPrintStatus() {
  commandString="$*";
  # echo $commandString; exit 1;
  if [[ "$DRY_RUN" == "false" ]]; then
    if eval "$commandString"; then
      statusPrint -e "Success\n";
    else
      statusPrint -e "Failed\n";
    fi
  else
    statusPrint "Command: $commandString";
  fi
}

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

[[ -z "$QUIET" ]] && QUIET="false";
[[ -z "$PAUSE" ]] && PAUSE="false";
[[ -z "$DRY_RUN" ]] && DRY_RUN="false";

dbUsername="zmaps";
[[ -z "$dbPassword" ]] && read -s -p "Enter the database account password: " dbPassword; echo -n;
database="zelda_maps";
noAITables="user user_completed_marker";
credentialOptions="-u $dbUsername -p$dbPassword";
ignoreTablesOptions='';
for table in $noAITables; do ignoreTablesOptions+="--ignore-table='$database.$table' "; done;
structureOptions="--no-data";
dataOptions="--no-create-info --skip-add-drop-table --skip-extended-insert";

keepAIFilePath="$SDIR/db/zelda_maps-structure_with-AI.sql";
toRemoveAIFilePath="$SDIR/db/zelda_maps-structure_to-remove-AI.sql";
aiRemovedFilePath="$SDIR/db/zelda_maps-structure_AI-removed.sql";
dataFilePath="$SDIR/db/zelda_maps-data.sql";
completeFilePath="$SDIR/db/zelda_maps-complete.sql";
# TODO: eval the ignore params or all command line so tables get ignored???

pauseWhenEnabled;
statusPrint "Exporting majority of the database structure, keeping the auto increment values to match the data later on...";
runCommandAndPrintStatus "mysqldump $credentialOptions $structureOptions $ignoreTablesOptions --add-drop-database --databases $database > '$keepAIFilePath' 2>/dev/null";

pauseWhenEnabled;
statusPrint "Exporting the rest of the database the structure, with no way to immediately remove the auto increment values to match not having data later on...";
runCommandAndPrintStatus "mysqldump $credentialOptions $structureOptions $database $noAITables > '$toRemoveAIFilePath' 2>/dev/null";

pauseWhenEnabled;
statusPrint "Exporting majority of the database data, ignoring certain tables with more sensitive user or other data...";
runCommandAndPrintStatus "mysqldump $credentialOptions $dataOptions $ignoreTablesOptions $database > '$dataFilePath' 2>/dev/null";

pauseWhenEnabled;
statusPrint "Removing auto increment values in sensitive data table schemas...";
runCommandAndPrintStatus "sed -r 's| AUTO_INCREMENT=[[:digit:]]+||g' '$toRemoveAIFilePath' > '$aiRemovedFilePath'";

pauseWhenEnabled;
statusPrint "Cleaning intermediate SQL file...";
runCommandAndPrintStatus "rm '$toRemoveAIFilePath'";

pauseWhenEnabled;
statusPrint "Combining intermediate SQL files into a single convenient script for later import and version control...";
runCommandAndPrintStatus "cat '$keepAIFilePath' '$aiRemovedFilePath' '$dataFilePath' > '$completeFilePath'";

pauseWhenEnabled;
statusPrint "Cleaning the no longer needed intermediate SQL files...";
runCommandAndPrintStatus "rm '$keepAIFilePath' '$aiRemovedFilePath' '$dataFilePath'";
