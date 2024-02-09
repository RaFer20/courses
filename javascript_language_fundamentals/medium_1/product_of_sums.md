# Product of Sums
The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?
```js
function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}
```

## Solution
No, the initial value of `sum` in the `total` function is `undefined`, so every iteration evaluates to `NaN`.
A second issue is that there isn't an explicit return in the `total` function so it always returns undefined.


Corrrected version of the code snippet:
```js
function total(numbers) {
  let sum = 0;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  return sum;
}
```