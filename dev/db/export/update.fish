#!/usr/bin/env fish

set -l SDIR (readlink -f (dirname (status filename)));

# For Testing
# set -x tableNames changelog schema_migrations user;

set -x convergeInPlace 'true';

set dbExportFilePathsChanged (
  git status --porcelain                          \
  | grep -P '^\s*[AM]\s+dev/db/samples/zeldamaps' \
  | sed -r 's|^\s*[AM]\s+||'
);
# debugPrint "dbExportFilePathsChanged: $dbExportFilePathsChanged";

if test -n "$dbExportFilePathsChanged"
  echo 'Database export files changed before script run; process manually; exiting...';
  string join \n "$dbExportFilePathsChanged";
  exit;
end
# debugPrint "dbExportFilePathsChanged: $dbExportFilePathsChanged";

"$SDIR/run.sh";
echo 'Determine which files need to be changed.'
echo 'Remove any not wanted for later.';
if not pause
  exit;
end

set dbExportFilePathsChanged (
  git status --porcelain \
  | grep -P '^\s*[AM]\s+dev/db/samples/zeldamaps' \
  | sed -r 's|^\s*[AM]\s+||'
);
# debugPrint "dbExportFilePathsChanged: $dbExportFilePathsChanged";

if test -z "$dbExportFilePathsChanged"
  echo 'No database export files changed; exiting...';
  exit;
end

set -x tableNames (
  string join \n $dbExportFilePathsChanged  \
  | grep -oP '(?<=/)[^/]+\.sql$'            \
  | sed -r 's|\.sql$||'
);
# debugPrint "tableNames: $tableNames";
# echo "Table Names: $tableNames";

set -e convergeInPlace;

# For Testing
# set tableNames changelog schema_migrations user;

test -e "$SDIR/do-not-commit-converged-sql-files";
and  rm "$SDIR/do-not-commit-converged-sql-files";

git checkout HEAD -- $dbExportFilePathsChanged;

"$SDIR/run.sh";

echo 'Full exports for the following tables have been completed:';
echo "$tableNames";
