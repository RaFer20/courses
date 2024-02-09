Go over the following program.
What does it log to the console at lines 7, 11, 15, and 19? Is it what you expected? Why or why not?
```js
const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}
```

7 : 'Hello'
11:  undefined
15: 'World'
19: '!'

It is as expected, only `myOtherString` is falsy but on line 19 `myArray` is truthy.