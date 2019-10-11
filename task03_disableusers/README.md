# Disable users

Complete the method `disableUsers` in `UserService` to receive a JSON string containing a list of objects representing users and disable all users that, given the current date, are expired. Safely assume that the received parameter is always a valid json value.

The function should return a JSON string containing all the users received, with the users that are expired marked as disabled.

This is an example of the input string:

```js
'[{"usr":"diego.maradona","enabled":true,"expires":"13-05-2022"}, {"usr":"neymarjr","enabled":true,"expires":"05-12-2024"}, {"usr":"bryan.ruiz","enabled":false,"expires":"23-12-2018"}, {"usr":"lsuarez","enabled":true,"expires":"03-07-2019"}]'
```

Keep in mind that although the example only has three records, the input string could contain any number of records.
