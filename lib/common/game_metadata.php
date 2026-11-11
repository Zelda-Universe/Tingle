<?php
function defaultGamePageTitle($game,$name='') {
  return $name;
}
function defaultGameSeoDescription($game) {
  $descriptions = [
    'oot' => 'Interactive, searchable Ocarina of Time map with locations and guides for every Heart Piece, Gold Skulltula, Big Poe, and more.',
    'la' => "Interactive, searchable Link's Awakening map with locations and guides for every Secret Seashell, Piece of Heart, trading item, and more.",
    'botw' => 'Interactive, searchable Breath of the Wild map with locations and guides for every Shrine, Korok Seed, Tower, Memory, and more.',
    'totk' => 'Interactive, searchable Tears of the Kingdom map with locations and guides for every Shrine, Korok Seed, Lightroot, Skyview Tower, and more.',
    'eow' => 'Interactive, searchable Echoes of Wisdom map with locations and guides for every Echo, Piece of Heart, Might Crystal, Stamp, and more.'
  ];
  $key=strtolower($game);
  return $descriptions[$key === 'ootr' ? 'oot' : $key] ?? '';
}
