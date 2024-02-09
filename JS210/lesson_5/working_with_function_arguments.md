# Working with Function Arguments
Usually omitted arguments take on a value of `undefined` within the function, and Functions ignore any excess arguments. This is usually how Function arguments work. However, there is a JavaScript feature that lets you circumvent these limitations and handle an arbitrary number of arguments.

## The Traditional Approach
The arguments object is an Array-like local variable that is available inside all Functions. It contains all the arguments passed to the Function, no matter how many arguments you provided, and no matter how many arguments the Function's definition includes:
```js
function logArgs(a) {
  console.log(arguments[0]);
  console.log(arguments[1]);
  console.log(arguments.length);
}

logArgs(1, 'a');

// logs:
1
a
2
```

Notice that we can access argument values using the same bracket notation that we use with Arrays, and that arguments also has a length property. Unfortunately, this is where the similarities between arguments and Arrays end:
```js
function logArgs() {
  console.log(typeof arguments);
  console.log(Array.isArray(arguments));
  arguments.pop();
}

logArgs(1, 2);

// logs:
object       // arguments is an "object"
false        // but it is not an Array
TypeError: Object #<Object> has no method 'pop' // and it doesn't have the usual Array methods
```

We can create an Array from the arguments object with this code:
```js
let args = Array.prototype.slice.call(arguments);
```

When we apply slice to the arguments object, it creates an Array that contains the same values as those present in arguments. This gives us an Array that we can use just like any other Array.
```js
function logArgs() {
  let args = Array.prototype.slice.call(arguments);
  console.log(typeof args);
  console.log(Array.isArray(args));
  args.pop();
}

logArgs(1, 2);

// logs:
object
true         // args is a proper Array now
```

### Functions that accept any Number of Arguments
Example of a `sum` function:
```js
function sum() {
  let result = 0;
  for (let index = 0; index < arguments.length; index += 1) {
    result += arguments[index];
  }

  return result;
}

sum();                 // 0
sum(1, 2, 3);          // 6
sum(1, 2, 3, 4, 5);    // 15
```

## The Modern Approach
ES6 introduced a new way to do that: rest parameters.
```js
function logArgs(...args) { // 3 periods followed by an array name
  console.log(args[0]);
  console.log(args[1]);
  console.log(args.length);
}

logArgs(1, 'a');

// logs:
1
a
2
```
Unlike the arguments object, the array used in rest parameters is a genuine array -- it is not Array-like. Furthermore, the name isn't fixed -- we can use any valid name except for arguments (which refers to the object, not an array).

We can mix rest parameters with other named parameters. For instance:
```js
function logArgs(foo, bar, ...args) {
  console.log(foo);
  console.log(bar);
  console.log(args[0]);
  console.log(args[1]);
  console.log(args.length);
}

logArgs('oof', 'rab', 1, 'a');

// logs:
oof
rab
1
a
2
```
