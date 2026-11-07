const categories=[
  [64022,64020,'Weapons','BotW_Weapons','#ede954'],
  [64023,64020,'Shields','BotW_Shields','#ede954'],
  [64024,64020,'Equipment & Tools','OoT_Chest','#ede954'],
  [64025,64020,'Dungeon Maps','General_Map','#ede954'],
  [64026,64020,'Compasses','General_Compass','#ede954'],
  [64027,64020,'Small Keys','General_Key','#ede954'],
  [64028,64020,'Boss Keys','General_Key','#ede954'],
  [64060,null,'Items & Equipment','General_Map','#cdb269'],
  [64061,64060,'Weapons','BotW_Weapons','#cdb269'],
  [64062,64060,'Armor & Shields','BotW_Armor','#cdb269'],
  [64063,64060,'Tools & Quest Items','General_Info','#cdb269'],
  [64064,64060,'Capacity & Upgrades','General_Bottle','#cdb269'],
  [64065,64060,'Spells','BotW_Great-Fairy','#cdb269'],
  [64066,64060,'Masks','BotW_Boss','#cdb269']
];
function chestCategory(item){
  if(/Boss Key/i.test(item))return 64028;
  if(/Small Key/i.test(item))return 64027;
  if(/Dungeon Map/i.test(item))return 64025;
  if(/^Compass/i.test(item))return 64026;
  if(/Shield/i.test(item))return 64023;
  if(/Sword|Bow|Slingshot|Boomerang|Hammer|(?:Fire|Ice|Light) Arrow/i.test(item))return 64022;
  if(/Boots|Gauntlets|Hookshot|Longshot|Lens|Bomb Bag/i.test(item))return 64024;
  return 64021;
}
const rewardCategory={weapons:64061,armor:64062,tools:64063,quest:64063,upgrades:64064,spells:64065,masks:64066};
module.exports={categories,chestCategory,rewardCategory};
