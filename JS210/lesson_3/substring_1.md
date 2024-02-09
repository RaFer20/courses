# Substring 1
Write a function that returns a substring of a string based on a starting index and length.

Examples
```js
function substr(string, start, length) {
  // …
}

let string = 'hello world';

substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""
```
- The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string. For example, if start is -3, treat it as strLength - 3.
- The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.
You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.
```js
let a = 'hello';
a[0];             // "h"
a[4];             // "o"
```

## Solution
```js
function substr(string, start, length) {
  if (start < 0) {start += string.length}
  let substring = '';

  for (let i = start; i < (start + length); i++) {
    if (i >= string.length) {
      break;
    }
    substring += string[i];
  }
  return substring;
}
```