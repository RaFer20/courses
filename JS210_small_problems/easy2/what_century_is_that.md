# What Century Is That
Write a function that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901 - 2000 comprise the 20th century.

Examples:
```js
century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
```

## Solution
```js
function century(year) {
  centuryString = String(Math.ceil(year/100));

  if (lastChar(centuryString) === '1') {
    centuryString += 'st';
  } else if (lastChar(centuryString) === '2') {
    centuryString += 'nd';
  } else if (lastChar(centuryString) === '3') {
    centuryString += 'rd';
  } else {
    centuryString += 'th';
  }

  return centuryString;
}
const lastChar = (text) => text[text.length - 1];
```


Alternative Solution:
```js
function century(year) {
  let centuryNumber = Math.floor(year / 100) + 1;

  if (year % 100 === 0) {
    centuryNumber -= 1;
  }

  return String(centuryNumber) + centurySuffix(centuryNumber);
}

function centurySuffix(centuryNumber) {
  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  let lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}
```