# Uppercase Check
Write a function that takes a string argument and returns `true` if all of the alphabetic characters inside the string are uppercase; otherwise, return `false`. Ignore characters that are not alphabetic.

Examples:
```js
isUppercase('t');               // false
isUppercase('T');               // true
isUppercase('Four Score');      // false
isUppercase('FOUR SCORE');      // true
isUppercase('4SCORE!');         // true
isUppercase('');                // true
```

## Solution
```js
function isUppercase(string) {
  return string.split('').every((char) => char === char.toUpperCase());
}
```

regex alternative:
```js
function isUppercase(string) {
  return !/[a-z]/.test(string);
}
```