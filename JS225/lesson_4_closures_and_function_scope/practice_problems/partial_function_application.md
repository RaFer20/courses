# Practice Problems - Partial Function Application

## 1. Use partial function application to implement a function, `makeSub`, that returns a function that subtracts `5` from the argument passed to the return function.
```js
function subtract(a, b) {
  return a - b;
}

function makeSub() {
  // implement this function using partial function application
}

const sub5 = makeSub();

sub5(10); // 5
sub5(20); // 15
```

### Solution:
```js
function makeSub() {
  return function(arg) {
    return subtract(arg, 5);
  }
}
```

## 2. This code is a bit limited however, because we can only subtract by `5`. Implement the `makeSubN` function below so that we can supply any value we want to be subtracted from `a`, and get a new function that will always subtract this value.
```js
function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  // implement this function using partial function application
}

const sub4 = makeSubN(4);
const sub7 = makeSubN(7);

sub4(10); // 6
sub4(20); // 16
sub7(10); // 3
sub7(20); // 13
```

### Solution:
```js
function makeSubN(n) {
  return function(a) {
    return subtract(a, n);
  }
}
```

## 3. Although the solution above is more flexible, we now want to be able to supply any operation, not just subtraction. Implement `makePartialFunc` below.
```js
function makePartialFunc(func, b) {
  // implement this function...
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

let multiplyBy5 = makePartialFunc(multiply, 5);
let divideBy2 = makePartialFunc(divide, 2);

multiplyBy5(100); // 500
divideBy2(100); // 50
```

### Solution:
```js
function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  }
}
```

## 4. In our previous solution, `multiplyBy5` retains access to `func` and `b` long after `makePartialFunc` has finished execution. What makes this possible?

### Solution:
Closures, when a new function is created, it retains access to any variables that are defined in the function's outer scope.

## 5. Consider the code below:
```js
let subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  // implement this function...
}

let mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// => Math:
// => Fatima
// => Gary
// => Susan
```
Implement `makeMathRollCall` such that it returns a partially applied `rollCall` function, with the subject as `'Math'`.


### Solution:
```js
function makeMathRollCall() {
  return function(students) {
    return rollCall('Math', students);
  }
}
```
