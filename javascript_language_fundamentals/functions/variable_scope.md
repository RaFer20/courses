What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);
```

`This is global` Since a declaration doesn't exist JavaScript binds myVar to be a "property" of the global object. 