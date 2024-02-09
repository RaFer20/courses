# Combining Arrays
Write a function that takes two arrays as arguments and returns an array containing the union of the values from the two. There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

Example:
```js
union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]
```


## Solution
```js
function union(firstArray, secondArray) {
  let combinedArray = [];

  for (let i = 0; i < arguments.length; i++) {
    for (let j = 0; j < arguments[i].length; j++) {
      if (combinedArray.includes(arguments[i][j])) {
        continue;
      }
      combinedArray.push(arguments[i][j]);
    }
  }

  return combinedArray;
}
```

Alternative 1:
```js
function copyNonDupsTo(resultArray, array) {
  array.forEach(value => {
    if (!resultArray.includes(value)) {
      resultArray.push(value);
    }
  });
}

function union(array1, array2) {
  const newArray = [];
  copyNonDupsTo(newArray, array1);
  copyNonDupsTo(newArray, array2);
  return newArray;
}
```

Alternative 2:
```js
function copyNonDupsTo(resultArray, array) {
  array.forEach(value => {
    if (!resultArray.includes(value)) {
      resultArray.push(value);
    }
  });
}

function union(...args) {
  const newArray = [];

  args.forEach(value => copyNonDupsTo(newArray, value));

  return newArray;
}
```