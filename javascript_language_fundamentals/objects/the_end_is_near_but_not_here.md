# The End is Near but Not Here
The `penultimate` function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The `penultimate` function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.

Examples:
```js
function penultimate(string) {
  return string.split(' ')[-2];
}

penultimate('last word');                    // expected: "last"
penultimate('Launch School is great!');      // expected: "is"
```

## Solution
```js
function penultimate(string) {
  return string.split(' ')[string.split(' ').length - 2];
}

penultimate('last word');                    // expected: "last"
penultimate('Launch School is great!');      // expected: "is"
```

Alternative:
```js
function penultimate(string) {
  return string.split(' ').slice(-2, -1)[0];
}
```