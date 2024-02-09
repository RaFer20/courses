# Print Multiples
Write a function `logMultiples` that takes one argument `number`. It should log all multiples of the argument between 0 and 100 (inclusive) that are also odd numbers. Log the values in descending order.

You may assume that `number` is an integer between 0 and 100.

Example:
```js
logMultiples(17);
// output (5x, 3x and 1x)
85
51
17

logMultiples(21);
// output (3x and 1x)
63
21
```


## Solution
```js
function logMultiples(number) {
  for (let num = 100; num >= number; num--) {
    if (num % number === 0 && num % 2 === 1) {
      console.log(num)
    }
  }
};
```

## Further Exploration
This solution must step through every number between 100 and 0. Alternatively, you can determine the number's largest multiple that is less than 100, then start the loop with that multiple. With each iteration of the loop, you can decrement the number by the argument; when the result is negative, you can quit.

As above, we must check each multiple to determine whether it is odd. If it is odd, we log it.

`Math.floor(100 / number) * number` returns the largest multiple of number that is between 0 and 100. If you're not familiar with the `floor` method, see the documentation.(https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)

```js
function logMultiples(number) {
  let multiple = Math.floor(100 / number) * number;

  for (let num = multiple; num >= 0;num -= number) {
    if (num % 2 === 1) {
      console.log(num);
    }
  }
};
```