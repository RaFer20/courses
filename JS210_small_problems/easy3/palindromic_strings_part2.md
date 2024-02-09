# Palindromic Strings Part 2
Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise. This time, however, your function should be case-insensitive, and should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the isPalindrome function you wrote in the previous exercise.

Examples:
```js
isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false
```

## Solution
```js
function reverseString(string) {
  return string = string.split('').reverse().join('');
}

function isPalindrome(string) {
  return string === reverseString(string);
}

function isRealPalindrome(string) {
  const validCharacters = 'abcdefghijklmnopqrstuvwxyz123456789'.split('');
  // alternative [...'abcdefghijklmnopqrstuvwxyz123456789'];
  string = string.toLowerCase();
  let newString = '';

  for (let i = 0; i < string.length; i++) {
    if (!validCharacters.includes(string[i])) {
      continue;
    }
    newString += string[i];
  }

  return isPalindrome(newString);
}
```

Alternative:
```js
function isRealPalindrome(string) {
  string = removeNonLetterNumbers(string.toLowerCase());
  return isPalindrome(string);
}

function removeNonLetterNumbers(string) {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (isLetter(string[i]) || isNumber(string[i])) {
      result += string[i];
    }
  }

  return result;
}

function isLetter(char) {
  return char >= 'a' && char <= 'z';
}

function isNumber(char) {
 return char >= '0' && char <= '9';
}
```