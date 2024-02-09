# Double Char Part 1
Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

Examples:
```js
repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
```


## Solution
```js
function repeater(string) {
  let repeated = '';

  for (char of string) {
    repeated += char + char;
  }

  return repeated;
}
```

Alternative using an array:
```js
function repeater(string) {
  const stringArray = [];

  for (let i = 0; i < string.length; i += 1) {
    stringArray.push(string[i], string[i]);
  }

  return stringArray.join('');
}
```