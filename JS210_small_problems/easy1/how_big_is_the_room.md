# How Big is the Room
Build a program that asks the user to enter the length and width of a room in meters, and then logs the area of the room to the console in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time. Use the `readlineSync.prompt` method to collect user input.

Example:
```js
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.00 square meters (753.47 square feet).
```

## Solution
```js
let readlineSync = require('readline-sync');
const SQMETERS_TO_SQFEET = 10.7639;

console.log('Enter the length of the room in meters:')
let length = Number(readlineSync.prompt())

console.log('Enter the width of the room in meters:');
let width = Number(readlineSync.prompt())

let squareMeters = (length * width);
let squareFeet = squareMeters * SQMETERS_TO_SQFEET
console.log(`The area of the room is ${squareMeters.toFixed(2)} square meters (${squareFeet.toFixed(2)} square feet).`)
```

## Further Exploration
Modify the program so that it asks the user for the input type (meters or feet). Compute for the area accordingly, and log it and its conversion in parentheses.
```js
let readlineSync = require('readline-sync');
const SQMETERS_TO_SQFEET = 10.7639;
const SQFEET_TO_SQMETERS = 0.092903;

console.log('Enter the input type (feet/meters):');
inputType = readlineSync.prompt();

if (inputType === 'meters') {
  console.log('Enter the length of the room in meters:');
  let length = Number(readlineSync.prompt());
  
  console.log('Enter the width of the room in meters:');
  let width = Number(readlineSync.prompt());
  
  let squareMeters = (length * width);
  let squareFeet = (squareMeters * SQMETERS_TO_SQFEET);

  console.log(`The area of the room is ${squareMeters.toFixed(2)} square meters (${squareFeet.toFixed(2)} square feet).`);
} else if (inputType === 'feet') {
  console.log('Enter the length of the room in feet:');
  let length = Number(readlineSync.prompt());

  console.log('Enter the width of the room in feet:');
  let width = Number(readlineSync.prompt());

  let squareFeet = (length * width);
  let squareMeters = (squareFeet * SQFEET_TO_SQMETERS);

  console.log(`The area of the room is ${squareFeet.toFixed(2)} square feet (${squareMeters.toFixed(2)} square meters).`);
}

```