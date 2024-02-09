In the previous exercise, we developed a recursive solution for computing the nth Fibonacci number. In a language that is not optimized for recursion, some (but not all) recursive functions can be extremely slow and may require massive quantities of memory and/or stack space. If you tested for bigger nth numbers, you might have noticed that getting the 50th fibonacci number already takes a significant amount of time.

Fortunately, every recursive function can be rewritten as a non-recursive (or procedural) function.

Rewrite your recursive fibonacci function so that it computes its results without using recursion.

Examples:
```js
fibonacci(20);       // 6765
fibonacci(50);       // 12586269025
fibonacci(75);       // 2111485077978050
```
Note that JavaScript can accurately compute integers up to 16 digits long; this means that fibonacci(78) is the largest Fibonacci number that you can accurately compute with simple operations in JavaScript.

# Solution
```js
function fibonacci(n) {
  if (n <= 2) return 1;
  let first = 1;
  let second = 1;
  let counter = 3;
  let fibonacci;

  while (counter <= n) {
    fibonacci = first + second;
    counter += 1;
    first = second;
    second = fibonacci;
  };

  return fibonacci;
}
```

Alternative:
```js
function fibonacci(nth) {
  let previousTwo = [1, 1];

  for (let counter = 3; counter <= nth; counter += 1) {
    previousTwo = [previousTwo[1], previousTwo[0] + previousTwo[1]];
  }

  return previousTwo[1];
}
```