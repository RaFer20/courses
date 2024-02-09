What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);
```

`7` Passing the variable `a` that is assigned a primitive value as an argument to a function, and consequently using it on any operation in the body of the function does not have any effect on the value assigned to `a`.