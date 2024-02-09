# The Red Pill
Read through the code below and determine what will be logged. You may refer to the ASCII Table to look up character code values.
```js
function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111); // to
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33); // Matrix!
```

## Solution
```js
'Welcome'
'to'
'the'
'Matrix!'
```
`anotherAnotherOne();` on line 20 logs the word `Welcome` and calls `anotherOne(116, 111)` which logs the word `to`. Then `anotherOne(116, 104, 101);` on line 21 logs the word `the`. Finally the `one()` function itself returns the `anotherOne()` functions which is uses the arguments passed to it to log `Matrix!`.