# Basic Array Uses
In the problems below, we ask you to write functions that work with Arrays. You may use Array's index access (`[]`), the `length` property, and any Array Methods you need.

1. Write a function that returns the first element of an array passed in as an argument.
```js
function firstElementOf(arr) {
  // …
}

firstElementOf(['U', 'S', 'A']);  // returns "U"
```

Solution:
```js
function firstElementOf(array) {
  return array[0];
}

// or

const firstElementOf = (array) => {return array[0]}
```


2. Write a function that returns the last element of an array passed in as an argument.
```js
function lastElementOf(arr) {
  // …
}

lastElementOf(['U', 'S', 'A']);  // returns "A"
```

Solution:
```js
function lastElementOf(array) {
  return array[array.length - 1]
}
```


3. Write a function that accepts two arguments, an array and an integer index position, and returns the element at the given index. What happens if the index is greater than the length of the array? What happens if it is a negative integer?
```js
function nthElementOf(arr, index) {
  // …
}

let digits = [4, 8, 15, 16, 23, 42];

nthElementOf(digits, 3);   // returns 16
nthElementOf(digits, 8);   // what does this return?
nthElementOf(digits, -1);  // what does this return?
```

Solution:
```js
function nthElementOf(arr, idx) {
  return arr[idx]
}

nthElementOf(digits, 3);   // returns 16
nthElementOf(digits, 8);   // returns undefined
nthElementOf(digits, -1);  // returns undefined
```

4. Can we insert data into an array at a negative index? If so, why is this possible?
Yes, all arrays are objects in JavaScript. 
**The added element becomes part of the "array object," but it isn't properly one of the array elements. The digits.length property, for instance, remains unchanged.**

5. Write a function that accepts an array as the first argument and an integer value, `count`, as the second. It should return a new array that contains the first `count` elements of the array.
```js
function firstNOf(arr, count) {
  // …
}

let digits = [4, 8, 15, 16, 23, 42];
firstNOf(digits, 3);    // returns [4, 8, 15]
```

Solution:
```js
function firstNOf(arr, count) {
  return arr.slice(0, count);
}
```

6. Write a function like the previous one, except this time return the last `count` elements as a new array.
```js
function lastNOf(arr, count) {
  // …
}

let digits = [4, 8, 15, 16, 23, 42];
lastNOf(digits, 3);    // returns [16, 23, 42]
```

```js
function lastNOf(arr, count) {
  return arr.slice(-count);
}

// or

function lastNOf(arr, count) {
  return arr.slice(arr.length - count);
}
```

7. Using the function from the previous problem, What happens if you pass a count greater than the length of the array? How can you fix the function so it returns a new instance of the entire array when count is greater than the array length?

When you pass a count greater than the array length, the arithmetic in the function becomes a negative value. slice interprets a negative value as a position relative to the end of the array. Thus, if we pass a count of 9 with our digits array, lastNOf calls slice with an argument of -3. slice thus returns the final three elements of digits.

To change this behavior, we can calculate the starting position, then adjust it to 0 if it is negative. We can pass the resulting value to slice, which returns a new copy of the array when the value is 0.

Solution:
```js
function lastNOf(arr, count) {
  let startingPosition = count > arr.length ? 0 : (arr.length - count)
  return arr.slice(startingPosition);
}
```

8. Write a function that accepts two arrays as arguments and returns an array with the first element from the first array and the last element from the second array.
```js
function endsOf(beginningArr, endingArr) {
  // …
}

endsOf([4, 8, 15], [16, 23, 42]);  // returns [4, 42]
```

Solution:
```js
function endsOf(firstArr, secondArr) {
  let newArr = [];
  newArr.push(firstArr[0])
  newArr.push(secondArr[secondArr.length - 1])
  return newArr
}

// or

function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length - 1]];
}
```