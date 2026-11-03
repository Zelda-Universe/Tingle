const fs = require('fs');
const vm = require('vm');
const context = {};
vm.runInNewContext(fs.readFileSync(__dirname + '/botwCategoryCorrections.js', 'utf8'), context);
const correct = context.correctBotWMarkerCategory;

describe('audited BotW POI category corrections', () => {
  test('provides a BotW NPC category once and preserves actual quest entries', () => {
    const categories = [{ id: '1901', container_id: '19' }];
    const result = context.ensureBotWNPCCategory(categories);
    expect(result.find(c => c.id === '1955').img).toBe('TotK_Npc');
    expect(context.ensureBotWNPCCategory(result)).toBe(result);
    expect(categories).toHaveLength(1);
    [['331', '1901'], ['377', '1935'], ['229', '1935']].forEach(([id, source]) => {
      expect(correct({ id, mapId: '19', markerCategoryId: source }).markerCategoryId).toBe('1955');
    });
    const quest = { id: '283', mapId: '19', markerCategoryId: '1935' };
    expect(correct(quest)).toBe(quest);
  });
  test('moves the two confirmed Lynels without treating roaming enemies as camps', () => {
    ['474', '254'].forEach(id => {
      expect(correct({ id, mapId: '19', markerCategoryId: '1930' }).markerCategoryId).toBe('1940');
    });
    ['75', '370', '160', '235'].forEach(id => {
      const marker = { id, mapId: '19', markerCategoryId: '1930' };
      expect(correct(marker)).toBe(marker);
    });
  });
  test('reclassifies exactly 21 confirmed markers without changing source records', () => {
    const entries = Object.entries(context.BOTW_CATEGORY_CORRECTIONS);
    expect(entries).toHaveLength(21);
    entries.forEach(([id, category]) => {
      const marker = { id, mapId: '19', markerCategoryId: '1901', x: 123, y: -45 };
      const result = correct(marker);
      expect(result).toEqual({ ...marker, markerCategoryId: category });
      expect(marker.markerCategoryId).toBe('1901');
    });
  });
  test('leaves ambiguous entries, other games and already corrected records alone', () => {
    [
      { id: '139', mapId: '19', markerCategoryId: '1901' },
      { id: '1503', mapId: '2102', markerCategoryId: '1901' },
      { id: '1503', mapId: '19', markerCategoryId: '1943' }
    ].forEach(marker => expect(correct(marker)).toBe(marker));
    expect(correct(null)).toBeNull();
  });
});
