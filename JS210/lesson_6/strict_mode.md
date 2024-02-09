# Strict Mode

## What Does it Do?
- Strict mode eliminates some silent errors that occur in sloppy mode by changing them to throw errors instead. Silent errors occur when a program does something that is unintended, but continues to run as though nothing is wrong. This can lead to incorrect results or errors much later in execution that are subsequently difficult to track down.
- Strict mode prevents some code that can inhibit JavaScript's ability to optimize a program so that it runs faster.
- Strict mode prohibits using names and syntax that may conflict with future versions of JavaScript.

These changes offer several benefits to JavaScript developers:

- They prevent or mitigate bugs.
- They help make debugging easier.
- They help your code run faster.
- They help you avoid conflicts with future changes to the language.

## Enabling Strict Mode
Strict mode is easy to turn on either at the global level of a program or at the individual function level. To enable it, add this weird bit of code to the beginning of the program file or function definition:
```js
"use strict";
```
Nested functions inherit strict mode from the surrounding scope.

*The `"use strict"` statement is an example of a pragma, a language construct that tells a compiler, interpreter, or other translator to process the code in a different way. Pragmas aren't part of the language, and often use odd syntax like `"use strict"` does.*


The "use strict" pragma must be specified at the very beginning of the file or function. You can't enable it partway through a program or function.

Global Strict Mode:
```js
"use strict";

// The rest of the program. Everything from here to the end of
// the file runs in strict mode.

function foo() {
  // strict mode is enabled here too.
}

// Strict mode is still enabled
foo();
```

Function Strict Mode:
```js
function foo() {
  'use strict';

  // The rest of the function. Everything from here to the end of
  // the function runs in strict mode.
}

// Strict mode is disabled unless you defined it globally.
foo();
```

Note that we can not enable strict mode for a block. We can only enable strict mode at the very beginning of a file or function.

**Once you enable strict mode, you can't disable it later in the same program or function.**

JavaScript enables strict mode automatically within the body of a class; there is no way to prevent that behavior. 

Strict mode is lexically scoped; that is, it only applies to the code that enables it. For instance:
```js
function foo() {
  "use strict";
  // All code here runs in strict mode
}

function bar() {
  // All code here runs in sloppy mode
  foo(); // This invocation is sloppy mode, but `foo` runs in strict mode
  // All code here runs in sloppy mode
}
```
In this example, even though `bar` runs in sloppy mode and calls `foo`, `foo` runs in strict mode. Similar behavior applies when calling a sloppy mode function from a strict mode function:
```js
function foo() {
  // All code here runs in sloppy mode
}

function bar() {
  "use strict";
  // All code here runs in strict mode
  foo(); // This invocation is strict mode, but `foo` runs in sloppy mode
  // All code here runs in strict mode
}
```

### Implicit Global Variables
JavaScript automatically creates a variable for you when you assign it to a value without first declaring the variable. For instance:
```js
function foo() {
  bar = 3.1415;
}

foo();
console.log(bar); // 3.1415
```
JavaScript defines undeclared variables like bar as global variables. No matter where your code initializes an undeclared variable, it becomes a global variable.
*we're using the term global variable a little loosely here. In actuality, JavaScript defines undeclared variables as properties of the global object. Such properties act like global variables, though*

Strict mode disables this feature by not letting you create variables without explicitly declaring them. For instance, the following program raises an error when we try to assign `bar`:
```js
"use strict";

function foo() {
  bar = 3.1415; // ReferenceError: bar is not defined
}

foo();
console.log(bar);
```
Suppose you do want to define bar as a global variable. How would you do that in strict mode?
Declare it explicitly:
```js
"use strict";

let bar;

function foo() {
  bar = 3.1415;
}

foo();
console.log(bar); // 3.1415
```

This behavior also helps identify misspelled names. If you declare a variable with one name, then later try to reassign it with a misspelled name, sloppy mode will create a new global variable. Consider this code:
```js
let aVariableWithALongName = 2.71828;

// a bunch of omitted code here

aVariab1eWithALongName = 3.14159;
console.log(aVariableWithALongName); // 2.71828; should be 3.14159
```
Misspellings can be especially hard to find in large programs that use the same name repeatedly. 


Strict mode may help you identify this problem:
```js
"use strict";

let aVariableWithALongName = 2.71828;

// a bunch of omitted code here

aVariab1eWithALongName = 3.14159; // ReferenceError: aVariab1eWithALongName is not defined
console.log(aVariableWithALongName);
```
With the addition of strict mode, it's easy to see where the problem lies. You may still have difficulty seeing the typo, but at least you know that there's a problem with that name.

Note that strict mode can't help you if both spellings are the names of declared variables:
```js
"use strict";

let all = 42;
let a11 = false;

all = true; // Did we mean a11? There's no way to tell, so no error.
```


## When Should I Use Strict Mode?
Use strict mode in any new code that you write. If you're adding new functions to an old codebase, it's safe to use function-level strict mode in the new functions, and you probably should do so. However, if you're not creating a new function in that old codebase, you probably shouldn't try to use strict mode. The changes in semantics, particularly those having to do with variable declarations, this, and silent failures, can easily break code that otherwise works well.

