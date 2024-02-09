# Multiply All Pairs

Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.

You may assume that neither argument will be an empty array.

Example:
```js
multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]
```

## Solution
```js
function multiplyAllPairs(firstArray, secondArray) {
  const products = [];
  for (let i = 0; i < firstArray.length; i += 1) {
    for (let j = 0; j < secondArray.length; j += 1) {
      products.push(firstArray[i] * secondArray[j]);
    }
  }

  return products.sort((a, b) => a - b);
}
```

Alternative using `forEach`:
```js
function multiplyAllPairs(array1, array2) {
  const result = [];

  array1.forEach(number1 => {
    array2.forEach(number2 => {
      result.push(number1 * number2);
    });
  });

  return result.sort((a, b) => a - b);
}
```