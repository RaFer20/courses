A featured number (something unique to this exercise) is an odd number that is a multiple of `7`, with all of its digits occurring exactly once each. For example, `49` is a featured number, but `98` is not (it is not odd), `97` is not (it is not a multiple of `7`), and `133` is not (the digit `3` appears twice).

Write a function that takes an integer as an argument and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is `9876543201`.

Examples:
```js
featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."
```

# Problem
Write a function that returns the next number larger than the input that is an odd number, is a multiple of `7` and it's digits only occur once.
The largest possible featured number is `9876543201`
If there is no possible next featured number, return an error message.
Input: Integer
Output: next featured number or an error message (integer or string)

# Examples/Test Cases
```js
featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."
```

# Data Structures
String

# Algorithm
start a for loop with i = n + 1 and keep looping until highest possible number (`i <= 9876543201`)
- if number meets the requirements return the number
- return error message if loop ends

helper function meetsRequirements()
check if number is odd, and is multiple of 7
turn to string and check if every character only appears once
return boolean value

# Code
```js
function featured(n) {
  for (let i = (n + 1); i <= 9876543201; i += 1) {
    if (meetsRequirements(i)) {
      return i;
    }
  }
  return "There is no possible number that fulfills those requirements.";
}

function meetsRequirements(number) {
  if (number % 2 === 1 && number % 7 === 0) {
    let numString = String(number);
    if (numString.length === new Set(numString.match(/\d/g)).size) {
      return true;
    }
  } 
  return false;
}
```

Alternative:
```js
function featured(number) {
  const MAX_FEATURED = 9876543201;
  let featuredNum = toOddMultipleOf7(number);

  do {
    if (allUnique(featuredNum)) {
      return featuredNum;
    }

    featuredNum += 14;
  } while (featuredNum <= MAX_FEATURED);

  return 'There is no possible number that fulfills those requirements.';
}

function toOddMultipleOf7(number) {
  do {
    number += 1;
  } while (number % 2 === 0 || number % 7 !== 0);

  return number;
}

function allUnique(number) {
  let digits = String(number).split('');
  let seen = {};

  for (let idx = 0; idx < digits.length; idx += 1) {
    if (seen[digits[idx]]) {
      return false;
    }

    seen[digits[idx]] = true;
  }

  return true;
}
```