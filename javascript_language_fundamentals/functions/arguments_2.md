What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
let a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);
```

`7` There are two separate `a` variables, one in the outer scope and one local to `myValue`. Reassigning the local variable `a` in `myValue` has no impact on the global variable `a`.