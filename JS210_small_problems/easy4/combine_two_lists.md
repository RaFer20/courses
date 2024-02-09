# Combine Two Lists
Write a function that combines two arrays passed as arguments, and returns a new array that contains all elements from both array arguments, with each element taken in alternation.

You may assume that both input arrays are non-empty, and that they have the same number of elements.

Example:
```js
interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]
```


## Solution
```js
function interleave(firstArray, secondArray) {
  const combinedArray = [];

  for (let i = 0; i < firstArray.length; i++) {
    combinedArray.push(firstArray[i], secondArray[i])
  }

  return combinedArray;
}
```