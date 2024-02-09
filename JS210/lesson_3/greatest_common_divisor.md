# Greatest Common Divisor
Create a function that computes the Greatest Common Divisor of two positive integers.

Example
```js
gcd(12, 4);   // 4
gcd(15, 10);  // 5
gcd(9, 2);    // 1
```

## Solution
```js
function gcd(firstNum, secondNum) {
  let n1 = firstNum
  let n2 = secondNum
  let largeNum = Math.max(n1, n2)
  let smallNum = Math.min(n1, n2)

  do {
    let remainder = largeNum % smallNum
    largeNum = smallNum
    smallNum = remainder
  } while (smallNum !== 0);
  return largeNum
}
```