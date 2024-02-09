# Array and String Reverse
In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method in the following two ways:

- It should accept either a string or an array as an argument.
- It should return a new string or array.

Examples:
```js
function reverse(inputForReversal) {
  // ...
}

reverse('Hello');           // "olleH"
reverse('a');               // "a"
reverse([1, 2, 3, 4]);      // [4, 3, 2, 1]
reverse([]);                // []

const array = [1, 2, 3];
reverse(array);             // [3, 2, 1]
array;                      // [1, 2, 3]
```

## Solution
```js
function reverse(input) {
  let reversedInput;
  let length = input.length;

  if (Array.isArray(input)) {
    reversedInput = [];
    for (let i = (length - 1); i >= 0; i--) {
      reversedInput.push(input[i]);
    }
  } else {
    reversedInput = '';
    for (let i = (length - 1); i >= 0; i--) {
      reversedInput += input[i];
    }
  }

  return reversedInput;
}
```

Alternative Solution:
```js
function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArray(inputForReversal);
  } else {
    return reverseString(inputForReversal);
  }
}

function reverseArray(inputForReversal) {
  const reversed = [];
  const length = inputForReversal.length;

  for (let i = 0; i < length; i += 1) {
    reversed[length - 1 - i] = inputForReversal[i];
  }

  return reversed;
}

function reverseString(inputForReversal) {
  const stringArray = inputForReversal.split('');
  return reverseArray(stringArray).join('');
}
```