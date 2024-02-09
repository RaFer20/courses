# Cute Angles
Write a function that takes a floating point number representing an angle between 0 and 360 degrees and returns a string representing that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

Examples:
```js
dms(30);           // 30°00'00"
dms(76.73);        // 76°43'48"
dms(254.6);        // 254°35'59"
dms(93.034773);    // 93°02'05"
dms(0);            // 0°00'00"
dms(360);          // 360°00'00" or 0°00'00"
```
Note: your results may differ slightly depending on how you round values, but should generally be within a second or two of the results shown.

## Solution
```js
function dms(number) {
  let degrees = Math.floor(number);
  let minutes = Math.floor((number - degrees) * 60)
  let seconds = Math.floor((((number - degrees) * 60) - minutes) * 60)
  let dms = `${degrees}°${padZeroes(minutes)}'${padZeroes(seconds)}"`
  return dms
}

function padZeroes(number) {
  const numString = String(number);
  return numString.length < 2 ? (`0${numString}`) : numString;
}
```

Alternative:
```js
const DEGREE = '\xB0';
const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;
const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

function dms(degreesFloat) {
  const degreesInt = Math.floor(degreesFloat);
  const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
  const seconds = Math.floor(
    (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
    SECONDS_PER_DEGREE
  );

  return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
}

function padZeroes(number) {
  const numString = String(number);
  return numString.length < 2 ? (`0${numString}`) : numString;
}
```