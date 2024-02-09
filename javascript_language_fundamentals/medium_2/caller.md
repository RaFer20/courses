# Caller
The `doubler` function in the code below takes two arguments: a `number` to double and return, and a string containing the name of the function's `caller`.
```js
function doubler(number, caller) {
  console.log(`This function was called by ${caller}.`);
  return number + number;
}

doubler(5, 'Victor');                   // returns 10
// logs:
// This function was called by Victor.
```
Write a `makeDoubler` function that takes a `caller` name as an argument, and returns a function that has the same behavior as `doubler`, but with a preset `caller`.

Example:
```js
const doubler = makeDoubler('Victor');
doubler(5);                             // returns 10
// logs:
// This function was called by Victor.
```

## Solution
```js
function makeDoubler(caller) {
  function doubler(number) {
    console.log(`This function was called by ${caller}`);
    return number + number;
  }
  return doubler;
}
```

Using arrow functions:
```js
function makeDoubler(caller) {
  return number => {
    console.log(`This function was called by ${caller}.`);
    return number + number;
  };
}

const doubler = makeDoubler('Victor');
doubler(5);                             // returns 10
// logs:
// This function was called by Victor.
```