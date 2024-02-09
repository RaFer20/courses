# Array Copy Part 2
In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.

Here is the code from the previous exercise:
```js
let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);
```


## Solution
```js
const myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();

myArray.pop();
console.log(myArray);               // [1, 2, 3]
console.log(myOtherArray);          // [1, 2, 3, 4]

// OR
const myArray = [1, 2, 3, 4];
const myOtherArray = [];

for (let i = 0; i < myArray.length; i++) {
  myOtherArray.push(myArray[i])
}

myArray.pop();
console.log(myArray);               // [1, 2, 3]
console.log(myOtherArray);          // [1, 2, 3, 4]
```