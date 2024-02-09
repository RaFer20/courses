Take the number `735291` and rotate it by one digit to the left, getting `352917`. Next, keep the first digit fixed in place and rotate the remaining digits to get `329175`. Keep the first two digits fixed in place and rotate again to get `321759`. Keep the first three digits fixed in place and rotate again to get `321597`. Finally, keep the first four digits fixed in place and rotate the final two digits to get `321579`. The resulting number is called the maximum rotation of the original number.

Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the `rotateRightmostDigits` function from the previous exercise.

Examples:
```js
maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
```

# Problem
Rotate the number one digit to the left, keep the first digit in place then rotate the rest, keep going until only the final two digits get rotated. This is the `maximum rotation` of the original number
Input: number
Output: original number's maximum rotation

# Examples/Test Cases
```js
maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
```

# Data Structure
String

# Algorithm
Convert number to string
start a loop with `n` being equal to the length of the string
- use the `rotateRightmostDigits` function to rotate the string, using `n` to determine the digits
- save the result
- decrease n by 1
loop ends when `n < 2`
return Number(string)

# Code
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

function maxRotation(number) {
  let numString = String(number)

  for (n = numString.length; n > 1; n -= 1) {
    numString = rotateRightmostDigits(numString, n)
  }

  return Number(numString)
}
 
console.log(maxRotation(735291) === 321579);              // true
console.log(maxRotation(3) === 3);                        // true
console.log(maxRotation(35) === 53);                      // true
console.log(maxRotation(105) === 15);                     // true, leading 0 gets dropped
console.log(maxRotation(8703529146) === 7321609845);      // true
```

Alternative:
```js
function maxRotation(number) {
  for (let i = String(number).length; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i);
  }

  return number;
}
```