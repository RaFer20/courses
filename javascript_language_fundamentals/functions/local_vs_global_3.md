What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);
```

`This is local`, the variable declared in line 1 in the global scope is being reassigned to a new value when `someFunction()` is called.