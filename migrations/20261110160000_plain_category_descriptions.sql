-- Short definitions in place of the remaining conversational stock copy.
UPDATE marker_category SET description = CASE name
  WHEN 'Gold Skulltulas' THEN 'Gold Skulltula locations. Each one drops a token when defeated.'
  WHEN 'Heart Pieces' THEN 'Pieces of Heart. Collect four to gain another heart.'
  WHEN 'Pieces of Heart' THEN 'Pieces of Heart. Collect four to gain another heart.'
  WHEN 'Heart Containers' THEN 'Heart Containers that increase maximum health.'
  WHEN 'Big Poes' THEN 'Big Poes that can be defeated and caught in bottles.'
  WHEN 'Silver Rupees' THEN 'Silver rupees used to complete dungeon puzzles.'
  WHEN 'Fairy Thoughts' THEN 'Fairy Thoughts collectible locations.'
  WHEN 'Ocarina Songs' THEN 'Locations where ocarina songs are learned.'
  WHEN 'Bottles' THEN 'Locations and rewards that provide additional bottles.'
  WHEN 'Gossip Stones' THEN 'Gossip Stones that provide hints and information.'
  WHEN 'Magic Bean Spots' THEN 'Soft soil patches where Magic Beans can be planted.'
  WHEN 'NPCs' THEN 'Characters you can talk to, including those with requests or rewards.'
  WHEN 'Kaepora Gaebora' THEN 'Locations where Kaepora Gaebora appears.'
  WHEN 'Dungeon Maps' THEN 'Dungeon maps that reveal the layout of a dungeon.'
  WHEN 'Compasses' THEN 'Compasses that reveal treasure and important rooms in a dungeon.'
  WHEN 'Small Keys' THEN 'Keys used to open locked doors within a dungeon.'
  WHEN 'Boss Keys' THEN 'Keys used to open dungeon boss doors.'
  WHEN 'Boss Doors' THEN 'Doors leading to dungeon boss rooms.'
  ELSE description END
WHERE description IN (
  'Listen for the scratching of a Gold Skulltula, then collect its token. Some only appear at night or during a particular age.',
  'Collect four Pieces of Heart to add another heart to your health meter.',
  'A little more health can make a big difference. Pick up these Heart Containers to extend your health meter.',
  'Keep an eye out while riding through Hyrule Field. Defeat Big Poes and catch their spirits in a bottle.',
  'Gather the silver rupees in each puzzle to open the way forward.',
  'There are little traces of fairy thoughts waiting to be discovered. Check the locations below as you explore.',
  'A familiar melody can open a path or carry you somewhere new. Here is where to learn each song.',
  'An empty bottle always comes in handy. These are the rewards and encounters that can add one to your collection.',
  'These mysterious stones have things to say. Stop by and hear what they know.',
  'A patch of soft soil could be the start of a useful shortcut. Plant a Magic Bean and see what grows.',
  'Meet the people who bring these places to life. Some have advice, requests, or rewards to share.',
  'The wise owl has a few things to tell you. Here is where you can meet him on your travels.',
  'A dungeon map makes it easier to get your bearings. Here is where to pick one up.',
  'Pick up a compass to help you keep track of important rooms and treasure inside a dungeon.',
  'A locked door ahead? Check these key locations before retracing your steps.',
  'You will need these keys before you can face the dungeon boss.',
  'Beyond these doors, a dungeon boss is waiting. Make sure you are ready before heading inside.'
);
