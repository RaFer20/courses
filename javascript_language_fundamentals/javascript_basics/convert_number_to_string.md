# Convert a Number to a String
In the previous two exercises, you developed functions that convert simple numeric strings to signed integers. In this exercise and the next, you're going to reverse those functions.

You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples:
```js
integerToString(4321);      // "4321"
integerToString(0);         // "0"
integerToString(5000);      // "5000"
```

## Solution
```js
const Digits = {
  0: '0', 1: '1', 2: '2', 3: '3', 4: '4',
  5: '5', 6: '6', 7: '7', 8: '8', 9: '9',
};

function integerToString(num) {
  if (num === 0) {
    return '0';
  }
  let result = '';
  let iterations = countDigits(num);

  for (let i = 1; i <= iterations; i++) {
    result = Digits[num % 10] + result;
    num = Math.floor(num / 10)
  }

  return result;
}

function countDigits(num) {
  let count = 0;

  while (num > 0) {
    num = Math.floor(num/10);
    count++;
  }

  return count;
}
```

Alternative:
```js
const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(number) {
  let result = '';

  do {
    let remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0);

  return result;
}
```