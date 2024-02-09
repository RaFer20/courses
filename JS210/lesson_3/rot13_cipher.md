# Rot13 Cipher
Rot13 ("rotate by 13 places") is a letter-substitution cipher that translates a String into a new String:

For each character in the original String:

- If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet. Thus, `a` becomes `n`. If you reach the end of the alphabet, return to the beginning. Thus, `o` becomes `b`.
- Letter transformations preserve case. `A` becomes `N` while `a` becomes `n`.
- Don't modify characters that are not letters.
Write a Function, rot13, that takes a String and returns that String transformed by the rot13 cipher.
```js
console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
```

It's worth noting that rot13 applied twice results in the original string:
```js
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
Teachers open the door, but you must enter by yourself.
```
This happens since there are 26 characters in the modern English alphabet: 2 sets of 13.


## Solution
```js
const LETTERS = 'abcdefghijklmnopqrstuvwxyz';

function calculateIndex(char) {
  const Rotation = 13;
  let index = LETTERS.indexOf(char);
  let amountOfLetters = LETTERS.length;
  index = (index + Rotation) % amountOfLetters;
  return index;
}

function checkIfLowerCase(char) {
  let check = LETTERS.includes(char) ? true : false
  return check
}

function checkIfUpperCase(char) {
  let check = LETTERS.includes(char.toLowerCase()) ? true : false
  return check
}

function rot13(string) {
  let newString = '';

  for (let i = 0; i < string.length; i++) {
    let char = string[i];

    if (checkIfLowerCase(char)) {
      let index = calculateIndex(char);
      newString += LETTERS[index];
    } else if (checkIfUpperCase(char)) {
      let index = calculateIndex(char.toLowerCase());
      newString += LETTERS[index].toUpperCase();
    } else {
      newString += string[i];
    }
  }

  return newString
}
```
