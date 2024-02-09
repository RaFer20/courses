Write a function that takes two sorted arrays as arguments and returns a new array that contains all the elements from both input arrays in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Examples:
```js
merge([1, 5, 9], [2, 6, 8]);      // [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]);         // [1, 1, 2, 2, 3]
merge([], [1, 4, 5]);             // [1, 4, 5]
merge([1, 4, 5], []);             // [1, 4, 5]
```

# Problem
write a function that merges the input sorted arrays returns an array of sorted elements
cannot sort the result array, push elements in the correct order

# Examples / Test Cases
```js
merge([1, 5, 9], [2, 6, 8]);      // [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]);         // [1, 1, 2, 2, 3]
merge([], [1, 4, 5]);             // [1, 4, 5]
merge([1, 4, 5], []);             // [1, 4, 5]
merge([1, 2, 3], [1, 4, 5])      // [1, 1, 2, 3, 4, 5]
```

# Data Structures
Array

# Algorithm
Initialize two variables to 0, `idxA` and `idxB`
Initialize two variables to the lengths of the input arrays, `stopA` and `stopB`
Initialize a `result` empty array

Start a while loop, keep iterating until `idxA === stopA && idxB === stopB` 
- if arr1[idxA] < arr2[idxB] push arr1[idxA] to `result`, increment `idxA`
- if arr1[idxA] > arr2[idxB] push arr2[idxB] to `result`, increment `idxB`
- else push arr1[idxA] to `result`, increment `idxA`

start two while loops to handle any remaining elements on an array
return result
# Code
```js
function merge(arr1, arr2) {
  let idxA = 0;
  let idxB = 0;
  const stopA = arr1.length;
  const stopB = arr2.length;
  const result = [];

  while (idxA < stopA && idxB < stopB) {
    if (arr1[idxA] <= arr2[idxB]) {
      result.push(arr1[idxA]);
      idxA += 1;
    } else if (arr1[idxA] > arr2[idxB]) {
      result.push(arr2[idxB]);
      idxB += 1;
    } 
  }

  while (idxA < stopA) {
    result.push(arr1[idxA]);
    idxA += 1;
  }

  while (idxB < stopB) {
    result.push(arr2[idxB]);
    idxB += 1;
  }

  return result;
}
```

Alternative:
```js
function merge(array1, array2) {
  const copy1 = array1.slice();
  const copy2 = array2.slice();
  const result = [];

  while (copy1.length > 0 && copy2.length > 0) {
    result.push(copy1[0] <= copy2[0] ? copy1.shift() : copy2.shift());
  }

  return result.concat(copy1.length === 0 ? copy2 : copy1);
}
```