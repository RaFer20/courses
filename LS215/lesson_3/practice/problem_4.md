# Problem Description
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

- "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
- "1-3, 1-2" --> 1, 2, 3, 11, 12
- "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
- "104-2" --> 104, 105, ... 112
- "104-02" --> 104, 105, ... 202
- "545, 64:11" --> 545, 564, 565, .. 611

# Understanding The Problem
Input : string of number ranges
Output : array containing the numbers in the input ranges

Range limits are always inclusive.
assume valid input

# Examples / Test Cases
- "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
- "1-3, 1-2" --> 1, 2, 3, 11, 12
- "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
- "104-2" --> 104, 105, ... 112
- "104-02" --> 104, 105, ... 202
- "545, 64:11" --> 545, 564, 565, .. 611
- "123-22" --> 123, 124, 125, ..222

# Data Structures
array

# Algorithm


# Code
```js
function expandRange(prevNumber, range) {
  let ranges = range.match(/\d+/g);
  let result = [];

  let count = prevNumber === undefined ?
  Number(ranges[0]) : nextNum(prevNumber, ranges[0]);

  ranges.slice(1).forEach(rangeDigit => {
    result.push(count);
    count += 1;

    while (!matchingNumber(count, rangeDigit)) {
      result.push(count);
      count += 1;
    }
  })

  result.push(count);
  return result;
}

function matchingNumber(count, shorthand) {
  return String(count).slice(-shorthand.length) === shorthand;
}

function nextNum(prevNumber, shorthand) {
  if (prevNumber === undefined) return Number(shorthand);

  let count = prevNumber + 1;
  while (!matchingNumber(count, shorthand)) {
    count += 1;
  }

  return count;
}

function isRange(shorthand) {
  return /[:-..]/.test(shorthand);
}

function expand(shorthandString) {
  let allNumbers = [];
  let shorthands = shorthandString.split(", ");

  shorthands.forEach(shorthand => {
    let prevNumber = allNumbers[allNumbers.length - 1];

    if (isRange(shorthand)) {
      allNumbers = allNumbers.concat(expandRange(prevNumber, shorthand));
    } else {
      allNumbers.push(nextNum(prevNumber, shorthand));
    }
  });

  return allNumbers;
}
```