# Function Declarations
```js
function hello() {
  return 'hello world!';
}

console.log(typeof hello);    // function
```
A function declaration (sometimes called a "function statement") defines a variable (in this case, hello) whose type is function. It does not require assignment to a variable. The value of the function variable is the function itself. This "functional variable" obeys general scoping rules, and we can use it exactly like other JavaScript variables.

```js
function outer() {
  function hello() {
    return 'hello world!';
  }

  return hello();
}

console.log(typeof hello);    // can't access a local scope from here

const foo = outer;            // assign the function to a constant
foo();                        // we can then use it to invoke the function
```
Function declarations are similar to variable declarations. Just as variable declarations must start with `let` or `const`, function declarations must start with `function`.

**It is important to realize that a function declaration not only creates a function, but also creates a variable.**
```js
let stringVar = 'string value';
let numberVar = 42;                  // number value

function functionVar() {
  return 'function reference';
}

console.log(typeof stringVar);       // string
console.log(typeof numberVar);       // number
console.log(typeof functionVar);     // function

// Reassignment works as expected:
stringVar   = functionVar;           // `stringVar` now references a function
functionVar = 'string value';        // `functionVar` now contains a string

console.log(typeof stringVar);       // function
console.log(typeof functionVar);     // string
```

# Function Expressions
A function expression defines a function as part of a larger expression syntax (typically a variable assignment).
```js
const hello = function () {   // We can also use let instead of const
  return 'hello';
};

console.log(typeof hello);    // function
console.log(hello());         // hello
```


```js
let foo = function () {
  return function () {   // function expression as return value
    return 1;
  };
};

let bar = foo();         // bar is assigned to the returned function

bar();                   // 1
```
*Many developers refer to anonymous functions by the name of the variable to which it is assigned. For instance, instead of saying the "anonymous function assigned to foo returns..", we can instead say the "function foo returns..".*

## Named Function Expressions
```js
let hello = function foo() {
  console.log(typeof foo);   // function
};

hello();

foo();                       // Uncaught ReferenceError: foo is not defined
```
The function's name, `foo`, is only available inside the function (i.e., it can only be used from within the function's local scope). With named function expressions, the name of the function is contained within its own scope (i.e., inside the variable `hello`).

Function expressions are useful for debugging. The debugger can show the function's name in the call stack, providing a valuable clue. Named function expressions can also be useful for recursive functions.

Named function expressions can look very similar to function declarations, but there is an easy way to differentiate between the two: if a statement begins with the function keyword, then it is a function declaration; otherwise, it is a function expression.

In the following code, we can see that even a minor change (adding parentheses) is enough to turn a function declaration into a function expression:
```js
function foo() {
  console.log('function declaration');
}

(function bar() {
  console.log('function expression');
});

foo();    // function declaration
bar();    // Uncaught ReferenceError: bar is not defined
```

A function defined using a function declaration must always have a name (it cannot be an anonymous function). In addition to creating a named function, a function declaration also creates a variable with the same name as that function's name. For example, the following two function definitions both define a named function and a variable with the same name as that function.
```js
let foo = function foo() {
  return 'a named function expression assigned to a variable';
};

function bar() {
  return 'a function declaration';
}
```

# Arrow Functions
We can think of arrow functions as a shorthand way to write a function expression.

```js
const multiply = function(a, b) {
  return a * b;
};
```
We can rewrite this definition using arrow function syntax:
```js
const multiply = (a, b) => {
  return a * b;
};
```
We can make two more small modifications to an arrow function when its body only has one line.
First, we can eliminate the braces and write the entire function on a single line:
```js
const multiply = (a, b) => return a * b;
```
We can also eliminate the return keyword in this situation:
```js
const multiply = (a, b) => a * b;
```

Arrow functions are most often used as **callback functions**. For instance, suppose we have the following code:
```js
[1, 2, 3].map(function (element) {
  return 2 * element;
}); // returns [2, 4, 6]
```
In this case, the function passed to map is our callback function. We can simplify this somewhat verbose code by replacing the callback with an arrow function:
```js
[1, 2, 3].map((element) => 2 * element); // returns [2, 4, 6]
```
When writing an arrow function that only has one parameter, you can omit the parentheses from the parameter list:
```js
[1, 2, 3].map(element => 2 * element); // returns [2, 4, 6]
```
Arrow functions also have another use that makes them immensely popular: they inherit the "execution context" from the surrounding code. 