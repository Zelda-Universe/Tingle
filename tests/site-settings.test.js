const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Site-wide settings (lib/common/site_settings.php): changed by Admins and
// up in the admin page's Settings, given to every page as it loads.

test('each setting its default until changed, and with no table yet', () => {
  const lib = read('lib/common/site_settings.php');
  expect(lib).toContain("'gameSwitch' => array('type' => 'bool', 'default' => false)");
  expect(lib).toContain("if (!$db || !siteSettingsTable($db, $prefix)) return $settings;");
  expect(read('migrations/20261116130000_site_settings.sql')).toContain('CREATE TABLE IF NOT EXISTS `site_setting`');
});

test('only Admins and up read or change them, and each change is logged', () => {
  const endpoint = read('ajax/admin_site_settings.php');
  expect(endpoint).toContain('$adminId = adminRequire($db, $map_prefix);');
  expect(endpoint).toContain('if (adminLevel() < ADMIN_ROLE_LEVEL) {');
  expect(endpoint).toContain("adminLog($db, $map_prefix, $adminId, $adminId, 'site_setting'");
  expect(endpoint).toContain("if (!isset(SITE_SETTINGS[$name]))");
});

test('every page gets them, defaults if the database can\'t be had', () => {
  const page = read('index.php');
  expect(page).toContain('window.zmapSiteSettings = <?php');
  expect(page).toContain("if ($zmSiteSettings === null) $zmSiteSettings = siteSettings(null, '');");
});

test('the admin page has Settings for Admins and up only', () => {
  const js = read('scripts/zmap.js');
  expect(js).toContain('var siteSettings = !!me && Number(me.level) >= this.ADMIN_ROLE_LEVEL;');
  expect(js).toContain('(siteSettings ? \'<button type="button" role="tab" id="admin_tab_settings"');
  expect(js).toContain("if(tab === 'settings') _this._loadSiteSettings();");
  expect(js).toContain("ZMap.prototype.ADMIN_ROLE_LEVEL = 15;");
});

describe('game switching follows the site setting', () => {
  const load = () => {
    const ZMap = function() {};
    global.isOcarina = g => /^(ootr?|64)$/i.test(String(g || ''));
    new Function('ZMap', read('scripts/services/GameSwitch.js'))(ZMap);
    return new ZMap();
  };
  afterEach(() => { delete window.zmapSiteSettings; localStorage.clear(); });

  test('on for everyone: anyone, signed in or not, with nothing turned on in their browser', () => {
    window.zmapSiteSettings = { gameSwitch: true };
    const zmap = load();
    zmap.getUser = () => null;
    expect(zmap._gameSwitchOn()).toBe(true);
  });

  test('off for everyone: only staff who turned it on in their own browser, as before', () => {
    window.zmapSiteSettings = { gameSwitch: false };
    const zmap = load();
    zmap.getUser = () => ({ level: '20' });
    expect(zmap._gameSwitchOn()).toBe(false);
    localStorage.setItem(zmap.GAME_SWITCH_KEY, 'on');
    expect(zmap._gameSwitchOn()).toBe(true);
    zmap.getUser = () => ({ level: '5' });
    expect(zmap._gameSwitchOn()).toBe(false);
  });

  test('on for everyone: no staff checkbox for one browser', () => {
    window.zmapSiteSettings = { gameSwitch: true };
    const zmap = load();
    zmap.getUser = () => ({ level: '20' });
    const added = [];
    zmap.settingsControl = { addCheckbox: (...a) => added.push(a) };
    zmap._addGameSwitchSetting();
    expect(added).toEqual([]);
  });
});
