A 3x3 matrix can be represented by an array of arrays: an outer array containing three subarrays that each contain three elements. For example, the 3x3 matrix shown below:
```js
1  5  8
4  7  2
3  9  6
```

is represented by the following array of arrays:
```js
const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];
```

The transpose of a 3x3 matrix is the matrix that results from exchanging the rows and columns of the original matrix. For example, the transposition of the matrix shown above is:
```js
1  4  3
5  7  9
8  2  6
```

Write a function that takes an array of arrays that represents a 3x3 matrix and returns the transpose of the matrix. You should implement the function on your own, without using any external libraries.

Take care not to modify the original matrix — your function must produce a new matrix and leave the input matrix array unchanged.

Examples:
```js
const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
```

# Problem
Input: matrix
Output: transposed matrix

# Examples/Test Cases
```js
1 2 3 -> 1 4 7
4 5 6 -> 2 5 8
7 8 9 -> 3 6 9
```
```js
const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];
const newMatrix = transpose(matrix);
console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

const anotherMatrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

const anotherNewMatrix = transpose(anotherMatrix);
console.log(anotherNewMatrix); // [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
console.log(anotherMatrix);    // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

# Data Structures
Array

# Algorithm
initialize an array of arrays with 3 empty arrays `[[], [], []]` `transposed`
start a for loop, `i` will represent the location in the rows of the input matrix
start a nested for loop, `j` will represent the columns of the input matrix
- iterate over the first element (`i`) on each column (`j`) and push it to `transposed[i]`
when we break from both loops return transposed

# Code
```js
function transpose(matrix) {
  const transposed = [];

    for (let row = 0; row < matrix[0].length; row += 1) {
    transposed.push([]);
  }

  for (let i = 0; i < matrix.length; i += 1) {
    for (let j = 0; j < matrix.length; j += 1) {
      transposed[i].push(matrix[j][i]);
    }
  }

  return transposed;
}
```

Alternative:
```js
function transpose(matrix) {
  const transposed = [];
  const newRowsCount = matrix[0].length;

  for (let rowIdx = 0; rowIdx < newRowsCount; rowIdx += 1) {
    transposed.push([]);
  }

  for (let rowIdx = 0; rowIdx < matrix.length; rowIdx += 1) {
    for (let colIdx = 0; colIdx < matrix[rowIdx].length; colIdx += 1) {
      transposed[colIdx].push(matrix[rowIdx][colIdx]);
    }
  }

  return transposed;
}
```