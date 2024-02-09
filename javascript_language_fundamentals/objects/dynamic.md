# Dynamic
What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]);
console.log(myObject.prop2);
```

## Solution
On line 11, the value of `prop2` (the string `'456'`) is used as the key.
On line 12, when the `prop2` (string literal) property of myObject is accessed, the value logged (`'456'`) is different from the value assigned on line 3 (`'234'`) because this property was reassigned on line 8.

## Further Exploration
Here is another example. What do you think will be logged to the console this time, and why?
```js
const myObj = {};
myObj[myFunc()] = 'hello, ';

function myFunc() {
  return 'funcProp';
}

console.log(myObj);
myObj[myFunc()] = 'world!';
console.log(myObj);
```
On line 8 `{}` will be logged since the value of `myFunc` was assigned before it was declared, line 10 will log `{ funcProp: 'world!' }` because line 9 assigns the value to the return value of calling `myFunc()`.