# Immediately Invoked Function Expressions
An immediately invoked function expression (IIFE) is a function that we define and invoke simultaneously:
```js
(function() {
  console.log('hello');
})();                     // => hello
```

This syntax adds a pair of parentheses around the function expression, and the parentheses at the end invoke the function. The extra parentheses around the function expression are important — without them, the function can't be invoked right away:
```js
function() {
  console.log('hello');
}();                      // SyntaxError: Unexpected token
```

In JavaScript, surrounding a value with parentheses `( )` doesn't change the value. It is a grouping operator that controls the evaluation in expressions.

Examples:
```js
> (3)
= 3
> (['apple', 'carrot'])
= ["apple", "carrot"]
```

With IIFEs, we use the parentheses to make it explicit that we want to parse the function definition as an expression. As an expression it means that there is a value returned — the function — that we can immediately "invoke."

All functions, including IIFEs, can take arguments and return values:
```js
(function(a) {
  return a + 1;
})(2);                    // 3
```

We may sometimes see a slightly different style for IIFEs:
```js
(function() {
  console.log('hello');
}());
```
JavaScript handles this style the same as with the earlier approach.


We can omit the parentheses around an IIFE when the function definition is an expression that doesn't occur at the beginning of a line:
```js
let foo = function() {
  return function() {
    return 10;
  }();
}();

console.log(foo);       // => 10
```

## Creating Private Data with an IIFE
With an IIFE we can make functions and objects that have access to private data.

### Using an IIFE to Return a Function with Access to Private Data
```js
let generateStudentId = (function() {
  let studentId = 0;

  return function() {
    studentId += 1;
    return studentId;
  };
})();
```
This approach allows `generateStudentId` to keep track of the student IDs generated without exposing `studentId` to being unintentionally reassigned.

### Using an IIFE to Return an Object with Access to Private Data
Let's say that we have an `inventory` object that maintains a list of stock objects (name and quantity as properties) and has a method that logs the stock count of each item.
```js
let inventory = {
  stocks: [],
  stockCounts() {
    this.stocks.forEach(function(stock) {
      console.log(stock.name + ': ' + String(stock.count));
    });
  },
};
```
This implementation has a limitation when it comes to validating new `stock` objects added to the `stocks` list. 
As an improvement on this, we could add a method on the inventory object for adding a stock object so that it validates that the name is unique:
```js
let inventory = {
  stocks: [],
  stockCounts() {
    this.stocks.forEach(function(stock) {
      console.log(stock.name + ': ' + String(stock.count));
    });
  },
  addStock(newStock) {
    let isValid = this.stocks.every(function(stock) {
      return newStock.name !== stock.name;
    });

    if (isValid) { this.stocks.push(newStock) }
  },
};
```
The code above includes a new `addStock` method which will validate objects being added to `stocks` but the user is still able to add objects directly into the list.
```js
inventory.stocks.push({
  name: 'ballpen',
  count: 5,
});
```

We can make use of an IIFE to make the list private, and allow the adding of new stocks through the `addstock` method only:
```js
let inventory = (function() {
  let stocks = [];

  return {
    stockCounts() {
      stocks.forEach(function(stock) {
        console.log(stock.name + ': ' + String(stock.count));
      });
    },
    addStock(newStock) {
      let isValid = stocks.every(function(stock) {
        return newStock.name !== stock.name;
      });

      if (isValid) { stocks.push(newStock) }
    },
  };
})();
```

We can extract the function that validates that new `stock` objects have unique names to a private function as well.
```js
let inventory = (function() {
  let stocks = [];
  function isValid(newStock) {
    return stocks.every(function(stock) {
      return newStock.name !== stock.name;
    });
  }

  return {
    stockCounts() {
      stocks.forEach(function(stock) {
        console.log(stock.name + ': ' + String(stock.count));
      });
    },
    addStock(newStock) {
      if (isValid(newStock)) { stocks.push(newStock) }
    },
  };
})();
```