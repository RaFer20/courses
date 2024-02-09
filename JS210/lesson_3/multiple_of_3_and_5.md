# Multiple of 3 and 5
Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.

Example:
```js
multiplesOfThreeAndFive();
// output on console
'3'
'5'
'6'
'9'
'10'
'12'
'15!'
// … remainder of output omitted for brevity
```

Assumptions: The number must be logged as a string
input: number
output: string


## Solution
```js
function multiplesOfThreeAndFive() {
  for (let num = 1; num <= 100; num++) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log(num.toString() + '!');
    } else if (num % 3 === 0 || num % 5 === 0) {
      console.log(num.toString());
    }
  }
};
```

## Further Exploration
For additional practice, how would you change your function so it takes, as arguments, the range of numbers it should check?

```js
function multiplesOfThreeAndFive(min, max) {
  for (let num = min; num <= max; num++) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log(num.toString() + '!');
    } else if (num % 3 === 0 || num % 5 === 0) {
      console.log(num.toString());
    }
  }
};
```