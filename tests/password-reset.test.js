const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Forgot Password and choosing a new password (scripts/zmap.js), laid out as
// the login page is, their messages in the page.

test('hidden is hidden in the drawer, whatever Leaflet\'s styles say (an invalid link showed the password form)',()=>{
  expect(read('styles/zmain.css')).toContain('.leaflet-control-layers [hidden] { display: none !important; }');
});

test('Forgot Password: an email field, messages in the page, then what happens next',()=>{
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain('id="lostpassword_email" required="" maxlength="254" placeholder="Email address" autocomplete="email"');
  expect(zmap).toContain("$('#lostpassword_sent').prop('hidden', false);");
  // No longer stops the page while it waits, nor drops the reader on the home page.
  const lost=zmap.slice(zmap.indexOf('ZMap.prototype._createLostPasswordForm'), zmap.indexOf('ZMap.prototype._createResetPasswordForm'));
  expect(lost).not.toContain('async: false');
  expect(lost).not.toContain('toastr');
  expect(lost).not.toContain('resetContent');
});

test('a new password: checked in the page, then the login page says it changed',()=>{
  const zmap=read('scripts/zmap.js');
  const reset=zmap.slice(zmap.indexOf('ZMap.prototype._createResetPasswordForm'), zmap.indexOf('ZMap.prototype._createChangePasswordForm'));
  expect(reset).not.toContain('toastr');
  expect(reset).toContain('_this._createLoginForm(_this.langMsgs.RESET_PASSWORD_SUCCESS);');
  // The account's username, for password managers.
  expect(reset).toContain('autocomplete="username"');
  expect(read('ajax/reset_password.php')).toContain('"username" => (string) $reset[\'username\']');
});

test('both forms keep the login page\'s 24px sides and 16px fields',()=>{
  const css=read('styles/zmain.css');
  expect(css).toContain('.menu-cat-content-inner form#newuserform,\n.menu-cat-content-inner .account-form {');
  expect(css).toContain('.account-form .form-control { font-size: 16px; }');
});

test('the reset e-mail has an HTML version beside its plain text, its values escaped',()=>{
  const mailer=read('lib/zmailer.php');
  expect(mailer).toContain("if ($bodies['html'] !== null) $email->html($bodies['html']);");
  expect(mailer).toContain("[$escape($toName), $escape($resetLink), $escape($siteBaseURL)],");
  const html=read('content/lostPasswordEmailBodyTemplate.html');
  for (const key of ['{{name}}','{{resetLink}}','{{siteBaseURL}}']) expect(html).toContain(key);
  // Mail apps: tables and inline styles, no stylesheet or script.
  expect(html).not.toMatch(/<style|<script|<link/i);
  expect(html).toContain('href="{{resetLink}}"');
});
