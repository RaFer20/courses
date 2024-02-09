# Counter
What will the following code snippets log?
Code Snippet 1:
```js
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
```
Code Snippet 2:
```js
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;
```
Code Snippet 3:
```js
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
```
Code Snippet 4:
```js
let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
```

## Solution
```js
The total value is 15  
The total value is NaN 
The total value is 15  
The total value is 15  
```
The first and third code snippets are effectively the same. Notice also, that in the first three code snippets, the variable declaration for counter is effectively overwritten by the function declaration with the same name.

In the second snippet since the assignments happen after the `console.log` call, the expression `counter * rate` evaluates to `NaN`

We can't declare a variable multiple times when one or more of those declarations use let or const. Since snippet 4 declares counter using let, it raises a SyntaxError.

Explanations:
```js
function counter(count) {
  // ...
}

var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is 15
```
```js
function counter(count) {
  // ...
}

var rate;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is NaN

counter = 5;
rate = 3;
```
```js
function counter(count) {
  // ...
}

var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is 15
```