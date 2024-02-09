# Delete Vowels
Write a function that takes an array of strings and returns an array of the same string values, but with all vowels (a, e, i, o, u) removed.

Examples:
```js
removeVowels(['abcdefghijklmnopqrstuvwxyz']);         // ["bcdfghjklmnpqrstvwxyz"]
removeVowels(['green', 'YELLOW', 'black', 'white']);  // ["grn", "YLLW", "blck", "wht"]
removeVowels(['ABC', 'AEIOU', 'XYZ']);                // ["BC", "", "XYZ"]
```

## Solution
```js
function removeVowels(stringArray) {
  const VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  return stringArray.map(string => string.split('').map(char => {
    if (VOWELS.includes(char)) {
      return '';
    } else {
      return char;
    }
  }).join(''));
}
```

## Further Exploration
The current solution uses the transformation list processing strategy to remove the vowels from the strings. Reimplement the solution using a regex-based approach.
```js
function removeVowels(array) {
  return array.map((string) => string.replace(/[aeiou]/ig, ''));
}
```