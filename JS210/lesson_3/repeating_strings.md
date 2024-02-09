# Repeating Strings
Implement a function that takes a string and a number times as arguments. The function should return the string repeated times number of times. If times is not a number, return undefined. If it is a negative number, return undefined also. If times is 0, return an empty string. You may ignore the possibility that times is a number that isn't an integer.
```js
function repeat(string, times) {
  // …
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined
```
You may concatenate strings, but you may not use any other properties or methods from JavaScript's built-in String class.



## Solution
```js
function repeat(str, num) {
  if (typeof num !== 'number' || num < 0) {
    return undefined;
  } else if (num === 0) {
    return '';
  }

  let repeated_str = '';
  for (let times = 1; times <= num; times++) {
    repeated_str += str;
  }
  return repeated_str
}
```