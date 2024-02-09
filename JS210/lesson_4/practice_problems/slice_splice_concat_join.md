1. Write a function named `slice` that accepts three arguments: an Array, a start index, and an end index. The function should return a new Array that contains values from the original Array starting with the value at the starting index, and including all values up to but not including the end index. Do not modify the original Array.

You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.
```js
slice([1, 2, 3, 4, 5], 0, 2);                      // [ 1, 2 ]
slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3);  // [ 'b', 'c' ]
```

Solution:
```js
const push = (array, value) => {
  array[array.length] = value;
  return array.length;
};

function slice(arr, start, end) {
  let newArr = [];
  for (let i = start; i < end; i++) {
    push(newArr, arr[i]);
  }

  return newArr;
}
```

2. Write a function named `splice` that accepts three arguments: an Array, a start index, and the number of values to remove. The function should remove values from the original Array, starting with the start index and removing the specified number of values. The function should return the removed values in a new Array.

You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.

```js
let count = [1, 2, 3, 4, 5, 6, 7, 8];
splice(count, 2, 5);                   // [ 3, 4, 5, 6, 7 ]
count;                                 // [ 1, 2, 8 ]
```

Solution:
```js
const push = (array, value) => {
  array[array.length] = value;
  return array.length;
};

function splice(array, begin, amount) {
  let removedValues = [];
  for (let index = begin; index < array.length; index += 1) {
    if (index < begin + amount) {
      push(removedValues, array[index]);
    }

    array[index] = array[index + amount];
  }

  array.length = array.length - removedValues.length;
  return removedValues;
}
```

3. Write a function named `concat` that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.

You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.
```js
concat([1, 2, 3], [4, 5, 6]);       // [ 1, 2, 3, 4, 5, 6 ]
```

Solution:
```js
const push = (array, value) => {
  array[array.length] = value;
  return array.length;
};

function concat(firstArr, secondArr) {
  let newArr = [];
  for (let i = 0; i < firstArr.length; i++) {
    push(newArr, firstArr[i]);
  }

  for (let i = 0; i < secondArr.length; i++) {
    push(newArr, secondArr[i]);
  }

  return newArr;
}
```

4. Write a function named `join` that accepts two arguments: an Array and a String. The function should coerce each value in the Array to a String, and then join those values together using the second argument as a separator. You may assume that a separator will always be passed.

You can call the `String` function on any JavaScript value to get its String representation.
```js
join(['bri', 'tru', 'wha'], 'ck ');       // 'brick truck wha'
join([1, 2, 3], ' and ');                 // '1 and 2 and 3'
```

Solution:
```js
function join(array, string) {
  let newString = '';
  for (let i = 0; i < array.length; i++) {
    newString += String(array[i])

    if (i < array.length - 1) {
      newString += string
    }
  }

  return newString;
}
```