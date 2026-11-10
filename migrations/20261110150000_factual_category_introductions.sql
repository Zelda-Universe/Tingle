-- Revise the stock copy only, leaving editor-written descriptions alone.
UPDATE `marker_category`
SET description = CASE
  WHEN name = 'Dungeon Entrances' THEN 'Entrances to dungeons, including their locations on the overworld.'
  WHEN name REGEXP 'Dungeons|^Dungeon$|Divine Beast' THEN 'Dungeon locations and entrances. Each entry identifies a dungeon and where to access it.'
  WHEN name REGEXP 'Boss|Enemy|Guardian|Wizzrobe|Lynel|Talus|Hinox|Molduga|Gleeok|Flux Construct|Frox|Gloom Spawn' THEN 'Locations of these enemies and boss encounters.'
  WHEN name REGEXP 'Weapon|Bow|Arrow|Shield|Armor|Equipment|Tools|Quest Items' THEN 'Locations where this equipment can be obtained, including pickups, purchases, and rewards.'
  WHEN name REGEXP 'Minigame' THEN 'Minigame locations, with details about their challenges and rewards.'
  WHEN name = 'Spells' THEN 'Locations where Link can learn magic spells.'
  WHEN name = 'Masks' THEN 'Masks and the locations where they can be obtained.'
  WHEN name = 'Capacity & Upgrades' THEN 'Upgrades that increase carrying capacity or improve equipment and abilities.'
  WHEN name REGEXP 'Village|House|Stable' THEN 'Settlements, buildings, and other places to visit.'
  WHEN name REGEXP 'Fairy|Great Fairy' THEN 'Fairy locations and fountains, including the help or upgrades available there.'
  WHEN name = 'Cherry Tree' THEN 'Cherry trees where offerings can reveal nearby cave entrances.'
  WHEN name = 'Blupee' THEN 'Blupee locations. These creatures drop rupees when struck and are often found near caves.'
  WHEN name = 'Cows' THEN 'Cow locations. Playing the appropriate song can provide milk when an empty bottle is available.'
  WHEN name = 'Bargainer Statue' THEN 'Statues that exchange Poes for items and equipment.'
  WHEN name REGEXP 'Treasure|Chest' THEN 'Treasure chest locations, with details about their contents.'
  ELSE description
END
WHERE description IN (
  'Ready for a bigger adventure? These entrances lead to some of the toughest puzzles and battles ahead.',
  'Looking for a fight? Check these encounters and come prepared for the enemies waiting there.',
  'Need a new piece of gear? Check these locations for equipment and useful items to take on your travels.',
  'Fancy a change of pace? Try these games and challenges, and see what you can win.',
  'Add a little magic to your adventure. These are the places to learn new spells.',
  'A different face can lead to a different conversation. Keep track of the masks you can collect here.',
  'Make room for more supplies and improve your gear with these upgrades.',
  'Stop in, look around, and meet the locals. These places are useful stops along the way.',
  'Take a break and seek out a fairy. These places offer a welcome bit of help on your journey.',
  'These cherry trees make peaceful landmarks. Try leaving an offering and see what happens.',
  'A flash of blue in the distance may be a Blupee. Keep an eye on where it goes.',
  'These cows are worth a visit. You might even come away with something for an empty bottle.',
  'Have some Poes to spare? These statues may have something you want in exchange.',
  'There is something worth opening here. Check the entries below to see what each chest holds.'
);
