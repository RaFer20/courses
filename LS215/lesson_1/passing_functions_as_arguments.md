# Passing Functions as Arguments
Since Functions are first-class objects in JavaScript, we can pass them as arguments. This lets us provide behavior that affects the overall behavior of the Function.

```js
let count = [1, 2, 3, 4, 5];

function iterate(array) {
  for (let i = 0; i < array.length; i += 1) { // for each element in the Array
    console.log(array[i]);                    // log the element to the console
  }
}
```
In the code above there are two aspect of the `iterate` function we have no control over, how it iterates and what to do with each element.

If we were to rewrite the function so it took a callback function:
```js
function iterate(array, callback) {
  for (let i = 0; i < array.length; i += 1) { // for each element in the Array
    callback(array[i]);                       // invoke callback and pass the element
  }
}

iterate(count, function (number) { console.log(number); });
// logs
1
2
3
4
5
```
We now have control over what the function does with each element in the array. 

Since functions are first-class objects in Javascript we can also store them in variables to use them as arguments:
```js
// declares and stores the function in the logger variable
function logger(number) {
  console.log(number);
}

iterate(count, logger);
// logs
1
2
3
4
5
```

## Behavior as Arguments to Allow Abstractions
When your Function takes an argument that contains a function expression, the argument provides some supplemental behavior for the Function. This supplemental behavior comes from outside the Function itself. It gives you the ability to not only write a Function that solves a specific problem, such as "iterate through an array and log the elements", but now you can write an abstraction, such as "iterate through an array and do something" that the caller defines.

```js
function oddOrEven(array) {
  array.forEach(number => {
    if (number % 2 === 0) {
      console.log('even');
    } else {
      console.log('odd');
    }
  });
}
```