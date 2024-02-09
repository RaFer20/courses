# Grocery List
Write a function that takes a grocery list in a two-dimensional array and returns a one-dimensional array. Each element in the grocery list contains a fruit name and a number that represents the desired quantity of that fruit. The output array is such that each fruit name appears the number of times equal to its desired quantity.

In the example below, we want to buy 3 apples, 1 orange, and 2 bananas. Thus, we return an array that contains 3 apples, 1 orange, and 2 bananas.

Example:
```js
buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
```


## Solution
```js
function buyFruit(groceryList) {
  let fruitBasket = [];
  let amount;
  
  groceryList.forEach(item => {
    amount = item[1];
    while (amount > 0) {
      fruitBasket.push(item[0]);
      amount -= 1;
    }
  });

  return fruitBasket
}
```

Alternative:
```js
function buyFruit(fruitsList) {
  return fruitsList.map(fruit => repeat(fruit))
                   .reduce((groceryList, fruit) => groceryList.concat(fruit));
}

function repeat(fruit) {
  const result = [];

  for (let i = 0; i < fruit[1]; i += 1) {
    result.push(fruit[0]);
  }

  return result;
}
```