# Swap Case
Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

Examples:
```js
swapCase('CamelCase');              // "cAMELcASE"
swapCase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"
```

## Solution
```js
function swapCase(string) {
  let swapped = '';

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === string[i].toUpperCase()) {
      swapped += string[i].toLowerCase();
    } else if ((string[i] === string[i].toLowerCase())) {
      swapped += string[i].toUpperCase();
    } else {
      swapped += string[i];
    }
  }

  return swapped;
}
```

Alternative:
```js
function swapCase(string) {
  return string.split('').map(char => {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}
```