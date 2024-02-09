# Short Long Short
Write a function that takes two strings as arguments, determines the length of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

Examples:
```js
shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"
```


## Solution
```js
function shortLongShort(firstString, secondString) {
  let newString = '';
  if (firstString.length < secondString.length) {
    newString += firstString + secondString + firstString;
  } else {
    newString += secondString + firstString + secondString;
  }
  return newString;
}
```