# Array Concat Part 2
The concat function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the concat function to allow for the concatenation of two or more arrays or values.

Examples:
```js
concat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
concat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
concat([1, 2], ['three'], 4);               // [1, 2, "three", 4]
```

## Solution
```js
function concat(...args) {
  const newArray = [];

  for (let argIndex = 0; argIndex < args.length; argIndex += 1) {
    let currentArg = args[argIndex];
    if (Array.isArray(currentArg)) {
      let arraySize = currentArg.length;
      for (let arrayIndex = 0; arrayIndex < arraySize; arrayIndex += 1) {
        newArray[newArray.length] = currentArg[arrayIndex];
      }
    } else {
      newArray[newArray.length] = currentArg;
    }
  }

  return newArray;
}
```


(code below only works for 3 arguments)
```js
function concat(arr1, secondArg, thirdArg) {
  let newArray = [];

  for (let i = 0; i < arr1.length; i++) {
      newArray.push(arr1[i]);
  }

  if (Array.isArray(secondArg)) {
    for (let i = 0; i < secondArg.length; i++) {
      newArray.push(secondArg[i]);
    }
  } else {
    newArray.push(secondArg);
  }

  if (thirdArg) {
    console.log('test')
    return concat(newArray, thirdArg);
  }

  return newArray;
}
```