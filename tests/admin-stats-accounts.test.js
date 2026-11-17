const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

test('the Accounts graph counts the accounts there are now, as the total and Sign-Up Sources do', () => {
  const php = read('ajax/admin_get_stats.php');
  expect(php).toContain("$count = 'COUNT(*)'; $only = ' AND `deleted` IS NULL';");
  expect(php).toContain('FROM $table WHERE $column >= ?$only GROUP BY `bucket`');
  expect(php).toContain('WHERE $column IS NOT NULL$only');
  expect(php).toContain("SELECT COUNT(*) FROM `{$map_prefix}user` WHERE `deleted` IS NULL");
  expect(read('ajax/admin_get_signups.php')).toContain('`deleted` IS NULL');
});
