Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

Examples:
```js
sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150
```

# Problem
Write a function that computes (square of sum) - (sum of sqaures) for the `n` integers
Input: number
Output: (square of sum) - (sum of sqaures) (a number)

# Examples/Test Cases
```js
sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150
```

# Data Structures
numbers

# Algorithm
return `sumSquare(n) - squareSum(n)`

Helper functions:
sumSquare(n)
initialize a `sum` variable
start a for loop from `i = 1` up to `n`
- add `i` to `sum`
return `counter ** 2`

squareSum(n)
initialize a `sum` variable
start a for loop from `i = 2` up to `n`
- sum += i**2 on every iteration
return sum

# Code
```js
function sumSquareDifference(n) {
  return (sumSquare(n) - squareSum(n));
}

function sumSquare(n) {
  let sum = 0;

  for (let i = 1; i <= n; i += 1) {
    sum += i;
  }

  return (sum ** 2);
}

function squareSum(n) {
  let sum = 0;

  for (let i = 1; i <= n; i += 1) {
    sum  += (i ** 2);
  }

  return sum;
}
```

Alternative:
```js
function sumSquareDifference(n) {
  let sum = 0;
  let sumOfSquares = 0;

  for (let i = 1; i <= n; i += 1) {
    sum += i;
    sumOfSquares += i ** 2;
  }

  return sum ** 2 - sumOfSquares;
}
```