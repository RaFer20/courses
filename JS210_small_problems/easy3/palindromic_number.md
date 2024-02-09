# Palindromic Number
Write a function that returns true if its integer argument is palindromic, or false otherwise. A palindromic number reads the same forwards and backwards.

Examples:
```js
isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true
```

## Solution
```js
function isPalindromicNumber(number) {
  return number === Number(String(number).split('').reverse().join(''));
}
```