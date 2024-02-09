# Array Pop and Push
In this exercise, you will implement your own version of two Array methods: `Array.prototype.pop` and `Array.prototype.push`. The `pop` method removes the last element from an array and returns that element. If `pop` is called on an empty array, it returns undefined. The `push` method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.

Examples:
```js
// pop
const array1 = [1, 2, 3];
pop(array1);                        // 3
console.log(array1);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
push(array2, 4, 5, 6);              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0
```

## Solution
```js
function pop(array) {
  const poppedElement = array[array.length - 1];
  array.splice(array.length - 1);

  return poppedElement;
}


function push(arr, ...args) {
  for (let argIndex = 0; argIndex < args.length; argIndex++) {
      arr[arr.length] = args[argIndex];
  }

  return arr.length;
}
```

## Further Exploration
The current solution for pop uses the Array.prototype.splice method. Can you reimplement the pop function without using the splice method?
```js
function pop(arr) {
  if (Array.isArray(arr) && arr.length) {
    let removedElement = arr[arr.length - 1]
    arr.length = (arr.length - 1)
    return removedElement;
  }

  return undefined;
}

// OR

function pop(array) {
  const arrayCopy = [];

  for (let i = 0; i < array.length; i += 1) {
    arrayCopy[i] = array[i];
  }

  let poppedElement = array[array.length - 1];
  array.length = 0;
  for (let i = 0; i < arrayCopy.length - 1; i += 1) {
    array.push(arrayCopy[i]);
  }

  return poppedElement;
}
```