Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
Example:
```js
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 1.4105003956066297e+23
```

Solution:
```js
const readlineSync = require("readline-sync");

console.log("Enter the first number:");
let firstNum = Number(readlineSync.prompt());
console.log("Enter the second number:");
let secondNum = Number(readlineSync.prompt());

console.log(`${firstNum} + ${secondNum} = ${firstNum + secondNum}`);
console.log(`${firstNum} - ${secondNum} = ${firstNum - secondNum}`);
console.log(`${firstNum} * ${secondNum} = ${firstNum * secondNum}`);
console.log(`${firstNum} / ${secondNum} = ${Math.floor(firstNum / secondNum)}`);
console.log(`${firstNum} % ${secondNum} = ${firstNum % secondNum}`);
console.log(
  `${firstNum} ** ${secondNum} = ${Math.pow(firstNum, secondNum)}`
);
```