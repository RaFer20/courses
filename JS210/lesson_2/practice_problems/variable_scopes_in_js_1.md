Please predict the output of the following programs, and explain why they output what they do.

- Problem 1:
```js
let a = 'outer';

function testScope() {
  let a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);
```
The first `console.log` outputs 'outer', the second one within the `testScope` function outputs 'inner' and the final one outputs 'outer' again. This is because the `a` local variable within the `testScope` method is shadowing the `a` variable in the outer scope.


- Problem 2:
```js
let a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);
```
This time 'outer inner inner' is output because the `a` variable get reassignes within the method's body.


- Problem 3:
```js
let basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  let shop2 = function() {
    basket = 'computer';
  };

  const shop3 = () => {
    let basket = 'play station';
    console.log(basket);
  };

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();
```
The output is 'empty play station computer'. The first log outputs the original value, `basket` gets reassigned twice by `shop1` and `shop2`, `shop3` outputs `play station` by logging a `basket` local variable. Finally `basket` outputs computer (after the two reassignments).


- Problem 4:
```js
function hello() {
  a = 'hi';
}

hello();
console.log(a);
```
'hi', `a` is available in the global scope since we didn't declare it with `let`, `var`, `const` or `function`.


- Problem 5:
```js
function hello() {
  let a = 'hello';
}

hello();
console.log(a);
```
We get an error because `a` is a local variable only available to the `hello()` function.`Uncaught ReferenceError: a is not defined`


- Problem 6:
```js
console.log(a);

var a = 1;
```
`undefined`, only the variable declaration gets hoisted, we get the output before `1` is assigned to `a`.


- Problem 7:
```js
console.log(a);

let a = 1;
```
`ReferenceError: Cannot access 'a' before initialization` Javascript knows there's an `a` variable but it is unset and cannot be accessed at the time we call `console.log(a);`


- Problem 8:
```js
console.log(a);

function hello() {
  a = 1;
}
```
`Uncaught ReferenceError: a is not defined` We defined the `hello()` function but never called it so `a` does not exist in the global scope.