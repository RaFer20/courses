# Array Average
Write a function that takes one argument, an array containing integers, and returns the average of all the integers in the array, rounded down to the integer component of the average. The array will never be empty, and the numbers will always be positive integers.

Examples:
```js
average([1, 5, 87, 45, 8, 8]);       // 25
average([9, 47, 23, 95, 16, 52]);    // 40
```


## Solution
```js
function average(array) {
  return Math.floor(array.reduce((accum, currVal) => accum + currVal, 0) / array.length)
}
```

Alternative:
```js
function average(numbers) {
  let sum = 0;

  for (let idx = 0; idx < numbers.length; idx += 1) {
    sum += numbers[idx];
  }

  return Math.floor(sum / numbers.length);
}
```