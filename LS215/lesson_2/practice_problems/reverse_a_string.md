# Reverse a String
Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.

Examples
```js
function reverse(string) {
  // ...
}

reverse('hello');                  // returns "olleh"
reverse('The quick brown fox');    // returns "xof nworb kciuq ehT"
```

## Solution
```js
function reverse(string) {
  return string.split('').reverse().join('');
}
```

Alternative:
```js
function reverse(string) {
  let newString = '';
  for (let i = string.length - 1; i >= 0; i -= 1) {
    newString += string[i];
  }

  return newString;
}
```