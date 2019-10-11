const UserService = require('./UserService');

test('disableUsers regular case', function() {
  let userService = new UserService();
  let payload = `[
    {"usr":"diego.maradona","enabled":true,"expires":"13-05-2022"}, 
    {"usr":"neymarjr","enabled":true,"expires":"05-12-2024"}, 
    {"usr":"bryan.ruiz","enabled":false,"expires":"23-12-2018"}, 
    {"usr":"lsuarez","enabled":true,"expires":"03-07-2019"}
  ]`;

  let results = userService.disableUsers(payload);

  expect(JSON.parse(results)).toEqual([
    {usr:"diego.maradona",enabled:true,expires:"13-05-2022"},
    {usr:"neymarjr",enabled:true,expires:"05-12-2024"},
    {usr:"bryan.ruiz",enabled:false,expires:"23-12-2018"},
    {usr:"lsuarez",enabled:false,expires:"03-07-2019"}
  ]);
});

test('disableUsers empty list', function() {
  let userService = new UserService();
  let payload = '[]';

  let results = userService.disableUsers(payload);
  expect(JSON.parse(results)).toEqual([]);
});
