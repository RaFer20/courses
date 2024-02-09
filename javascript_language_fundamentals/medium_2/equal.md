# Equal
Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.
```js
const person = { name: 'Victor' };
const otherPerson = { name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true
```

## Solution
Objects are not equal unless they are the same object, when we create an object literal a new object is created. When the object is assigned to a variable, a reference to the object is stored in that variable.

In the code snippet above both objects have the same properties but are two different objects. In the code below both `person` and `otherPerson` reference the same object.

Refactor:
```js
const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson); //true
```