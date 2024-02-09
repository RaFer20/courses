1. Write a function named `push` that accepts two arguments: an Array and any other value. The function should append the second argument to the end of the Array, and return the new length of the Array.
```js
let count = [0, 1, 2];
push(count, 3);         // 4
count;                  // [ 0, 1, 2, 3 ]
```

Solution:
```js
const push = (array, value) => {
  array[array.length] = value;
  return array.length;
};
```

2.  Write a function named `pop` that accepts one argument: an Array. The function should remove the last element from the array and return it.
```js
let count = [1, 2, 3];
pop(count);             // 3
count;                  // [ 1, 2 ]
```

Solution:
```js
const pop = array => {
  if (array.length === 0) {
    return undefined;
  }

  let newLength = array.length - 1;
  let value = array[newLength];
  array.length = newLength;
  return value;
};
```

3. Write a function named `unshift` that accepts two arguments: an Array and a value. The function should insert the value at the beginning of the Array, and return the new `length` of the array. You will need a for loop for this problem.
```js
let count = [1, 2, 3];
unshift(count, 0);      // 4
count;                  // [ 0, 1, 2, 3 ]
```

Solution:
```js
let unshift = function(array, value) {
  for (let index = array.length; index > 0; index -= 1) {
    array[index] = array[index - 1];
  }

  array[0] = value;
  return array.length;
};
```


4. Write a function named `shift` that accepts one argument: an Array. The function should remove the first value from the beginning of the Array and return it.
```js
let count = [1, 2, 3];
shift(count);           // 1
count;                  // [ 2, 3 ]
```

Solution:
```js
let shift = function(array) {
  let first = array[0];

  if (array.length === 0) {
    return undefined;
  }

  for (let index = 0; index < array.length - 1; index += 1) {
    array[index] = array[index + 1];
  }

  array.length = array.length - 1;
  return first;
}
```