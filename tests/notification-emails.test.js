const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Notification emails (lib/common/notifications.php): HTML in the password
// reset email's design, with their plain text beside it.

test('a notification email is sent as HTML and plain text',()=>{
  const php=read('lib/common/notifications.php');
  expect(php).toContain("if ($text['html'] !== null) $message->html($text['html']);");
  expect(php).toContain("$template = dirname(__DIR__, 2) . '/content/notificationEmailTemplate.html';");
  // Filled in once, escaped: a comment can't fill in a placeholder.
  expect(php).toContain("$html = strtr(file_get_contents($template), array(");
  expect(php).toContain("'{{url}}' => $e($text['url']),");
});

test('the template has every placeholder, and its notes none',()=>{
  const html=read('content/notificationEmailTemplate.html');
  for (const key of ['{{title}}','{{preheader}}','{{quote}}','{{url}}','{{button}}','{{settingsURL}}','{{siteBaseURL}}']) expect(html).toContain(key);
  expect(html).not.toContain('{{kind}}');
  expect((html.match(/<!--[\s\S]*?-->/g)||[]).join('')).not.toMatch(/\{\{/);
  expect(html).not.toMatch(/<style|<script|<link/i);
});

test('path notifications (no marker) build a link without a warning',()=>{
  expect(read('lib/common/notifications.php')).toContain("$row['page_id'] ?? $row['pageId'] ?? null;");
});
