# Practice Problems - Higher-Order Functions

## 1. What are the characteristics that define higher-order functions?

### Solution:
Higher-Order functions can take functions as arguments and return functions, they can do either of the two or both.

## 2. Consider the code below:
```js
let numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]
```
Of the two functions invoked (`checkEven` and `filter`), which is a higher-order function and why?

### Solution:
`filter` is a higher order function, we are passing it `checkEven` as an argument. `checkEven` does not take a function as an argument nor does it return a function.

## 3. Implement `makeCheckEven` below, such that the last line of the code returns an array `[2, 4]`.
```js
let numbers = [1, 2, 3, 4];
function makeCheckEven() {
  // ... implement this function
}

let checkEven = makeCheckEven();

numbers.filter(checkEven); // [2, 4]
```

### Solution:
```js
function makeCheckEven() {
  return function(n) {
    return n % 2 === 0;
  };
}
```

## 4. Implement `execute` below, such that the return values for the two function invocations match the commented values.
```js
function execute(func, operand) {
  // ... implement this function
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"
```

### Solution:
```js
function execute(func, operand) {
  return func(operand);
}
```

## 5. Implement `makeListTransformer` below such that `timesTwo`'s return value matches the commented return value.
```js
function makeListTransformer(func) {
  // ... implement this function
}

let timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

timesTwo([1, 2, 3, 4]); // [2, 4, 6, 8]
```

### Solution:
```js
function makeListTransformer(func) {
  return function(list) {
    return list.map(func);
  };
}
```