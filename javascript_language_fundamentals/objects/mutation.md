# Mutation
What will the following code log to the console and why? Don't run the code until after you have tried to answer.

```js
const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = [];

for (let i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);
```

## Solution
`['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];` will be logged, the uppercased strings will not be reflected in `array2` because strings are immutable, the values in `array1` are just being reassigned to new strings.

## Further Exploration
- What would happen if an object literal was part of the array1 elements pushed to array2? Would changes made to the object literal in array1 be reflected in array2?
Yes, since the object literal can be mutated changes to it would be reflected in `array2`.

- How would you change the code so that any changes made to array1 in the second for loop get reflected to array2?
`const array2 = array1;` would make it so any change in `array1` would be reflected in `array2`.