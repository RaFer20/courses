# Sum of Digits
Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this without using for, while, or do...while loops - instead, use a series of method calls to perform the sum.

Examples:
```js
sum(23);           // 5
sum(496);          // 19
sum(123456789);    // 45
```

## Solution
```js
function sum(number) {
  let numArray = String(number).split('').map((num) => Number(num));
  return numArray.reduce((total, num) => total + num);
}
```