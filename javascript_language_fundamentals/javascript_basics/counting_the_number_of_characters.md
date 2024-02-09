In this exercise, you will write a program that asks the user for a phrase, then outputs the number of characters in that phrase. Go over the documentation for String to find an appropriate method to use.
Examples:
```js
Please enter a phrase: walk
// console output
There are 4 characters in "walk".

Please enter a phrase: walk, don't run
// console output
There are 15 characters in "walk, don't run".
```

Solution:
on node
```js
const readlineSync = require("readline-sync");
console.log('Please enter a phrase:')
let phrase = readlineSync.prompt();
console.log(`There are ${phrase.length} characters in "${phrase}"`);
```

on browser
```js
const phrase = prompt('Please enter a phrase:')
console.log(`There are ${phrase.length} characters in "${phrase}"`)
```