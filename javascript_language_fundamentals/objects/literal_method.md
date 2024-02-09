# Literal Method
In the following code, a user creates a `person` object literal and defines two methods for returning the `person`'s first and last names. What is the result when the user tries out the code on the last line?

```js
const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`);
```

## Solution
Since we haven't appended parentheses the functions themselves are being returned. We need to append parentheses to the function call to execute it. `person.firstName()` and `person.lastName()`.