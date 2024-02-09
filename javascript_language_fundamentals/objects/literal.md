# Literal
Identify the bug in the following code. Don't run the code until after you've tried to answer.

```js
const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a];
myObject.a;
```

## Solution
`a` is not declared, we're using an undeclared variable as a key. JavaScript searches for the value of the variable to convert it to a string if necessary but in this case there is no value.