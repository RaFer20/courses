# Logger
Read through the following code. Why will it log 'debugging'?

```js
function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();
```

## Solution
The `logger` function inside `debugIt` has access to the `status` constant declared in `debugIt` due to lexical scoping rules.