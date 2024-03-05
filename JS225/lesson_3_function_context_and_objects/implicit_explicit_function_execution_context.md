# Function Execution Context
Every time a JavaScript function is invoked, it has access to an object called the execution context of that function. This execution context is accessible through the keyword this. A JavaScript function can be invoked in a variety of ways. Which object this refers to depends on how the function was invoked.

- Implicit: This is an execution context that JavaScript "implicitly" sets.
- Explicit: This is an execution context that we "explicitly" set.

*It's important to remember that the rules for this are entirely different from the rules for variable scope. While a variable's scope is determined by where you write the code, this depends on how you invoke it.*

# Implicit Execution Context for Functions
The implicit function execution context (also called implicit binding for functions) is the context for a function that you invoke without supplying an explicit context. JavaScript binds such functions to the global object.
```js
function foo() {
  return 'this here is: ' + this;
}

foo();                // "this here is: [object Window]"
```
Running `foo()` in this way is like running `window.foo()`


**Binding a function to a context object occurs when you execute the function, not when you define it.**
```js
let object = {
  foo() {
    return 'this here is: ' + this;
  },
};

object.foo();              // "this here is: [object Object]"

let bar = object.foo;
bar();                     // "this here is: [object Window]"
```
When we call `bar` in the code above JavaScript implicitly binds the method to the global object instead of `object`.

In strict mode, the implicit execution context is `undefined`. It's important to note, however, that this still points to the global object in the global scope.
```js
"use strict";

function foo() {
  console.log('this here is: ' + this);
}

foo();                // "this here is: undefined"
console.log('this here is: ' + this); // "this here is: [object Window]"
```

# Implicit Execution Context for Methods
The implicit method execution context is the execution context for any method invoked without an explicit context provided. JavaScript implicitly binds methods invoked in this manner to the calling object:
```js
let foo = {
  bar() {
    return this;
  },
};

foo.bar() === foo; // true
```

It's important to remembet that implicit execution context is bound upon invocation, not definition:
```js
let foo = {
  bar() {
    return this;
  },
};

let baz = foo.bar;

baz() === foo;    // false
baz() === window; // true
```
Although `bar` begins its life as an object property, when it is invoked as a function (as it is after being assigned to `baz`) its context is bound to the global object.

# Explicit Execution Context
JavaScript lets us use the `call` and `apply` methods to change a function's execution context at execution time. This way we can explicitly bind a function's execution context to an object when we execute the function.

## Call
```js
a = 1;

let object = {
  a: 'hello',
  b: 'world',
};

function foo() {
  return this.a;
}

foo();                  // 1 (context is global object)
foo.call(object);       // "hello" (context is object)
```
In the code above we are explicitly binding the execution context of `foo` to `object`.

```js
let strings = {
  a: 'hello',
  b: 'world',
  foo() {
    return this.a + this.b;
  },
};

let numbers = {
  a: 1,
  b: 2,
};

strings.foo.call(numbers); // 3
```
In the code above we run foo from `strings` in the `numbers` context. We're "borrowing" a method from an object to use with another object; we're not copying it.

The `call` method is also able to pass arguments to the function, we just need to list them after the context object.
```js
someObject.someMethod.call(context, arg1, arg2, arg3, ...)
```


## Apply
The `apply` method is identical to `call`, except that it uses an array to pass arguments.
```js
someObject.someMethod.apply(context, [arg1, arg2, arg3, ...])
```

So using the same example as above:
```js
let iPad = {
  name: 'iPad',
  price: 40000,
};
let kindle = {
  name: 'kindle',
  price: 30000,
};

function printLine(lineNumber, punctuation) {
  console.log(lineNumber + ': ' + this.name + ', ' + this.price / 100 + ' dollars' + punctuation);
}

printLine.apply(iPad, [1, '.'])  // 1: iPad, 400 dollars.
```