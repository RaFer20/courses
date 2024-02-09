# Intermediate Array Uses
1. Write a function that creates and returns a new array from its array argument. The new array should contain all values from the argument array whose positions have an odd index.
```js
function oddElementsOf(arr) {
  // …
}

let digits = [4, 8, 15, 16, 23, 42];

oddElementsOf(digits);    // returns [8, 16, 42]
```

Solution:
```js
let digits = [4, 8, 15, 16, 23, 42];

function oddElementsOf(arr) {
  let oddArr = [];

  for (let i = 1; i < arr.length; i += 2) {
    if (i % 2 === 1) {
      oddArr.push(arr[i]);
    }
  }

  return oddArr;
}
```

2. Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.
Solution:
```js
function mirroredArray(arr) {
  let reversedArr = arr.slice(0).reverse();
  let mirroredArr = arr.concat(reversedArr);

  return mirroredArr;
}

// or
function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}
```

3. Use the array sort method to create a function that takes an array of numbers and returns a new array of the numbers sorted in descending order. Do not alter the original array.
```js
function sortDescending(arr) {
  // …
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]
```

Solution:
```js
function compareNum(a, b) {
  return a - b
}

function sortDescending(arr) {
  let newArr = arr.slice()
  return newArr.sort(compareNum).reverse();
}

// or
function sortDescending(arr) {
  let arrCopy = arr.slice();
  return arrCopy.sort((a, b) => b - a);
}
```


4. Write a function that takes an array of arrays as an argument, and returns a new array that contains the sums of each of the sub-arrays.
```js
function matrixSums(arr) {
  // …
}

matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]
```

Solution:
```js
function matrixSums(arr) {
  let sumArray = [];

  for (let i = 0; i < arr.length; i++) {
    sumArray.push(arr[i].reduce((accum, currVal) => accum + currVal, 0));
  }

  return sumArray;
}

// or
function matrixSums(arr) {
  let sums = [];
  let outerLen = arr.length;

  for (let mainIndex = 0; mainIndex < outerLen; mainIndex += 1) {
    let currentSum = 0;
    let innerLen = arr[mainIndex].length;
    for (let subIndex = 0; subIndex < innerLen; subIndex += 1) {
      currentSum += arr[mainIndex][subIndex];
    }

    sums.push(currentSum);
  }

  return sums;
}

matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]
```

5. Write a function that takes an array, and returns a new array with duplicate elements removed.
```js
function uniqueElements(arr) {
  // …
}

uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]);  // returns [1, 2, 4, 3, 5]
```

Solution:
```js
function uniqueElements(arr) {
  let uniqueArr = [];

  for (let i = 0; i < arr.length; i++) {
    if (uniqueArr.includes(arr[i])) {
      continue;
    }
    uniqueArr.push(arr[i]);
  }

  return uniqueArr;
}
```