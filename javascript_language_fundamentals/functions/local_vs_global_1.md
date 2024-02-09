What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);
```

`This is global`, The variable on line 1 is declared on the global scope while the one in line 4 is local to `someFunction()`.