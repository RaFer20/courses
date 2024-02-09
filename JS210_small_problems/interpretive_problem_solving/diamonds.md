Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

Examples:
```js
diamond(1);
// logs
*

diamond(3);
// logs
 *
***
 *

diamond(9);
// logs
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```

# Problem
Write a function that displays a four-pointed diamond in an nxn grid
`n` will always be an odd integer

Input: number
Output: diamond consisting of `n` lines

# Example / Test Cases
```js
diamond(1);
// logs
*

diamond(3);
// logs
 *
***
 *

diamond(9);
// logs
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```

# Data Structures
Array

# Algorithm
initialize an empty array `display`
start a for loop, stars = n, iterate while stars > 0
- if stars === n push `'*'.repeat(n)` into `display`
- else push and unshift `' '.repeat((n - stars) / 2) + '*'.repeat(stars)` into `display`
log into the console every string in `display`

# Code
```js
function diamond(n) {
  let display = [];

  for (let stars = n; stars > 0; stars -= 2) {
    if (stars === n) {
      display.push('*'.repeat(n))
    } else {
      display.unshift(' '.repeat((n  - stars) / 2) + '*'.repeat(stars))
      display.push(' '.repeat((n  - stars) / 2) + '*'.repeat(stars))
    }
  }

  display.forEach( n => console.log(n))
}
```

Alternative:
```js
function diamond(n) {
  numberSequence(n).forEach(number => {
    console.log(repeat(' ', (n - number) / 2) + repeat('*', number));
  });
}

function numberSequence(n) {
  const result = [];
  let increment = 2;

  for (let number = 1; number > 0; number += increment) {
    result.push(number);
    if (number === n) {
      increment = -2;
    }
  }

  return result;
}

function repeat(char, times) {
  let repeated = '';

  for (let i = 0; i < times; i += 1) {
    repeated += char;
  }

  return repeated;
}

```