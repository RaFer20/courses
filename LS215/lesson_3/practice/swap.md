# Problem Description
Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

# Provided Test Cases
```js
function swap(str) {
  // ...
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
```

# Understanding the Problem
Input: String
Ouput: String with letters and numbers swapped

If an empty string is provided return an empty string
The string may contain non-alphanumeric characters, leave those in place



# Examples / Test Cases
```js
console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("") === ""); // true
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("123-4a#b$") === "ab3-41#2$"); // true
```

# Data Structure
Array of characters

# Algorithm

initialize helper functions to find out if a character is alphabetic or numeric

Swap()
if input is an empty string return an empty string (guard clause)
split input string into characters `chars`
make a new array by filtering only numbers `nums`
make a new array by filtering only letters `letters`
map through the array of characters `chars`
- if char is a letter and `nums` is not empty shift out a character from `nums`
- if char is a number and `letters` is not empty shift out a character from `letters`
- otherwise just return the character as is
join the transformed array

# Code
```js
const isLetter = char => /[a-z]/i.test(char);
const isDigit = char => /\d/i.test(char);

function swap(str) {
  if (str.length === 0) return str;

  const chars = str.split("");
  const letters = chars.filter(isLetter);
  const nums = chars.filter(isDigit);

  if (letters.length === 0 || nums.length === 0) return str;

  const swapped = chars.map(char => {
    if (isLetter(char) && nums.length > 0) return nums.shift();
    else if (isDigit(char) && letters.length > 0) return letters.shift();

    return char;
  });

  return swapped.join("");
}
```