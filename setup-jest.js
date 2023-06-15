// Source: https://stackoverflow.com/a/48320438/1091943
// $ = require('jquery')(
//   (new require('jsdom').JSDOM()).window
// );

$ = require('jquery');

ZConfig = {
  getConfig:    jest.fn(),
  addHandlers:  jest.fn()
};
