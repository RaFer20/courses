# Converting String to Lower Case
Write a function that returns a string converted to lowercase.

To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number, then convert the number back to a character using the same ASCII table. You can use the String.fromCharCode and the String.charCodeAt methods for these operations. For example:
```js
let string = 'A';
let asciiNumeric = string.charCodeAt(0);         // 65
asciiNumeric += 32;
string = String.fromCharCode(asciiNumeric);  // "a", converted to lowercase
```
Examples:
```js
function toLowerCase(string) {
  // …
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"
```
You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.

```js
'hello'[0];    // "h"
'hello'[4];    // "o"
```

## Solution
```js
function toLowerCase(string) {
  let lowerCaseString = '';
  let asciiNumeric = 0;
  for (let i = 0; i < string.length; i++) {
    if (string.charCodeAt(i) < 65 || string.charCodeAt(i) > 90) {
      lowerCaseString += string[i];
      continue;
    }
    asciiNumeric = string.charCodeAt(i);
    lowerCaseString += String.fromCharCode(asciiNumeric + 32);
  }
  return lowerCaseString;
}
```