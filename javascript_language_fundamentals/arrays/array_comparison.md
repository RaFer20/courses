# Array Comparison
The array comparison function that we implemented in the Arrays lesson (Alternate link if the previous link doesn't work) implicitly assumed that when comparing two arrays, any matching values must also have matching index positions. The objective of this exercise is to reimplement the function so that two arrays containing the same values—but in a different order—are considered equal. For example, [1, 2, 3] === [3, 2, 1] should return true.

Examples:
```js
function areArraysEqual(array1, array2) {
  // ...
}

areArraysEqual([1, 2, 3], [1, 2, 3]);                  // true
areArraysEqual([1, 2, 3], [3, 2, 1]);                  // true
areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']);      // true
areArraysEqual(['1', 2, 3], [1, 2, 3]);                // false
areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]);            // true
areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]);            // false
areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]);            // false
areArraysEqual([1, 1, 2], [1, 2, 2]);                  // false
areArraysEqual([1, 1, 1], [1, 1]);                     // false
areArraysEqual([1, 1], [1, 1]);                        // true
areArraysEqual([1, '1'], ['1', 1]);                    // true
```

## Solution
```js
function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) {
    return false;
  }

  let array2Copy = array2.slice();
  for (let i = 0; i < array1.length; i += 1) {
    let index = array2Copy.indexOf(array1[i]);
    if (index >= 0) {
      array2Copy.splice(index, 1);
    } else {
      return false;
    }
  }

  return true;
}
```