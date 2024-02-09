Write a function that rotates the last `n` digits of a `number`. For the rotation, rotate by one digit to the left, moving the first digit to the end.

Examples:
```js
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
```

# Problem
Input: 2 integers, number to be rotated and digits to rotate
output: rotated number

Rotate the last `n` digits of the number provided

# Examples/Test Cases
```js
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
```

# Data Structures
digits -> string -> array and back

# Algorithm
Turn the input number into a string and split it into two arrays
- the part that will remain the same (index < (length - n))
- the digits that will be rotated (index >= (length - n))
rotate the second array (using our `rotateArray` function) and concat it to the first
join the array and convert it into a number then return it


# Code
```js
function rotateArray(array) {
  if (!Array.isArray(array)) {
    return;
  }

  if (array.length === 0) {
    return [];
  }

  return array.slice(1).concat(array[0]);
}

function rotateRightmostDigits(digits, n) {
  const digitsArr = String(digits).split('');
  const remain = digitsArr.filter((num, idx) => idx < (digitsArr.length - n));
  const rotate = digitsArr.filter((num, idx) => idx >= (digitsArr.length - n)); 
  let result = remain.concat(rotateArray(rotate));

  return Number(result.join(''))
}
```

Alternative:
```js
function rotateRightmostDigits(number, n) {
  const numberString = String(number);
  const firstPart = numberString.slice(0, numberString.length - n);
  const secondPart = numberString.slice(numberString.length - n);
  const resultString = firstPart + rotateString(secondPart);

  return Number(resultString);
}

function rotateString(string) {
  return string.slice(1) + string[0];
}
```