# Practice Problems - IIFEs

## 1. Will the code below execute?
```js
function() {
  console.log("Sometimes, syntax isn't intuitive!")
}();
```

### Solution:
No, if we want to immediately execute a function we need to use a function expression, a function declaration will throw an error.

## 2. Edit the code from problem one so it executes without error.

### Solution:
```js
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();
```

## 3. The code below throws an error:
```js
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

sum += sum(numbers);  // ?
```
What kind of problem does this error highlight? Use an IIFE to address it, so that code runs without error.

### Solution:
```js
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];



sum += (function(array) {
  return array.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);
```

## 4. Consider the output below:
```js
countdown(7);
7
6
5
4
3
2
1
0
Done!
```
Implement a function `countdown` that uses an IIFE to generate the desired output.


### Solution:
```js
function countdown(count) {
  (function(n) {
    for (let i = n; i >= 0; i--) {
      console.log(i);
    }
    console.log('Done!')
  })(count)
};
```

## 5. Is the named function in this IIFE accessible in the global scope?
```js
(function foo() {
  console.log('Bar');
})();

foo() // ?
```

### Solution:
No, the function is not accessible in the global scope.

## 6. For an extra challenge, refactor the solution to problem 4 using recursion, bearing in mind that a named function created in an IIFE can be referenced inside of the IIFE.


### Solution:
```js
function countdown(count) {
  (function logCount(n) {
    console.log(n);
    n--;
    if (n === 0) {
    console.log('Done!');
    } else {
      logCount(n);
    }
  })(count);
}
```