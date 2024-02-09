# Leading Substrings
Write a function that takes a string argument and returns a list of substrings of that string. Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

Examples:
```js
leadingSubstrings('abc');      // ["a", "ab", "abc"]
leadingSubstrings('a');        // ["a"]
leadingSubstrings('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
```


## Solution
```js
function leadingSubstrings(string) {
  const substrings = [];
  for (let i = 0; i < string.length; i += 1) {
    substrings.push(string.slice(0, i + 1));
  }

  return substrings;
}
```

## Further Exploration
Rewrite `leadingSubstrings` using list processing functions. That is, convert the string into an array of some sort and use functions like map, filter, or reduce to get the desired substrings. (You will also need to use join.) Try not to use forEach as that is too similar to the for loop approach.
```js
function leadingSubstrings(string) {
  const substrings = [];
  let chars = string.split('');

  chars.map((char, idx) => {
    substrings.push(chars.slice(0, idx + 1).join(''))
  })

  return substrings;
}
```