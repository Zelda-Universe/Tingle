delete from marker where marker_category_id = 2173;
delete from marker_category where id = 2173;
INSERT INTO marker_category (id, parent_id, marker_category_type_id, container_id, name, default_checked, img, color, visible_zoom, visible) VALUES
(2173, 2101, 1, 21, 'Dragon', 1, 'TotK_Dragon', '#4bc5ee', 6, 1)
;
insert into marker values (null, '2101',null,2,2173, 1, 'Naydra (Surface)', '', 112.84375,-89.0625,0,0,'[
{"color": "lightblue", "lat":-74.28125,"lng":112.40625},
{"color": "lightblue", "lat":-78.15625,"lng":119},
{"color": "lightblue", "lat":-89.0625,"lng":112.84375},
{"color": "lightblue", "lat":-90.9375,"lng":108.75},
{"color": "lightblue", "lat":-85.625,"lng":100.8125},
{"color": "lightblue", "lat":-75.84375,"lng":99.375},
{"color": "lightblue", "lat":-68.5625,"lng":93.375}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);
insert into marker values (null, '2103',null,2,2173, 1, 'Naydra (Depths)', '',98.5,-62.53125,0,0,'[
{"color": "lightblue", "lat":-68.5625,"lng":93.375},
{"color": "lightblue", "lat":-62.53125,"lng":98.5},
{"color": "lightblue", "lat":-66.15625,"lng":105.09375},
{"color": "lightblue", "lat":-74.28125,"lng":112.375}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);

insert into marker values (null, '2103',null,2,2173, 1, 'Farosh (Depths)', '', 71.8125,-92.296875,0,0,'[
{"color": "lightgreen", "lat":-83.40625,"lng":72.96875},
{"color": "lightgreen", "lat":-93.4375,"lng":78.359375},
{"color": "lightgreen", "lat":-94.8125,"lng":75.265625},
{"color": "lightgreen", "lat":-92.296875,"lng":71.8125},
{"color": "lightgreen", "lat":-97.5625,"lng":52.53125},
{"color": "lightgreen", "lat":-101.8515625,"lng":51.046875},
{"color": "lightgreen", "lat":-102.109375,"lng":47.78125},
{"color": "lightgreen", "lat":-96.671875,"lng":45.25},
{"color": "lightgreen", "lat":-94.53125,"lng":41.078125}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);

insert into marker values (null, '2101',null,2,2173, 1, 'Farosh (Surface)', '', 41.09375,-82.71875,0,0,'[
{"color": "lightgreen", "lat":-94.53125,"lng":41.078125},
{"color": "lightgreen", "lat":-89.75,"lng":39.65625},
{"color": "lightgreen", "lat":-86.1875,"lng":40.03125},
{"color": "lightgreen", "lat":-82.71875,"lng":41.09375},
{"color": "lightgreen", "lat":-81.25,"lng":48.25},
{"color": "lightgreen", "lat":-87.34375,"lng":50.96875},
{"color": "lightgreen", "lat":-83.40625,"lng":72.96875}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);



insert into marker values (null, '2101',null,2,2173, 1, 'Dinraal (Surface)', '', 108.484375,-16.609375,0,0,'[
{"color": "#FFCCCB", "lat":-33.125,"lng":117.5625},
{"color": "#FFCCCB", "lat":-24.4375,"lng":126.125},
{"color": "#FFCCCB", "lat":-20.1875,"lng":125.4375},
{"color": "#FFCCCB", "lat":-18.8125,"lng":121.4375},
{"color": "#FFCCCB", "lat":-20.453125,"lng":114.984375},
{"color": "#FFCCCB", "lat":-16.609375,"lng":108.484375},
{"color": "#FFCCCB", "lat":-19,"lng":99.890625},
{"color": "#FFCCCB", "lat":-19.390625,"lng":94.625},
{"color": "#FFCCCB", "lat":-17,"lng":90.6875},
{"color": "#FFCCCB", "lat":-16.0625,"lng":86.40625},
{"color": "#FFCCCB", "lat":-18.125,"lng":79.8125},
{"color": "#FFCCCB", "lat":-23.53125,"lng":69.5625}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);


insert into marker values (null, '2103',null,2,2173, 1, 'Dinraal (Depths)', '', 98.765625,-15.046875,0,0,'[
{"color": "#FFCCCB", "lat":-23.53125,"lng":69.5625},
{"color": "#FFCCCB", "lat":-16.859375,"lng":72.40625},
{"color": "#FFCCCB", "lat":-15.296875,"lng":75.640625},
{"color": "#FFCCCB", "lat":-15.359375,"lng":87.953125},
{"color": "#FFCCCB", "lat":-17.90625,"lng":95.421875},
{"color": "#FFCCCB", "lat":-15.046875,"lng":98.765625},
{"color": "#FFCCCB", "lat":-15.1875,"lng":108.34375},
{"color": "#FFCCCB", "lat":-21.53125,"lng":114.046875},
{"color": "#FFCCCB", "lat":-21.6875,"lng":115.796875},
{"color": "#FFCCCB", "lat":-18.828125,"lng":118.71875},
{"color": "#FFCCCB", "lat":-19.359375,"lng":121.375},
{"color": "#FFCCCB", "lat":-21.5625,"lng":121.40625},
{"color": "#FFCCCB", "lat":-26.625,"lng":121.296875},
{"color": "#FFCCCB", "lat":-33.125,"lng":117.5625}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);


insert into marker values (null, '2101',null,2,2173, 1, 'Light Dragon', '', 86.96875,-43.21875,0,0,'[
{"color": "whitesmoke", "lat":-43.21875,"lng":86.96875},
{"color": "whitesmoke", "lat":-46.71875,"lng":88.125},
{"color": "whitesmoke", "lat":-54.65625,"lng":102.3125},
{"color": "whitesmoke", "lat":-57.65625,"lng":113.09375},
{"color": "whitesmoke", "lat":-64,"lng":117.09375},
{"color": "whitesmoke", "lat":-79.046875,"lng":118.171875},
{"color": "whitesmoke", "lat":-85.5,"lng":114.28125},
{"color": "whitesmoke", "lat":-86.75,"lng":107.140625},
{"color": "whitesmoke", "lat":-88.59375,"lng":103.125},
{"color": "whitesmoke", "lat":-85.125,"lng":99.546875},
{"color": "whitesmoke", "lat":-79.953125,"lng":93.59375},
{"color": "whitesmoke", "lat":-74.703125,"lng":90.9375},
{"color": "whitesmoke", "lat":-73.5,"lng":86.90625},
{"color": "whitesmoke", "lat":-75.09375,"lng":83.796875},
{"color": "whitesmoke", "lat":-86.9375,"lng":79.75},
{"color": "whitesmoke", "lat":-89.3125,"lng":77.59375},
{"color": "whitesmoke", "lat":-84.46875,"lng":69.28125},
{"color": "whitesmoke", "lat":-74.53125,"lng":63.03125},
{"color": "whitesmoke", "lat":-74.78125,"lng":58.03125},
{"color": "whitesmoke", "lat":-80.0625,"lng":48.6875},
{"color": "whitesmoke", "lat":-81.28125,"lng":43.375},
{"color": "whitesmoke", "lat":-80.46875,"lng":37.15625},
{"color": "whitesmoke", "lat":-74.84375,"lng":27.5625},
{"color": "whitesmoke", "lat":-69.84375,"lng":26.84375},
{"color": "whitesmoke", "lat":-69,"lng":32.78125},
{"color": "whitesmoke", "lat":-59.71875,"lng":33.59375},
{"color": "whitesmoke", "lat":-56.84375,"lng":56.84375},
{"color": "whitesmoke", "lat":-51.25,"lng":58.84375},
{"color": "whitesmoke", "lat":-35.03125,"lng":40.65625},
{"color": "whitesmoke", "lat":-35.8125,"lng":27.1875},
{"color": "whitesmoke", "lat":-30.875,"lng":22},
{"color": "whitesmoke", "lat":-25.375,"lng":24.875},
{"color": "whitesmoke", "lat":-16.03125,"lng":37.4375},
{"color": "whitesmoke", "lat":-16.125,"lng":41},
{"color": "whitesmoke", "lat":-19.0625,"lng":57.5625},
{"color": "whitesmoke", "lat":-23.5,"lng":74.3125},
{"color": "whitesmoke", "lat":-22.4375,"lng":106.8125},
{"color": "whitesmoke", "lat":-25.125,"lng":110},
{"color": "whitesmoke", "lat":-31.875,"lng":111.125},
{"color": "whitesmoke", "lat":-34.71875,"lng":108.875},
{"color": "whitesmoke", "lat":-35.296875,"lng":96.203125},
{"color": "whitesmoke", "lat":-35.90625,"lng":91.6875},
{"color": "whitesmoke", "lat":-38.03125,"lng":87.5},
{"color": "whitesmoke", "lat":-43.21875,"lng":86.96875}
]',1,2023-05-06);
insert into marker_tab values (null, (select auto_increment from information_schema.tables where table_name = 'marker') - 1, 2, 1, '', '', 1, 1);
