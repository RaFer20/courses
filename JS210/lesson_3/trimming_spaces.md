# Trimming Spaces
Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.

Example
```js
trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
```
You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
```js
'hello'[0];       // "h"
'hello'[4];       // "o"
```

## Solution
```js
function trimLeft(str) {
  let new_str = ''
  let copy = false
  for (let i = 0; i < str.length; i++) {
    if (str[i] === ' ' && copy == false) {
      continue;
    } else if (str[i] !== ' ') {
      copy = true;
    }
    new_str += str[i];
  }
  return new_str
}

function trimRight(str) {
  let new_str = ''
  let copy = false
  for (let i = (str.length - 1); i >= 0; i--) {
    if (str[i] === ' ' && copy == false) {
      continue;
    } else if (str[i] !== ' ') {
      copy = true;
    }
    new_str = str[i] + new_str
  }
  return new_str
}

function trim(str) {
  let new_str = trimLeft(str)
  new_str = trimRight(new_str)
  return new_str
}
```
