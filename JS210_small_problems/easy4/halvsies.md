# Halvsies
Write a function that takes an array as an argument and returns an array that contains two elements, each of which is an array. Put the first half of the original array elements in the first element of the return value, and put the second half in the second element. If the original array contains an odd number of elements, place the middle element in the first half array.

Examples:
```js
halvsies([1, 2, 3, 4]);       // [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]);    // [[1, 5, 2], [4, 3]]
halvsies([5]);                // [[5], []]
halvsies([]);                 // [[], []]
```


## Solution
```js
function halvsies (array) {
  const middle = array.length % 2 === 0 ? array.length / 2 : Math.ceil(array.length / 2)
  const firstHalf = [];
  const secondHalf = [];

  for (let i = 0; i < array.length; i++) {
    if (i < middle) {
      firstHalf.push(array[i]);
    } else {
      secondHalf.push(array[i]);
    }
  }

  return [firstHalf, secondHalf];
}
```

Alternative:
```js
function halvsies(array) {
  const half = Math.ceil(array.length / 2);
  const firstHalf = array.slice(0, half);
  const secondHalf = array.slice(half);

  return [firstHalf, secondHalf];
}
```