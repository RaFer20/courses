# Clean Up the Words
Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (i.e., the result string should never have consecutive spaces).

Example:
```js
cleanUp("---what's my +*& line?");    // " what s my line "
```

## Solution
```js
function checkIfLowerCase(char, alphabet) {
  let check = alphabet.includes(char) ? true : false;
  return check;
}

function checkIfUpperCase(char, alphabet) {
  let check = alphabet.includes(char.toLowerCase()) ? true : false;
  return check;
}
function cleanUp(string) {
  const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
  let newString = '';

  for (let i = 0; i < string.length; i++) {
    if (checkIfLowerCase(string[i], ALPHABET) || checkIfUpperCase(string[i], ALPHABET)) {
      newString += string[i];
    } else if (newString.charAt(newString.length - 1) !== ' '){
      newString += ' ';
    }
  }
  return newString;
}
```

Alternative Solution:
```js
function cleanUp(text) {
  let cleanText = '';

  for (let idx = 0; idx < text.length; idx += 1) {
    if (isLowerCaseLetter(text[idx]) || isUpperCaseLetter(text[idx])) {
      cleanText += text[idx];
    } else if (idx === 0 || lastChar(cleanText) !== ' ') {
      cleanText += ' ';
    }
  }

  return cleanText;
}

const lastChar = (text) => text[text.length - 1];

const isLowerCaseLetter = (char) => char >= 'a' && char <= 'z';

const isUpperCaseLetter = (char) => char >= 'A' && char <= 'Z';
```