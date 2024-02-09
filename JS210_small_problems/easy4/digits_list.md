# Digits List
Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:
```js
digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]
```


## Solution
```js
function digitList(number) {
  return String(number).split('').map((n) => Number(n))
}
```