# URL Parameters

Complete the method `getParams` on `UrlUtils.js` to receive a string representing an url and return an object containing the parameters from the query string and its corresponding values.
Remember that query strings can be optional. Assume the url syntax is always correct.

E.g.:

The input:

```js
"http://localhost/app/mod?param1=val1&param2=val2&param3=val3"
```

Should produce the output js object:

```js
{
  "param1": "val1",
  "param2": "val2",
  "param3": "val3"
}
```

You can run the tests by first installing the dependencies using

```bash
npm install
```

And then running

```bash
npm test
```
