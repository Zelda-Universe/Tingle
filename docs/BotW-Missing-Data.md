# Breath of the Wild: dragons, shops, quests, DLC and Master Mode

Data the BotW map was missing, from the game's own files, in
`migrations/20261120130000_botw_missing_data.sql` (made by
`dev/assets/botw/missing-data.py`):

| What | Markers | Category |
| --- | --- | --- |
| Dragons (Dinraal, Naydra, Naydra with Malice, Farosh at Lake Floria, Lake Hylia and the Gerudo Highlands), each with its flight path | 6 + 6 paths | Dragon |
| Shops, as the game's map shows them | 37 | Shops |
| Quests: 15 main, 42 shrine, 77 side, 18 DLC | 152 (54 already on the site) | Main Quests, Shrine Quests, Side-Quests, Quests (DLC) |
| DLC treasure chests (all 24 already on the site) | 24 | Treasure Chest (DLC) |
| Master Mode chests, floating platforms, enemies | 118, 107, 4 + 152 | a **Master Mode** section |

DLC quests are blue circles; DLC chests are a
blue chest glyph with no shape, like the other chests. Master Mode has its own
menu section in crimson: shapeless chests, circles for its platforms and
enemies (`20261120170000_botw_dlc_master_mode_icons.sql`).

## Where it comes from

- **Map data** ([zeldamods/radar](https://github.com/zeldamods/radar), its
  `content/`): every placed object, with names from `names.json`. Dragons fly
  rails named `Dragon_Fire_MainRoute` (Dinraal), `Dragon_Ice_MainRoute` and
  `Runel_Dragon_Rail_2` (Naydra, and Naydra with Malice) and
  `Dragon_Electric_*` (Farosh). Master Mode objects are the ones with
  `IsHardModeActor`; DLC chests are `TBox_Field_*_Aoc`; the three
  `*_Collabo` chests are the Xenoblade Chronicles 2 tie-in quest's, which
  isn't DLC, so they're ordinary equipment chests.
- **Shops** ([objmap game files](https://objmap.zeldamods.org/game_files),
  `map_summary/MainField/static.json`): the shop icons on the game's map,
  named by type, as TotK's are.
- **Quests** ([kenshiisod/botw-gettext](https://github.com/kenshiisod/botw-gettext),
  `botw-wiiu/USen/QuestMsg`): the game's own quest names and log text. Each
  quest starts at the person its first log entry names, at their placement in
  the map data; where nobody gives it, at its trigger in the map (the objects
  tagged with its id), or at the place its log names. Kass's songs are at the
  spot he sings each one. The rules are `QUEST_START` in the script.

Master Mode's enemies are its White-Maned Lynel and three Wizzrobes, plus, in a
second migration (`20261120140000_botw_master_mode_lookouts.sql`), its 152
minor ones: 93 Bokoblins on tree platforms, 45 Lizalfos lookouts and 14 more
Bokoblins, Lizalfos and Moblins. They aren't additions to the site's enemy
camps: only 6 of their 93 groups are within 100 m of one, so each is a marker
of its own.

## Every enemy

A third migration (`20261120150000_botw_all_enemies.sql`) adds every enemy
in normal play. The common ones are a **Common Enemies** menu section, so it
can be hidden: 1,060 Bokoblins, 663 Lizalfos, 435 Chuchus, 333 Keese, 268
Pebblits, 266 Moblins and 227 Octoroks, named as the game names them (Blue
Bokoblin, Stalkoblin, Fire Chuchu…). The Yiga Clan (21, Master Kohga among
them) and seven big enemies the site was missing (three Guardian
Skywatchers, a Guardian Turret, a Blizzrobe, the Molduking and the Igneo
Talus Titan) join the rare ones, whose section is now **Rare Enemies &
Bosses**.

Enemies are shown as placed: the game ranks many of them up as you play.
The same enemy stacked within 2 m (a spawner) is one marker ("Keese x2").
Left out: the One-Hit Obliterator trials' stand-ins (`IsIchigekiActor`) and
the DLC's `_DLC2` copies. The site's 35 enemy camps and its older one-off
enemies stay as they were. Rebuilding needs one more input beside
`EXISTING`, `enemy-markers.tsv`: `category, x, y, id` of the site's visible
BotW markers in categories 1930, 1932, 1933, 1939–1942 and 1947.

A fourth migration (`20261120160000_botw_merge_duplicate_enemies.sql`) hides
nine older enemy markers the game's now stand for, copying their completions
to them (`MERGE_TARGETS` in the script): four White Chuchus (the old name for
Ice Chuchus), three "Enemies" (each the enemies within 20 m of it) and two
Lynels filed under Enemies that doubled ones in the Lynel category. Each is
in its history; the copied completions are listed in `marker_merge_backup`
so the down migration removes exactly those. The enemy camps stay: each has
game enemies at it, but a camp is one thing to clear. The hidden Boss
category (19 Hinox, Talus and Lynel markers that double their own
categories) and the old "DO NOT USE" submap's markers are left as they are.

## The site's own markers

The 54 quest markers and 24 DLC chests already on the site keep their ids,
completions and text. They take the game's name (fixing typos like
"Hoodlumns", "Receipes" and "Hetsu"), their new category and the game's
position. Each change is in the marker's history as an edit by account 15,
after a first version of the marker as it was. A marker edited since the
snapshot in `missing-data.json` is left alone.

Most hand-placed quests were within metres of the game's position. A few
moved further: The Cursed Statue (to Calip, who gives it, from the statue),
Recital at Warbler's Nest (to Kheel at Warbler's Nest, from Rito Village) and
Stranded on Eventide, Trial on the Cliff and Trial of the Labyrinth (100–150 m,
to where the voice speaks).

## Rebuilding

```
python3 dev/assets/botw/missing-data.py prepare RADAR QUESTMSG OBJMAP EXISTING
python3 dev/assets/botw/missing-data.py sql
```

`EXISTING` is the site's BotW quest and chest markers, one JSON object per
line:

```sql
SELECT JSON_OBJECT('id', m.id, 'user_id', m.user_id, 'submap_id', m.submap_id,
  'category_id', m.marker_category_id, 'name', m.name, 'description', m.description,
  'x', m.x, 'y', m.y, 'z', m.z, 'global', m.global, 'visible', m.visible,
  'last_updated', DATE_FORMAT(m.last_updated, '%Y-%m-%d %H:%i:%s'),
  'has_revision', EXISTS(SELECT 1 FROM marker_revision r WHERE r.marker_id = m.id),
  'tabs', (SELECT JSON_ARRAYAGG(t.tab_text ORDER BY t.tab_order, t.marker_tab_id)
           FROM marker_tab t WHERE t.marker_id = m.id AND t.visible = 1))
FROM marker m
WHERE (m.marker_category_id IN (1935, 1943, 1944) AND m.visible = 1 AND m.submap_id = 1901)
   OR m.id = 377
ORDER BY m.id;
```

Then `npm test` (`tests/botw-missing-data.test.js`).

## Not included

- Ten Blizzrobes in the map data with no drop table, unlike every enemy in
  normal play; it isn't clear when they appear.
- Secret of the Cedars and The Spring of Power have no trigger in the map
  data; they're placed at the place their log names (Hateno Village, East
  Akkala Stable).
