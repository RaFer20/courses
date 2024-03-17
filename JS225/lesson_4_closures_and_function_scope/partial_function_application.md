# Partial Function Application
Partial function application uses a function (we'll call it the "generator") that creates a new function (the "applicator") to call a third function (the "primary"). The generator receives some of the primary's arguments, while the applicator receives the rest when it gets invoked. The applicator then calls the primary and passes it all of its arguments, both those passed to the generator and those passed to the applicator.

*note: The terms primary, generator, and applicator are just for convenience*
```js
function primaryFunction(arg1, arg2) {
  console.log(arg1);
  console.log(arg2);
}

function generatorFunction(arg1) {
  return function(arg2) { // applicator
    return primaryFunction(arg1, arg2);
  }
}

let applicatorFunction = generatorFunction('Hello');
applicatorFunction(37.2);   // Performs primaryFunction('Hello', 37.2);
// => Hello
// => 37.2
```


If we make an `add` function:
```js
function add(first, second) {
  return first + second;
}
```

we can write a `makeAddN` generator function that saves the first number for add and returns an applicator function that we'll call later with the second number. The applicator retains access to the first number via closure, and receives the second as its sole argument:
```js
function makeAddN(addend) {                 // generator
  // Saves addend via closure; uses addend when function invoked.
  return function(number) {                 // applicator
    return add(addend, number);             // call primary
  }
}

let add1 = makeAddN(1);
add1(1);                           // 2
add1(41);                          // 42

let add9 = makeAddN(9);
add9(1);                           // 10
add9(9);                           // 18
```

The downside of this approach is that it isn't reusable — we can create applicators for `add` with any initial argument, but we have to write a new generator if we want to do the same thing with a different primary function.

We can instead create a general purpose generator function that partially applies a single argument to any two-argument primary:
```js
function add(first, second) {
  return first + second;
}

function repeat(count, string) {
  let result = '';
  let i;
  for (i = 0; i < count; i += 1) {
    result += string;
  }

  return result;
}

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

> let add1 = partial(add, 1);
> add1(2);
= 3
> add1(6);
= 7
> let threeTimes = partial(repeat, 3);
> threeTimes('Hello');
= HelloHelloHello
> threeTimes('!');
= !!!
```

## Using `Function.prototype.bind` for Partial Function Application
We can use `bind` to make a function with pre-specified initial arguments.
Example using `add` and `repeat`:
```js
// we use `null` since the function doesn't depend on `this`
> let add1 = add.bind(null, 1);
> add1(2);
= 3
> add1(6);
= 7
> let threeTimes = repeat.bind(null, 3);
> threeTimes('Hello');
= HelloHelloHello
> threeTimes('!');
= !!!
```

# Practice
## 1. Write a function named `greet` that takes two arguments and logs a greeting:
```js
> greet('howdy', 'Joe');
Howdy, Joe!
> greet('good morning', 'Sue');
Good morning, Sue!
```

### Solution:
```js
function greet(greeting, name) {
  let capitalizedGreeting = greeting[0].toUpperCase() + greeting.slice(1);
  let message = `${capitalizedGreeting}, ${name}!`
  console.log(message)
}
```

## 2. Use the `partial` function shown above and your solution to problem 1 to create `sayHello` and `sayHi` functions that work like this:
```js
> sayHello('Brandon');
Hello, Brandon!
> sayHi('Sarah');
Hi, Sarah!
```

### Solution:
```js
function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

function greet(greeting, name) {
  let capitalizedGreeting = greeting[0].toUpperCase() + greeting.slice(1);
  let message = `${capitalizedGreeting}, ${name}!`
  console.log(message)
}

let sayHello = partial(greet, 'hello');
sayHello('Brandon')
// => Hello, Brandon!

let sayHi = partial(greet, 'hi')
sayHi('Sarah')
// => Hi, Sarah!
```