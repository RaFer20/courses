Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

Examples:
```js
star(7);
// logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9);
// logs
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
```

# Problem
Write a function that takes a number and display an 8-pointed star in an nxn grid
`n` will be a value greated than or equal to 7
Input: number
Output: star displayed

# Examples / Test Cases
```js
star(7);
// logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9);
// logs
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
```

# Data Structures
Strings

# Algorithm
Initialize a variable `startSpace` to (n - 3) / 2
Initialize a variable `inBetween` to 0
Initialize a variable `display` as an empty array
start a loop and keep iterating while `i` is less than or equal to (n - 1) / 2
Initialize a `line` variable to `startSpace + star + inBetween + star + inBetween + star` 
where `startSpace` and `inbetween` represent a number of spaces and `star` represents `'*'`
- if `i` is equal to 0 repeat `n` stars
- else insert `line` at the start and end of the array
- - decrement `startSpace` and increment `inBetween`
log each string in display into the console

# Code
```js
function star(n) {
  let startSpace = (n - 3) / 2;
  let inBetween = 0;
  let display = [];

  for (let i = 0; i <= (n - 1) / 2; i += 1) {
    let line = ' '.repeat(startSpace) + '*' + ' '.repeat(inBetween)+ '*' + ' '.repeat(inBetween)+ '*';
    if (i === 0) {
      display.push('*'.repeat(n));
    } else {
      display.unshift(line);
      display.push(line);
      startSpace -= 1;
      inBetween += 1;
    }
  }

  display.forEach(line => console.log(line))
}
```

Alternative:
```js
function repeat(char, times) {
  let repeated = '';

  for (let i = 0; i < times; i += 1) {
    repeated += char;
  }

  return repeated;
}

function buildStarRow(spacesBetween, spacesPadding) {
  const asterisks = ['*', '*', '*'];
  const starRow = asterisks.join(repeat(' ', spacesBetween));
  return repeat(' ', spacesPadding) + starRow;
}

function star(n) {
  const middleIdx = Math.floor(n / 2);

  for (let i = 0; i < middleIdx; i += 1) {
    let spacesBetween = ((n - 3) / 2) - i;
    let spacesPadding = i;
    console.log(buildStarRow(spacesBetween, spacesPadding));
  }

  console.log(repeat('*', n));

  for (let i = 0; i < middleIdx; i += 1) {
    let spacesBetween = i;
    let spacesPadding = ((n - 3) / 2) - i;
    console.log(buildStarRow(spacesBetween, spacesPadding));
  }
}
```