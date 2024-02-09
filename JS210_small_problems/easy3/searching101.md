# Searching 101
Write a program that solicits six numbers from the user and logs a message that describes whether the sixth number appears among the first five numbers.

Examples:
```js
Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 17

The number 17 appears in [25, 15, 20, 17, 23].

-----

Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 18

The number 18 does not appear in [25, 15, 20, 17, 23].
```

## Solution
chrome:
```js
const numbers = [];

numbers.push(prompt('Enter the 1st number:'));
numbers.push(prompt('Enter the 2nd number:'));
numbers.push(prompt('Enter the 3rd number:'));
numbers.push(prompt('Enter the 4th number:'));
numbers.push(prompt('Enter the 5th number:'));

let lastNum = prompt('Enter the last number:');

if (numbers.includes(lastNum)) {
  console.log(`The number ${lastNum} appears in ${numbers}.`)
} else {
  console.log(`The number ${lastNum} does not appear in ${numbers}.`)
}
```

node:
```js
let readlineSync = require('readline-sync');
const numbers = [];

numbers.push(readlineSync.question('Enter the 1st number:'));
numbers.push(readlineSync.question('Enter the 2nd number:'));
numbers.push(readlineSync.question('Enter the 3rd number:'));
numbers.push(readlineSync.question('Enter the 4th number:'));
numbers.push(readlineSync.question('Enter the 5th number:'));

let lastNum = readlineSync.question('Enter the last number:');

if (numbers.includes(lastNum)) {
  console.log(`The number ${lastNum} appears in ${numbers}.`)
} else {
  console.log(`The number ${lastNum} does not appear in ${numbers}.`)
}
```