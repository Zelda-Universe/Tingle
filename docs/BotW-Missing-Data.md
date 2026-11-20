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
| Master Mode chests, floating platforms, enemies | 118, 107, 4 | a **Master Mode** section |

DLC categories look like Shrine of Trials (DLC): blue diamonds. Master Mode
has its own crimson diamonds and its own menu section.

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

- Twelve Blizzrobes and six Guardians in the map data without a Master Mode
  flag, which the site doesn't have. Several are One-Hit Obliterator trial
  actors from The Champions' Ballad; it isn't clear when the others appear.
- Master Mode's 138 Bokoblin and Lizalfos lookouts: the site doesn't map
  ordinary enemies.
- Secret of the Cedars and The Spring of Power have no trigger in the map
  data; they're placed at the place their log names (Hateno Village, East
  Akkala Stable).
