# Convert a Signed Number to a String
In the previous exercise, you reimplemented a function that converts non-negative numbers to strings. In this exercise, you're going to extend that function by adding the ability to represent negative numbers.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. You may, however, use the integerToString function from the previous exercise.

Examples:
```js
signedIntegerToString(4321);      // "+4321"
signedIntegerToString(-123);      // "-123"
signedIntegerToString(0);         // "0"
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

function signedIntegerToString(num) {
  let negative = false;
    if (num === 0) {
    return '0';
  } else if (num < 0) {
    num = Math.abs(num);
    negative = true;
  }
  let result = '';

  result = integerToString(num);
  if (negative) {
    result = '-' + result
  } else {
    result = '+' + result
  }

  return result;
}
```

Alternative:
```js
function signedIntegerToString(number) {
  if (number < 0) {
    return ('-' + integerToString(-number));
  } else if (number > 0) {
    return ('+' + integerToString(number));
  } else {
    return integerToString(number);
  }
}
```