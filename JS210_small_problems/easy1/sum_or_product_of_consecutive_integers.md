# Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than `0`, then asks if the user wants to determine the sum or the product of all numbers between `1` and the entered integer, inclusive.

Examples:
```js
Please enter an integer greater than 0: 5
Enter "s" to compute the sum, or "p" to compute the product. s

The sum of the integers between 1 and 5 is 15.
```
```js
Please enter an integer greater than 0: 6
Enter "s" to compute the sum, or "p" to compute the product. p

The product of the integers between 1 and 6 is 720.
```

## Solution
```js
let readlineSync = require('readline-sync');

console.log('Please enter an integer greater than 0:');
let integer = readlineSync.prompt();

console.log('Enter "s" to comput the sum, or "p" to compute the product.')
let choice = readlineSync.prompt();

if (choice === "s") {
  let i = 1;
  let sum = 0;
  while (i <= integer) {
    sum += i
    i++
  }
  console.log(`The sum of the integers between 1 and ${integer} is ${sum}.`)
} else if (choice === "p") {
  let i = 1;
  let product = 1;
  while (i <= integer) {
    product *= i
    i++
  }
  console.log(`The product of the integers between 1 and ${integer} is ${product}.`)
}
```

Alternative:
```js
function computeSum(number) {
  let total = 0;

  for (let i = 1; i <= number; i += 1) {
    total += i;
  }

  return total;
}

function computeProduct(number) {
  let total = 1;

  for (let i = 1; i <= number; i += 1) {
    total *= i;
  }

  return total;
}

const number = parseInt(prompt('Please enter an integer greater than 0'), 10);
const operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.');

if (operation === 's') {
  let sum = String(computeSum(number));
  console.log(`The sum of the integers between 1 and ${String(number)} is ${sum}.`);
} else if (operation === 'p') {
  let product = String(computeProduct(number));
  console.log(`The product of the integers between 1 and ${String(number)} is ${product}.`);
} else {
  console.log('Oops. Unknown operation.');
}
```

## Further Exploration
What if the input was an array of integers instead of just a single integer? How would your computeSum and computeProduct functions change? Given that the input is an array, how might you make use of the `Array.prototype.reduce()` method?
```js
function computeSum(array) {
  let initialValue = 0;
  array = array.map((element) => parseInt(element, 10))
  total = array.reduce((accum, currValue) => accum + currValue, initialValue)

  return total;
}

function computeProduct(array) {
  let initialValue = 1;
  array = array.map((element) => parseInt(element, 10))
  total = array.reduce((accum, currValue) => accum * currValue, initialValue)

  return total;
}

const array = prompt('Please enter a list of integers greater than 0 separated by commas').split(',');
const operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.');

if (operation === 's') {
  let sum = String(computeSum(array));
  console.log(`The sum of the integers in the array is ${sum}.`);
} else if (operation === 'p') {
  let product = String(computeProduct(array));
  console.log(`The product of the integers in the array is ${product}.`);
} else {
  console.log('Oops. Unknown operation.');
}
```