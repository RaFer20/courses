# Amount Payable
What does the following code log? Why is this so?
```js
let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));
```

## Solution
40
45
This is because the `totalPayable` function has access to the `startingBalance` variable since it is part of it's enclosing scope. Each time the function is called it looks up the value of `startingBalance` which is `5` on line 10 and `10` on line 13.