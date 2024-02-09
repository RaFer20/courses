Our recursive fibonacci function from the previous exercise is not very efficient. It starts slowing down with an nth argument value as low as 35. One way to improve the performance of our recursive fibonacci function (and other recursive functions) is to use memoization.

Memoization is an approach that involves saving a computed answer for future reuse, instead of computing it from scratch every time it is needed. In the case of our recursive fibonacci function, using memoization saves calls to fibonacci(nth - 2) because the necessary values have already been computed by the recursive calls to fibonacci(nth - 1).

For this exercise, your objective is to refactor the recursive fibonacci function to use memoization.


# Solution
```js
const memo = {};

function fibonacci(n) {
  if (memo[n]) return memo[n]
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

  memo[n] = fibonacci
  return fibonacci;
}
```

Alternative:
```js
const memo = {};

function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  } else {
    if (memo[nth]) {
      return memo[nth];
    } else {
      memo[nth] = fibonacci(nth - 1) + fibonacci(nth - 2);
      return memo[nth];
    }
  }
}
```