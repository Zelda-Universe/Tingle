const Fuse = require('fuse.js');

test('init', () => {
  expect(() => new Fuse()).not.toThrow();
});

describe('search', () => {
  let searchConfig;

  beforeEach(() => {
    searchConfig = {
      ignoreLocation    : true,
      includeScore      : true,
      includeMatches    : true,
      keys: [
        'name'        ,
        'description' ,
        'tabText'
      ],
      maxPatternLength  : 32  ,
      minMatchCharLength: 3   ,
      threshold         : 0.59
    };
  });

  test('test data exact or very close', () => {
    targetItems   = [
      {
        name:         'name',
        description:  'desc',
        tabText:      'text'
      }
    ];

    fuse = new Fuse(
      targetItems,
      searchConfig
    );

    searchResults = fuse.search('none');
    expect(searchResults).toHaveLength(0);

    searchResults = fuse.search('name');
    expect(searchResults).toHaveLength(1);
    expect(searchResults[0].score).toBeLessThan(0.01);

    searchResults = fuse.search('name1');
    expect(searchResults).toHaveLength(1);
    expect(searchResults[0].score).toBe(0.2);

    searchResults = fuse.search('desc');
    expect(searchResults).toHaveLength(1);
    expect(searchResults[0].score).toBeLessThan(0.01);

    searchResults = fuse.search('text');
    expect(searchResults).toHaveLength(1);
    expect(searchResults[0].score).toBeLessThan(0.01);
  });

  test('real data almost exact', () => {
    targetItems = [
      {
        name:         'name',
        description:  'desc',
        tabText:      'text'
      },
      {
        id          : "24275"                     ,
        name        : 'Treasure Chest'            ,
        description : '1116975303344733487'       ,
        tabText     : '<p>Contains: Sundelion</p>'
      },
      {
        id          : "24276"                     ,
        name        : 'Treasure Chest'            ,
        description : '13586767620609168263'      ,
        tabText     : '<p>Contains: Sundelion</p>'
      }
    ];

    fuse = new Fuse(
      targetItems,
      searchConfig
    );

    searchResults = fuse.search('treasure');
    expect(searchResults).toHaveLength(2);
    expect(searchResults[0].score).toBeLessThan(0.01);

    searchResults = fuse.search('76762');
    expect(searchResults).toHaveLength(1);
    expect(searchResults[0].score).toBeLessThan(0.01);

    searchResults = fuse.search('sundelion');
    expect(searchResults).toHaveLength(2);
    expect(searchResults[0].score).toBeLessThan(0.01);

    searchResults = fuse.search('chest');
    expect(searchResults).toHaveLength(2);
    expect(searchResults[0].score).toBeLessThan(0.01);
  });
});
