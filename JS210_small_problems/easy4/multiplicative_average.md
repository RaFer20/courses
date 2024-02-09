# Multiplicative Average
Write a function that takes an array of integers as input, multiplies all of the integers together, divides the result by the number of entries in the array, and returns the result as a string with the value rounded to three decimal places.

Examples:
```js
showMultiplicativeAverage([3, 5]);                   // "7.500"
showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"
```


## Solution
```js
function showMultiplicativeAverage(array) {
  return ((array.reduce((accum, currValue) => accum * currValue, 1)) / array.length).toFixed(3)
}
```

Alternative:
```js
function showMultiplicativeAverage(numbers) {
  let product = 1;

  for (let i = 0; i < numbers.length; i += 1) {
    product *= numbers[i];
  }

  return (product / numbers.length).toFixed(3);
}
```