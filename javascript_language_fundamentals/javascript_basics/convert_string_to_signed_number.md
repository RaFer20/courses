# Convert a String to a Signed Number
The previous exercise mimics the parseInt function to a lesser extent. In this exercise, you're going to extend that function to work with signed numbers.

Write a function that takes a string of digits and returns the appropriate number as an integer. The string may have a leading + or - sign; if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign, return a positive number.

You may assume the string will always contain a valid number.

Examples:
```js
stringToSignedInteger('4321');      // 4321
stringToSignedInteger('-570');      // -570
stringToSignedInteger('+100');      // 100
```


## Solution
```js
const DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function stringToSignedInteger(str) {
  let negative = false;
  let result = 0;
  if (str[0] === '+') {
    str = str.slice(1);
  } else if (str[0] === '-') {
    negative = true;
    str = str.slice(1);
  }

  result = stringToInteger(str);
  if (negative) {
    result = -result;
  }
  return result;
}

function stringToInteger(str) {
  let value = 0;
  const numbers = stringToNumbers(str);

  for (let i = 0; i < numbers.length; i += 1) {
    value = 10 * value + numbers[i];
  }

  return value;
}

function stringToNumbers(str) {
  const result = [];

  for (let i = 0; i < str.length; i += 1) {
    result.push(DIGITS[str[i]]);
  }

  return result;
}
```

Alternative:
```js
function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default:  return stringToInteger(string);
  }
}
```