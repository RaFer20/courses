# Double Char Part 2
Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string. The function should not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

Examples:
```js
doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
```


## Solution
```js
const CONSONANTS = [...'bcdfghjklmnpqrstvwxyz']

function doubleConsonants(string) {
  let lowerCasedString = string.toLowerCase();
  console.log(lowerCasedString)
  let repeated = '';

  for (let i = 0; i < string.length; i++) {
    if (CONSONANTS.includes(lowerCasedString[i])) {
      repeated += string[i] + string[i];
    } else {
      repeated += string[i];
    }
  }

  return repeated;
}
```

Alternative:
```js
const CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
                  'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

function doubleConsonants(string) {
  const stringArray = [];

  for (let i = 0; i < string.length; i += 1) {
    stringArray.push(string[i]);
    if (CONSONANTS.includes(string[i].toLowerCase())) {
      stringArray.push(string[i]);
    }
  }

  return stringArray.join('');
}
```