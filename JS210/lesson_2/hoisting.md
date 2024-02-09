# The `var` Statement
Superficially, the var statement looks a lot like the let and const statements:
```js
var foo;
var bar = "qux";
```
The `var` statement provides no way to create constants, so that's one significant disadvantage of `var`.

## How do `var` and `let` Differ?
```js
var bar = 42;
console.log(global.bar); // 42
bar += 1;
console.log(global.bar); // 43

let foo = 86;
console.log(global.foo); // undefined
```
This example shows that using var at the top level of a program creates a property on the global object, e.g., global in Node or window in a browser. Thus, we can use global.bar to examine the value of bar. The let declaration doesn't add a new property to the global object (or any other object, for that matter). Since the property doesn't exist, we get undefined when we examine the value of global.foo.

This behavior shows that let is safer than var at the top level of a program. Placing properties on the global object may lead to conflicts and bugs; let alleviates that issue.

*If you declare a variable with var inside a function, the variable is **not** stored as a property of the global object or any other object.*
```js
function foo() {
  var bar = 42;
  console.log(global.bar); // undefined
}

foo();
```

A much more significant difference is that `let` is *block-scoped*, while `var` is *function-scoped*. 
This difference in scope can lead to unexpected behavior when using `var`:
```js
function foo() {
  if (true) {
    var a = 1;
    let b = 2;
  }

  console.log(a); // 1
  console.log(b); // ReferenceError: b is not defined
}

foo();
```

That has a peculiar side effect when we use `var`. Consider this code:
```js
function foo() {
  if (false) {
    var a = 1;
  }

  console.log(a); // undefined
}

foo();
```
Even though the code on line 3 never runs, we still create a variable named `a`. However, since the variable `a` has function scope, it still exists in the function even though we never execute the line where we declare it. Furthermore, since we're not running the initialization, `a` receives a default value of `undefined` instead of `1`. Thus, line 6 displays `undefined`.


## Sidenote
When we run our first example in the command line:
```js
var bar = 42;
console.log(global.bar);
bar += 1;
console.log(global.bar);

let foo = 86;
console.log(global.foo);
```
```js
$ node global.js
undefined
undefined
undefined
```

This time, we see undefined instead of 42 and 43 when we log the value of global.bar. This is a peculiarity of Node -- when you run a JavaScript program file with Node, Node "wraps" your code in a function that looks like this:
```js
(function (exports, require, module, __filename, __dirname) {
  // your code is here
});
```
The issue here is that your code is running from inside a function. If you declare a variable with `var` inside a function, you get a local (function-scoped) variable. You don't get a global variable. Thus, the variable doesn't get defined in `global`.

Since the Node REPL doesn't use this wrapper function, `var` declarations at the top level are stored in the global object.

**The effect of the wrapper function may sound like a bizarre edge case that won't affect you, but it probably will someday soon. If you see unexpected behavioral differences between the REPL and running a program as a file, it usually has to do the wrapper function (or the lack of it).**

## Declared Scope vs. Visibility Scope
At the top level of a program -- outside of any function -- function scope refers to the entire file. Some people use the term global scope to refer to function scope at the top level. 

However, it's important to realize that there are no declarations that explicitly create a variable in the global scope. All declarations create variables that either have function scope (var, function) or block scope (let, const, class). This can lead to some confusion. For instance, consider this top-level code:
```js
let foo = 1;
console.log(foo);
```
`foo` is in the global scope in this code. However, it's declared with block scope by the let keyword. In fact, we can say that `foo` has block scope, but, in this case, that block scope just happens to coincide with global scope. We can also say that `foo` has global scope, but it was declared with block scope.

It helps to think of scope as having two separate but related definitions. One refers to how a variable is declared -- we'll call it the declared scope -- while the other concerns the visibility of a variable -- let's call it the visibility scope. Note that we're using these terms for convenience. 

Declared scope concerns how a variable is declared: let, const, class, var, or function. The first three declare variables with block scope while the other two declare variables with function scope. Even if the variable is declared outside of a function or block, it has either block or function scope:
```js
let foo = 1;        // declared scope is block scope
var bar = 2;        // declared scope is function scope

if (true) {
  let foo = 3;      // declared scope is block scope
  var qux = 4;      // declared scope is function scope
}

function bar() {    // declared scope is function scope
  let foo = 5;      // declared scope is block scope
  var bar = 6;      // declared scope is function scope

  if (true) {
    let foo = 7;    // declared scope is block scope
    var qux = 8;    // declared scope is function scope
  }
}
```

Visibility scope concerns where a variable is visible. This can be either global scope or local scope (inside a function or a block). We will sometimes also talk about function and block scope when discussing the local visibility scope, though this is more about where the variable is visible rather than how it was declared. Thus, something declared with `let` can have function scope when talking about its visibility.
```js
let foo = 1;        // visibility scope is global
var bar = 2;        // visibility scope is global

if (true) {
  let foo = 3;      // visibility scope is local (block)
  var qux = 4;      // visibility scope is global
}

function bar() {    // visibility scope is global
  let foo = 5;      // visibility scope is local (function)
  var bar = 6;      // visibility scope is local (function)

  if (true) {
    let foo = 7;    // visibility scope is local (block)
    var qux = 8;    // visibility scope is local (function)
  }
}
```

# What is Hoisting
JavaScript engines operate in two main phases: a *creation phase* and an *execution phase*. The execution phase is when the program runs code line-by-line. That's what most people mean when they talk about a program's execution. However, before the execution phase begins, the creation phase does some preliminary work. One of those work items is to find all of the variable, function, and class declarations. That action seems to move the declarations to the top of their respective function or block: function-scoped declarations get moved to the top of the function, and block-scoped declarations get moved to the top of the block. This process is called hoisting.

The effect of this process is that all the declarations get hoisted -- raised, lifted, moved -- to the top of their defined scope. That's why the following code works:
```js
console.log(getName());

function getName() {
  return "Pete";
}
```

During the creation phase, JavaScript sees the getName function declaration and hoists it to the top of the program. Hence, the above code effectively gets rearranged as follows:
```js
function getName() {
  return "Pete";
}

console.log(getName());
```

**It's important to realize that hoisting doesn't change the program. It merely executes the program in a manner that acts as though it was changed.**

## The Temporal Dead Zone
Variables declared with the let, const, and var statements are also hoisted. There are some major differences between var and the other two:

- When a var variable is hoisted, JavaScript gives it an initial value of undefined.
- When let and const variables are hoisted, they are not given an initial value at all. Instead, they are left in an "unset" state; that is, they are "not defined". Don't say "undefined", though - that's confusing.

If you try to access the value assigned to a var variable before the original var declaration gets executed, JavaScript returns a value of undefined.
```js
console.log(bar); // undefined
var bar = 3;
console.log(bar); // 3
```

If you try to access a let or const variable, you'll get an error:
```js
console.log(foo); // ReferenceError: Cannot access 'foo' before initialization
let foo;

console.log(qux); // ReferenceError: Cannot access 'qux' before initialization
const qux = 42;
```

Such unset variables are said to be in the Temporal Dead Zone, or the TDZ.

It's interesting to note that the error message differs if you don't declare the variable at all:
```js
console.log(baz); // ReferenceError: baz is not defined
```
This demonstrates that JavaScript is aware of the foo variable in the first snippet and recognizes that it hasn't been set to a value yet. In the second snippet, it can tell that baz hasn't been declared at all, so the error message is different.

## Hoisting for Function Declarations
Function declarations have function scope. That's another way of saying that hoisting also occurs with nested functions:
```js
function foo() {
  return bar();

  function bar() {
    return 42;
  }
}
```
Even though `bar` is declared at the end of foo, we can still call `bar` at the beginning of the function. That's because hoisting makes the `bar` declaration available throughout foo.

**you shouldn't try to nest function declarations inside non-function blocks. If you must nest a function inside a block, use a function expression.**

## Hoisting for Function Expressions
Function expressions often involve assigning a function to a declared variable. Therefore, the variables obey the usual hoisting rules for variable declarations. Thus:
```js
console.log(hello());

var hello = function () {
  return 'hello world';
};
```
is equivalent to:
```js
var hello;

console.log(hello());    // raises "TypeError: hello is not a function"

hello = function () {
  return 'hello world';
};
```

## Hoisting Variable and Function Declarations
When both a variable and a function declaration exist, you can assume that the function declaration is hoisted first; that is, the function declarations are hoisted above the variable declarations. Given the following code block:
```js
bar();              // logs undefined
var foo = 'hello';

function bar() {
  console.log(foo);
}
```
the equivalent hoisted code will look like this:
```js
function bar() {
  console.log(foo);
}

var foo;

bar();          // logs undefined
foo = 'hello';
```
Given the hoisted code, the key thing to watch out for is the value that is logged. For this particular scenario, since bar uses a variable that is in the global scope, the timing of the assignment becomes relevant. It is easy to make a mistake and think that since bar was declared below the assignment of 'hello' to foo (see code before hoisting) that when bar is invoked the value logged will be 'hello' already. However, because of the hoisting rules for variable and function declaration foo is still undefined when bar is invoked.

Consider what happens when a var variable and a function have the same name:
Example1
```js
bar();             // logs "world"
var bar = 'hello';

function bar() {
  console.log('world');
}
```
Example2
```js
var bar = 'hello';
bar();             // raises "TypeError: bar is not a function"

function bar() {
  console.log('world');
}
```

A slight change in code results in a significant change in the outcome. Let's look at the hoisted version of the two code snippets:
```js
function bar() {
  console.log('world');
}

bar();
bar = 'hello';
```
```js
function bar() {
  console.log('world');
}

bar = 'hello';
bar();
```
Since function declarations are hoisted first, the variable declaration of the same name becomes redundant (notice that there is no longer a var `bar` in the code snippets). Since the variable declaration is redundant, what remains is the reassignment. Being a reassignment, this becomes a problem for snippet2, since `bar` will no longer be of type function, and therefore results in an error when we try to invoke `bar`.


**You can't declare a let or const variable and a function with the same name:**
```js
let foo = 3;
function foo() {}; // SyntaxError: Identifier 'foo' has already been declared
```
```js
function foo() {};
let foo = 3;  // SyntaxError: Identifier 'foo' has already been declared
```

## Best Practices to Avoid Confusion

- Whenever possible, use let and const instead of var: avoid the confusion and subtle behaviors that can occur with var.

- If you must use var, declare all of the variables at the top of the scope:
```js
function foo() {
  var a = 1;
  var b = 'hello';
  var c;

  …
}
```

- If you can use let and const, declare them as close to their first usage as possible:
```js
function foo(bar) {
  console.log("Hello world!");

  let result;
  if (bar) {
    let squaredBar = bar * bar;
    result = squaredBar + bar;
  } else {
    result = "bar hasn't been set";
  }

  return result;
}

console.log(foo(3));           // 12
console.log(foo(undefined));   // bar hasn't been set
```

- Declare functions before calling them:
```js
function foo() {
  return 'hello';
}

foo();
```

## Hoisting isn't Real
Hoisting is really just a mental model that almost all JavaScript developers use to explain how scope works. There is no actual process that happens in JavaScript that is called hoisting. Until fairly recently, it wasn't even mentioned in the ECMAScript standards, and even now, it's barely mentioned in passing. What's more, the mental model of hoisting is not perfect -- there are edge cases that aren't properly explained by hoisting.

The behavior that we try to explain with hoisting is merely a consequence of JavaScript's two phases: the creation phase and execution phase. The creation phase prepares your code for execution. Each time it encounters a variable, function, or class declaration, it adds that identifier to the current scope. Depending on the declaration and where the declaration occurs, the identifier gets added to either the global scope or the local scope (which may be either a function or a block). Thus, at the end of the creation phase, JavaScript knows all of the identifiers in your program and what scopes each one belongs to.

When the execution phase occurs, JavaScript no longer cares about declarations. It does care about initialization and function/class definitions, but not the declarations themselves. The identifiers are already known, and their scope is already known. JavaScript merely needs to look up the identifiers as needed.

```js
let foo = "hello";

function foo() {
  console.log("hello");
}
```
If you said that the foo function on lines 3-5 was hoisted above the variable declaration on line 1, you might expect that the code on line 1 would raise a SyntaxError error complaining that the identifier foo already exists.

That's not what happens, though. Syntax errors usually occur during the creation phase -- before "hoisting" has an effect on the code. Since processing occurs from the top down during the creation phase, the first identifier found is the foo variable on line 1. When the creation phase reaches the function declaration on lines 3-5, JavaScript already knows about the foo identifier, so it complains that foo has already been declared. The error occurs on line 3, not line 1.

Let's reverse those declarations:
```js
function foo() {
  console.log("hello");
}

let foo = "hello";
```
This time, the foo function is seen first during the creation phase, so the error doesn't occur until JavaScript reaches line 5.