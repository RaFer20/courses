What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();
```

`This is local`, in this case `console.log` will search for the variable from the scope it is being referenced. Here the global `myVar` is also being shadowed within the function's body by the local `myVar`.