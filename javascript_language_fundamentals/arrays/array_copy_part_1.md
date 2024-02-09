# Array Copy Part 1
Read through the code shown below. What does it log to the console at lines 6 and 10?

```js
let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myArray);
console.log(myOtherArray);

myArray = [1, 2];
console.log(myArray);
console.log(myOtherArray);
```


## Solution
```js
[1, 2, 3]
[1, 2, 3]

[1, 2]
[1, 2, 3]
```

`myArray` and `myOtherArray` reference the same object in memory at first so the `pop()` method affects them both.
After that we reassign `myArray` to a new array, which does not affect `myOtherArray` in any way.