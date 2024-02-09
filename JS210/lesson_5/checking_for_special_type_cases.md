```js
// Null testing
var myNullValue = null;
console.log(typeof myNullValue);          // Logs: object
console.log(myNullValue === null);        // Logs true

// Array testing
var myArray = [];
console.log(typeof myArray);              // Logs: object
console.log(Array.isArray(myArray));      // Logs: true
console.log(Array.isArray({}));           // Logs: false

// Integer testing
console.log(typeof 4);                    // Logs: number
console.log(Number.isInteger(4));         // Logs: true
console.log(Number.isInteger(4.0));       // Logs: true
console.log(Number.isInteger(4.5));       // Logs: false

// NaN testing
console.log(typeof NaN);                  // Logs: number
console.log(Number.isNaN(NaN));           // Logs: true
console.log(Number.isNaN(3));             // Logs: false
console.log(NaN === NaN);                 // Logs: false
console.log(NaN !== NaN);                 // Logs: true
```