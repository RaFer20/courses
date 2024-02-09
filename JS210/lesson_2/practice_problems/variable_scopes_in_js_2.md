Please predict the output of the following programs, and explain why they output what they do.

- Problem 1
```js
function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();
```
`undefined` The scope of variables declared with `var` is function-level, not block-level, so `a` is declared but not assigned a value.


- Problem 2
```js
function say() {
  if (false) {
    let a = 'hello from inside a block';
  }

  console.log(a);
}

say();
```
`ReferenceError: a is not defined` The scope of variables declared with `let` is block-level so `a` is not available outside of the `if` clause.


- Problem 3
```js
function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);
```
`hello`
`Uncaught ReferenceError: a is not defined`
The `a` variable is only accessible within the body of `hello()`

- Problem 4
```js
function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    let a = 'hello again';
  }
}

hello();
console.log(a);
```
`hello hello` Since `a` is not declared with `let` it is treated as a global variable.



- Problem 5
```js
var a = 'hello';

for (var index = 0; index < 5; index += 1) {
  var a = index;
}

console.log(a);
```
`4` The variable declaration on line 4 gets hoisted to the top but since a global variable `a` already exists the hoist has no effect. `a` gets reassigned new values inside the `for` loop 4 times.


- Problem 6
```js
let a = 'hello';

for (let index = 0; index < 5; index += 1) {
  let a = index;
}

console.log(a);
```
`hello` The variable on line 4 is scoped to the block. The original `a` variable gets output.



- Problem 7
```js
let a = 1;

function foo() {
  a = 2;
  let bar = function() {
    a = 3;
    return 4;
  };

  return bar();
}

console.log(foo());
console.log(a);
```
`4 3` The value of `a` changes twice inside the `foo()` function and the function itself returns `4`.


- Problem 8
```js
var a = 'global';

function checkScope() {
  var a = 'local';
  const nested = function() {
    var a = 'nested';
    let superNested = () => {
      a = 'superNested';
      return a;
    };

    return superNested();
  };

  return nested();
}

console.log(checkScope());
console.log(a);
```
`superNested global` `var` declarations are function-scoped, so each of the var declarations within this problem are declared within their own individual scope. The original global variable `a` is never reassigned.

- Problem 9
```js
let a = 'outer';
let b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}
```
`outer outer outer inner` assigning to an argument has no effect on the original argument since function arguments become local variables in the function.


- Problem 10
```js
let total = 50;
let increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);
```
`50 60 15` function parameters are locally scoped variables so the `increment` variable inside `incrementBy()` is separate from the one in the global scope.



- Problem 11
```js
let a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};
```
`outer Uncaught TypeError: setScope is not a function` line 6 tries to call `setScope` as a function but at that point it is just a declared global variable.