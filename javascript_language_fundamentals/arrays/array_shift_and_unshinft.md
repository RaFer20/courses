# Array Shift and Unshift
In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods. These methods manipulate the contents of an array starting from the first index.

The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined. The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.

Examples:
```js
shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3

const testArray = [1, 2, 3];
shift(testArray);                // 1
testArray;                       // [2, 3]
unshift(testArray, 5);           // 3
testArray;                       // [5, 2, 3]
```

## Solution
```js
function shift(arr) {
  let shiftedElement = arr.splice(0, 1).pop();
  
  if (arr.length === 0) {
    return undefined;
  }
  
  return shiftedElement;
}

function unshift(arr, ...args) {
  for (let argIdx = 0; argIdx < args.length; argIdx++) {
    arr.splice(0, 0, args[argIdx]);
  }

  return arr.length;
}
```