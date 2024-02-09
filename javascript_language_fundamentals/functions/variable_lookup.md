What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();
```

`This is global` Here `console.log` will try to find `myVar` in the local scope, when it doesn't it will search the next outer scope for `myVar` and in this case it will find the variable declared in line 1.