```js
let myName = 'Bob';
const saveName = myName;
myName = 'Alice';
console.log(myName, saveName);
```
What does this code log to the console? Think about it for a moment before continuing.

If you said that this code logged:
```js
Alice Bob
```
you would be 100% correct, and the answer should come as no surprise. Now let's look at something slightly different:
```js
const myName = 'Bob';
const saveName = myName;
myName.toUpperCase();
console.log(myName, saveName);
```

What does this code log? Can you explain these results?

Solution:
```js
Bob Bob
```
We call `toUpperCase()` on `myName`, which returns a new string with `myName` uppercased but `myName` is immutable.