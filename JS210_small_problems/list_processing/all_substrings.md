# All Substrings
Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at index position 0 should come first, then all substrings that start at index position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given index from shortest to longest.

You may (and should) use the leadingSubstrings function you wrote in the previous exercise:

Example:
```js
substrings('abcde');

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
```
## Solutions
Using the solution from the previous problem:
```js
function substrings(string) {
  const substrings = [];

  for (let i = 0; i < string.length; i += 1) {
    substrings.push(leadingSubstrings(string.slice(i, string.length)))
  }

  return substrings.flat();
}

function leadingSubstrings(string) {
  const substrings = [];
  for (let i = 0; i < string.length; i += 1) {
    substrings.push(string.slice(0, i + 1));
  }

  return substrings;
}
```

Alternative:
```js
function substrings(string) {
  let substrings = [];
  for (let startIndex = 0; startIndex < string.length; startIndex += 1) {
    let substring = string.substring(startIndex);
    substrings = substrings.concat(leadingSubstrings(substring));
  }

  return substrings;
}

function leadingSubstrings(string) {
  let substrings = [];
  for (let length = 1; length <= string.length; length += 1) {
    substrings.push(string.slice(0, length));
  }

  return substrings;
}
```

## Futher Exploration
```js
function substrings(string) {
  const substrings = [];

  for (let i = 0; i < string.length; i += 1) {
    substrings.push(leadingSubstrings(string.slice(i, string.length)))
  }

  return substrings.flat();
}

function leadingSubstrings(string) {
  const substrings = [];
  let chars = string.split('');

  chars.map((char, idx) => {
    substrings.push(chars.slice(0, idx + 1).join(''))
  })

  return substrings;
}
```