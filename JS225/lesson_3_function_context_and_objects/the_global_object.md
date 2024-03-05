# The Global Object
JavaScript creates a global object when it starts running, which serves as the implicit execution context. In the browser, the global object is the `window` object. We can investigate this in your browser's console:
```js
window          //  Window { ... }
```

global entities are properties of the global object. In our console, we can look at the window object to examine those properties.
```js
window.isNaN;      // function isNaN() { ... }
window.Infinity;   // Infinity
```

As with other JavaScript objects, we can add properties to the global object at any time:
```js
window.foo = 1;
window.foo;       // 1
```

# Global Object as Implicit Context
When we evaluate expression, the global object is the implicit context.

```js
foo = 1;
foo;              // 1
```
For example, in the code above, even though we aren't using the `let`, `var`, or `const` keyword, the code works since JavaScript gives `foo` an implicit evaluation context: the global object. Thus, the first line is the same as `window.foo = 1`, which assigns the property `foo` on the global object with a value of `1`.

On line 2, JavaScript finds `foo` in the implicit context of the global object. As a result, line 2 is identical to `window.foo`; it returns the value of the property `foo` from the global object.

# Global Variables and Function Declarations
When we declare global variables with var or functions, JavaScript adds them to the global object as properties. We can verify this by examining the `window` object:
```js
foo = 1;
var moreFoo = 3;
let evenMoreFoo = 42;

function bar() {
  return 1;
}

console.log(window.foo);           // 1
console.log(window.moreFoo);       // 3
console.log(window.evenMoreFoo);   // undefined
console.log(window.bar);           // function bar() { return 1; }
```

There's a subtle but significant difference when comparing variables declared with `var` and those that are not declared: we can delete global variables that we don't declare, but not those that we did.
```js
foo = 1;
var moreFoo = 3;

function bar() {
  return 7;
}

delete window.foo;         // deleted
delete window.moreFoo;     // not deleted
delete window.bar;         // not deleted

console.log(window.bar());                         // 7
console.log(window.foo);                           // undefined
console.log(window.hasOwnProperty("foo"));         // false
console.log(window.moreFoo);                       // 3
```

**In non-browser JavaScript environments, such as Node, the global object is not `window`, but `global`.**
Node introduces an additional "module" scope. Variables in the module scope are those declared at the top level (not inside a function definition or object) of a node.js file. Consequently, module-scoped variables are not added to the global object, `global`. Module-scoped variables are only accessible from within the file but not accessible anywhere else. 

Node wraps files in this odd looking function:
```js
(function (exports, require, module, __filename, __dirname) {
   // your code is here
});
```
That means all of your variables and functions in Node programs have function scope. The execution context for your top-level program in Node is the empty object, `{}`. That fact often surprises developers that are new to Node.

# Strict Mode and The Global Object
In strict mode, the global object is not used as the implicit context. Instead, the implicit context is `undefined`:
```js
"use strict";

oneFoo = 1;        // Uncaught ReferenceError: oneFoo is not defined
oneFoo;
```
We cannot access variables that haven't been declared. Among other things, this guards against misspellings adding new properties to the global object:
```js
let color = 'blue';

// other code

colr = 'red'

color           // "blue"
window.colr     // "red"
```
In the code snippet above we intended to reassign the variable `color` from `'blue'` to `'red'`. However the `colr` misspelling has instead created a new global variable.

In strict mode, the misspelling would have been checked and resulted in an error as shown below.
```js
"use strict"

let color = 'blue';

// other code

colr = 'red'    // Uncaught ReferenceError: colr is not defined
```