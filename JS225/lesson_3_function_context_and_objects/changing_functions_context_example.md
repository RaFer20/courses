# Example: Changing Function Context
At first we have a function named `average` that calculates the average of the values in an Array passed as an argument. We will use it to calculate an average temperature.
```js
let temperatures = [53, 86, 12, 43];

function average(values) {
  let total = 0;
  let i;
  for (i = values.length - 1; i >= 0; i -= 1) {
    total += values[i];
  }

  return total / values.length;
}

console.log(average(temperatures));           // => 48.5
```

We will change the function to work with the context variable, this, instead. We can do this by removing the `values` parameter from our definition and replacing instances of `values` in the function with `this`
```js
let temperatures = [53, 86, 12, 43];

function average() {
  let total = 0;
  let i;
  for (i = this.length - 1; i >= 0; i -= 1) {
    total += this[i];
  }

  return total / this.length;
}

console.log(average(temperatures));           // => NaN
```
Since we're calling our function from the global scope, the context variable `this` inside `average` is the `window` object rather than the `temperatures` array. So `average(temperatures)` will return `NaN`. To use  `temperatures` as our context we can use `call` or `apply`.
```js
console.log(average.call(temperatures));      // => 48.5
console.log(average.apply(temperatures));     // => 48.5
```

We can also create a function that permanently binds `average` with `temperatures` as it's context. We can do this by using the `bind` method from `Function.prototype`.
```js
let averageTemperature = average.bind(temperatures);

console.log(averageTemperature());
```

change the execution context for our function by using it to define a method in an object. When assigned to an object, the function's context is the parent object unless bound otherwise. Since arrays are also objects, we can add the method to `temperatures` and call it when we're ready:
```js
temperatures.average = average;               // [ 53, 86, 12, 43, average: [Function: average] ]
console.log(temperatures.average());          // => 48.5
```