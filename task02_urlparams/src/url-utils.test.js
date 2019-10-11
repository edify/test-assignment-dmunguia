const UrlUtils = require('./UrlUtils');

test('getParams for regular case', function() {
  let urlUtils = new UrlUtils();
  let url = "http://localhost/app/mod?param1=val1&param2=val2&param3=val3";

  expect(urlUtils.getParams(url)).toEqual({
    param1: 'val1',
    param2: 'val2',
    param3: 'val3',
  });
});

test('getParams for no query string case', function() {
  let urlUtils = new UrlUtils();
  let url = "http://localhost/app/mod";

  expect(urlUtils.getParams(url)).toEqual({});
});

test('getParams for one param case', function() {
  let urlUtils = new UrlUtils();
  let url = "http://localhost/app/mod?param1=val1";

  expect(urlUtils.getParams(url)).toEqual({
    param1: 'val1',
  })
});
