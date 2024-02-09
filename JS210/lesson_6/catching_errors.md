# Catching Errors
It's not possible to prevent all errors. For example, some built-in JavaScript Functions can throw Errors, but there is no practical way to predict and avoid those errors. Consider the built-in `JSON.parse` method: this method takes a single String argument that contains some data in JSON format, and converts it to an object. If you pass a String to JSON.parse that isn't a valid JSON value, all `JSON.parse` can do is throw an Error:
```js
let data = 'not valid JSON';

JSON.parse(data);  // throws SyntaxError: Unexpected token i in JSON at position 0
```

The only way to prevent errors in JSON.parse is to parse the input String. That is, we need to build a method that can parse JSON Strings. However, that's what JSON.parse does. We surely don't want to reimplement it just to avoid errors. Thus, avoiding errors simply isn't realistic here.

Instead of trying to avoid errors, we can just let `JSON.parse` throw a SyntaxError, and catch it with a `try/catch/finally` block. This is syntactically similar to `if/else` blocks:
```js
try {
  // Do something that might fail here and throw an Error.
} catch (error) {
  // This code only runs if something in the try clause throws an Error.
  // "error" contains the Error object.
} finally {
  // This code always runs, no matter if the above code throws an Error or not.
}
```
The `finally` clause is optional; we can omit it if we don't need it, just as we can omit the `else` clause in an if statement.

Using `try/catch/finally` to handle `JSON.parse` errors:
```js
function parseJSON(data) {
  let result;

  try {
    result = JSON.parse(data);  // Throws an Error if "data" is invalid
  } catch (e) {
    // We run this code if JSON.parse throws an Error
    // "e" contains an Error object that we can inspect and use.
    console.log('There was a', e.name, 'parsing JSON data:', e.message);
    result = null;
  } finally {
    // This code runs whether `JSON.parse` succeeds or fails.
    console.log('Finished parsing data.');
  }

  return result;
}

let data = 'not valid JSON';

parseJSON(data);    // Logs "There was a SyntaxError parsing JSON data:
                    //       Unexpected token i in JSON at position 0"
                    // Logs "Finished parsing data."
                    // Returns null
```

## When to Use Try/Catch
Only use try/catch/finally blocks when the following conditions are both true:

- A built-in JavaScript Function or method can throw an Error and you need to handle or prevent that Error.
- A simple guard clause is impossible or impractical to prevent the Error.