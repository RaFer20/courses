# Pattern Generation
Write a function that takes a number of rows as the argument nStars and logs a square of numbers and asterisks. For example, if nStars is 7, log the following pattern:
```js
generatePattern(7);

// console output
1******
12*****
123****
1234***
12345**
123456*
1234567
```

## Solution
```js
function generatePattern(nStars) {
  let row = ``;
  for (let lineNumber = 1; lineNumber <= nStars; lineNumber++) {
    row += String(lineNumber);
    console.log(row + ('*'.repeat(nStars - lineNumber)));
  }
}


```

## Further Exploration
Have you tried supplying `generatePattern` with a number greater than 9? What did you observe? Can you fix the current implementation so that it still renders as a rectangle? 

```js
function generatePattern(nStars) {
  let lastRow = '';

  for (let lineNumber = 1; lineNumber <= nStars; lineNumber++) {
    lastRow += String(lineNumber);
  }

  let width = lastRow.length;

  for (let lineNumber = 1; lineNumber <= nStars; lineNumber++) {
    let row = ``;
    for (let num = 1; num <= lineNumber; num++) {
      row += String(num);
    }

    let starAmount = width - row.length;
    row += '*'.repeat(starAmount);
    console.log(row);
  }
}
```