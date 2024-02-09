# Find Missing Numbers
Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument.

Examples:
```js
missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]);                    // []
missing([1, 5]);                          // [2, 3, 4]
missing([6]);                             // []
```


## Solution
```js
function missing(arr) {
  let missingArr = [];

  for (let n = (arr[0] + 1); n < arr[arr.length - 1]; n++) {
    if (arr.includes(n)) {
      continue;
    }
    missingArr.push(n);
  }

  return missingArr;
}
```

Alternative:
```js
function missing(array) {
  let result = [];
  let start = array[0] + 1;
  let end = array[array.length - 1];

  for (let integer = start; integer < end; integer += 1) {
    if (array.indexOf(integer) === -1) {
      result.push(integer);
    }
  }

  return result;
}
```