# Double Doubles
A double number is an even-length number whose left-side digits are exactly the same as its right-side digits. For example, `44`, `3333`, `103103`, and `7676` are all double numbers, whereas `444`, `334433`, and `107` are not.

Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number; otherwise, return the double number as-is.

Examples:
```js
twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676
```

## Solution
```js
function isDoubled(string) {
  const length = string.length;

  if (length % 2 === 0 && length > 0) {
    const half1 = string.slice(0, length / 2);
    const half2 = string.slice(length / 2);

    return half1 === half2;
  }

  return false;
}

function twice(number) {
  let numString = String(number);
  
  if (isDoubled(numString)) {
    return Number(numString);
  } else {
    return (number * 2);
  }
}
```