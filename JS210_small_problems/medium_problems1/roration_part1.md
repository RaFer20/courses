Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

If the input is not an array, return undefined.
If the input is an empty array, return an empty array.
Review the test cases below, then implement the solution accordingly.
```js
rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
rotateArray([]);                       // []

// return `undefined` if the argument is not an array
rotateArray();                         // undefined
rotateArray(1);                        // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
array;                                 // [1, 2, 3, 4]
```

# Problem
Rotate the elements of the array once to the left, moving the first element to the last spot in the array.
The original array should not be mutated.
return undefined if the input is not an array
return an empty array if the input is an empty array

# Examples/Test Cases
```js
rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
rotateArray([]);                       // []

// return `undefined` if the argument is not an array
rotateArray();                         // undefined
rotateArray(1);                        // undefined
rotateArray({});                       // undefined

// the input array is not mutated
const array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
array;                                 // [1, 2, 3, 4]
```

# Data Structures
Array

# Algorithm
if input is not an array return `undefined`
if input is an empty array return an empty array `[]`
Create a shallow copy of the array `arrayCopy`
Shift the first element from the copy and push it back into the array
return the copied array.

# Code
```js
function rotateArray(array) {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return [];

  let arrayCopy = [...array];
  let firstElement = arrayCopy.shift()

  arrayCopy.push(firstElement)

  return arrayCopy
}
```

Alternative:
```js
function rotateArray(array) {
  if (!Array.isArray(array)) {
    return;
  }

  if (array.length === 0) {
    return [];
  }

  return array.slice(1).concat(array[0]);
}
```