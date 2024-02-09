As we saw in the previous exercises, a matrix can be represented by an array of arrays. For example, the 3x3 matrix shown below:
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

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:
```js
3  4  1
9  7  5
6  2  8
```

A 90-degree rotation of a non-square matrix is similar. For example, given the following matrix:
```js
3  4  1
9  7  5
```
its 90-degree rotation is:
```js
9  3
7  4
5  1
```

Write a function that takes an arbitrary MxN matrix, rotates it clockwise by 90-degrees as described above, and returns the result as a new matrix. The function should not mutate the original matrix.

Examples:
```js
const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]
```

# Problem
rotate the input matrix 90 degrees clockwise and return the result
return a new matrix, do not mutate the original
the amount of elements in the first row (the amount of columns) === the amount of rows in the new matrix

# Examples/Test Cases
```js
const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]
```

# Data Structures
Array

# Algorithm
Initialize a `rotated` empty array
push empty arrays into `rotated` equal to the amount of elements in the first nested array
start a for loop where `colIdx` === 0, increment it on every loop and iterate while `colIdx` < matrix[0].length
start a for loop where `rowIdx` === (matrix.length - 1), decrease row by 1 on every loop, iterate until row === 0
- push value at matrix[rowIdx][colIdx] to rotated[colIdx]
return rotated

# Code
```js
function rotate90(matrix) {
  const rotated = [];

  for (let row = 0; row < matrix[0].length; row += 1) {
    rotated.push([]);
  }

  for (let colIdx = 0; colIdx < matrix[0].length; colIdx += 1) {
    for (let rowIdx = (matrix.length - 1); rowIdx >= 0; rowIdx -= 1) {
      rotated[colIdx].push(matrix[rowIdx][colIdx]);
    }
  }

  return rotated
}
```

Alternative using reverse:
```js
function rotate90(matrix) {
  const rotated = [];
  const newRowsCount = matrix[0].length;

  for (let rowIdx = 0; rowIdx < newRowsCount; rowIdx += 1) {
    rotated.push([]);
  }

  for (let rowIdx = 0; rowIdx < matrix.length; rowIdx += 1) {
    for (let colIdx = 0; colIdx < matrix[rowIdx].length; colIdx += 1) {
      rotated[colIdx].push(matrix[rowIdx][colIdx]);
    }
  }

  for (let rowIdx = 0; rowIdx < newRowsCount; rowIdx += 1) {
    rotated[rowIdx].reverse();
  }

  return rotated;
}
```