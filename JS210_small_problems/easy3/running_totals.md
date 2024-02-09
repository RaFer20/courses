# Running Totals
Write a function that takes an array of numbers and returns an array with the same number of elements, but with each element's value being the running total from the original array.

Examples:
```js
runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []
```

## Solution
```js
function runningTotal(array) {
  const resultArray = [];
  let sum = 0;

  for (let i = 0; i < array.length; i += 1) {
    sum += array[i];
    resultArray.push(sum);
  }

  return resultArray;
}
```

## Further Exploration
Can you rewrite the solution using the Array.prototype.map method? What types of problems do you think are well-suited for the Array.prototype.map method?
```js
function runningTotal(array) {
  let total = 0;
  return array.map((num) => total += num);
}
```