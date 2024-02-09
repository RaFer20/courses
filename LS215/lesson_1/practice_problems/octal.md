# Octal
Write a Function named `octalToDecimal` that performs octal to decimal conversion. When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number. Implement the conversion yourself: do not use something else to perform the conversion for you.

examples:
```js
function octalToDecimal(numberString) {
  // ...
}

octalToDecimal('1');           // 1
octalToDecimal('10');          // 8
octalToDecimal('130');         // 88
octalToDecimal('17');          // 15
octalToDecimal('2047');        // 1063
octalToDecimal('011');         // 9
```

## Solution
```js
function octalToDecimal(numString) {
  let decimalParts = numString.split('').reverse().map((digitChar, i) => {
    return Number(digitChar) * Math.pow(8, i)
  });

  return decimalParts.reduce((accum, currValue) => accum + currValue);
}
```

Alternative:
```js
function octalToDecimal(numberString) {
  let decimalParts = numberString.split('').map((digitChar, index) => {
    return Number(digitChar) * Math.pow(8, numberString.length - index - 1);
  });

  return decimalParts.reduce((sum, number) => sum + number);
}
```

Alternative 2:
```js
function octalToDecimal(numberString) {
  return numberString.split('').reduce((sum, digitChar, index) => {
    return sum + Number(digitChar) * Math.pow(8, numberString.length - index - 1);
  }, 0);
}
```