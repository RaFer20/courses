# When Will I Retire?
Build a program that logs when the user will retire and how many more years the user has to work until retirement.

Example:
```js
What is your age? 30
At what age would you like to retire? 70

It's 2017. You will retire in 2057.
You have only 40 years of work to go!
```

## Solution
node
```js
const readlineSync = require('readline-sync');

const age = Number(readlineSync.question('What is your age?'));
const retirement = Number(readlineSync.question('At what age would you like to retire?'));
const currentYear = (new Date()).getFullYear();
const timeDifference = (retirement - age);

console.log(`It's ${currentYear}. You will retire in ${currentYear + timeDifference}`);
console.log(`You have only ${timeDifference} years of work to go!`);
```

chrome
```js
const age = parseInt(prompt('What is your age?'), 10);
const retirementAge = parseInt(prompt('At what age would you like to retire?'), 10);

const today = new Date();

const currentYear = today.getFullYear();
const workYearsToGo = retirementAge - age;
const retirementYear = currentYear + workYearsToGo;

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${workYearsToGo} years of work to go!`);
```

## Further Exploration
- What would happen if the `new` keyword wasn't used in defining the `today` variable on line 4?
A string would be returned instead of a `Date` object.