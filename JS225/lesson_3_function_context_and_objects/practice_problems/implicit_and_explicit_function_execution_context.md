# Practice Problems - Implicit and Explicit Function Execution Contexts

1. What will the code below output?
```js
function foo() {
  return this;
}

let context = foo();
console.log(context);
```

Solution:
```js
Window {0: global, window: Window, self: Window, document: document, name: '', location: Location, …}
```
`foo()` is returning the global object, we are assigning that value to `context` and then displaying it in the console.


2. What will the code in the previous question output in strict mode?

Solution:
```js
undefined
```
The implicit function execution context, `this`, is `undefined` in strict mode.


3. What will the code below output? Explain the difference, if any, between this output and that of problem 1.
```js
let obj = {
  foo() {
    return this;
  },
};

let context = obj.foo();

console.log(context);
```

Solution:
```js
{foo: f}
```
`foo` is being invoked as a method so its execution context refers to the object used to call the function.

4. What will the code below output?
```js
var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();

let bar = {
  message: 'Hello from the function scope!',
};

bar.deliverMessage = deliverMessage;

bar.deliverMessage();
```

Solution:
```js
'Hello from the global scope!'
'Hello from the function scope!'
```
In the first log we use a function call so the implicit function execution context is the global object `window`. JavaScript looks for the `message` property of `window` and displays it.

In the second log we use a method call instead. The implicit function execution context for a method invocation is the calling object. So `this` resolves to `bar`, and `this.message` resolves to bar's property `message`.

5. What will the code below output? What would happen if we replaced `var` on line 1 with `let`? Can you explain why the output changes?
```js
var a = 10;
let b = 10;
let c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b;
}

c.add = add;

console.log(add());
console.log(c.add());
```

Solution:
```js
20
0
```
The first log invokes `add` as a function, `this` resolves to the global object which has a property `a` with a value of `10`. In the second log we call the `a` property of `c` (`this` resolves to `c` because it is a method invocation)and add the value of the variable `b` to it.

Replacing `var` with `let` on line 1 the function call will output `NaN` instead of `20` because when we use `var` we are creating a property in the global object, `let` and `const` on the other hand create variables that don't belong to any object.


6. The problems above all feature implicit function execution context. What methods have we learned so far that let us explicitly specify what a function's execution context should be?

Solution:
The `Function` methods `call` and `apply`.

7. In the code below, use `call` to invoke `bar.add` as a method but with `foo` as the execution context. What will this return?
```js
let foo = {
  a: 1,
  b: 2,
};

let bar = {
   a: 'abc',
   b: 'def',
   add() {
     return this.a + this.b;
   },
};
```

Solution:
```js
bar.add.call(foo); // Returns `3`
```
Since we explicitly make `foo` the context, the `a` and `b` properties of `foo` are used in the `add` method.

8. Given the code and desired output shown below, should you use `call` or `apply` to supply explicit context and the arguments to `outputList`? That is, which method makes the most sense to use? Implement a solution using your preferred method such that the desired output is logged, and explain your choice.
```js
let fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};

function outputList() {
  console.log(this.title + ':');

  let args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

// invoke outputList here
```
Desired output:
```
A Collection of Fruit:
Apple
Banana
Grapefruit
Pineapple
Orange
```

Solution:
```js
outputList.apply(fruitsObj, fruitsObj.list)
```

Alternative:
```js
outputList.call(fruitsObj, ...fruitsObj.list);
```

9. For an extra challenge, consider this line of code from the previous problem:
```js
let args = [].slice.call(arguments);
```
Inside of JavaScript functions, `arguments` is an object that holds all of the arguments passed to the function. Bearing in mind that the function author wants to iterate over the arguments later in the method using an `Array` method, why do you think he or she is invoking `call`?

Solution:
Since `arguments` is not an array we can't call `forEach` on it directly, since it is "array-like" and has indices from `0` to `length - 1` we can use it as the context for the `slice` method call on an empty array.

A more modern way to do this would be:
```js
let fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};

function outputList(...args) {
  console.log(this.title + ':');

  args.forEach(function(elem) {
    console.log(elem);
  });
}

// invoke outputList here
```
In the code above we use the rest syntax instead of `arguments`