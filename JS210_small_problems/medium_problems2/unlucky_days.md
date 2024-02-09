Write a function that takes a year as an argument and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.

Examples:
```js
fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
```


# Problem
Write a function that returns the number of 'Friday the 13ths' in the year provided
Year will always be greater than 1752

# Examples/Test Cases
```js
fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
```

# Data Structures
Array

# Algorithm
Create a `months` array
initialize a `count` to `0`
iterate over the months array
- create a date object: current month - 13(day) - input year
- if the day of date provided === 5 (friday) increase count by 1
return the count

# Code
```js
const months = [
  'January', 'February', 'March', 'April',
  'May', 'June', 'July', 'August',
  'September', 'October', 'November', 'December'
];

function fridayThe13ths(year) {
  let count = 0;

  for (let i = 0; i < months.length; i += 1) {
    let date = new Date(`${months[i]}-13-${year}`);
    if (date.getDay() === 5) count += 1;
  }

  return count;
}
```

Alternative:
```js
function fridayThe13ths(year) {
  const thirteenths = [];

  for (let i = 0; i < 12; i += 1) {
    thirteenths.push(new Date(year, i, 13));
  }

  return thirteenths.reduce((count, day) => day.getDay() === 5 ? (count + 1) : count, 0);
}
```