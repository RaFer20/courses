# Understanting Recursion
```js
function populationCount(number) {
  console.log(number);
  if (number === 0) {             // base case
    return;
  }
  populationCount(number - 1);    // recursive case (and reduction step)
}

populationCount(5);
```
Every recursive function needs to have a base case. The base case acts as the stopping condition for the recursive function, similar to how we stop an iteration when a certain condition is met. When the base case is reached, the recursive function stops calling itself and returns.

The recursive case refers to the part of the recursive function where it calls itself. It allows the function to solve a larger problem by breaking it down into smaller, similar subproblems. By applying the same function to a smaller input, we move closer to reaching the base case and ultimately solve the problem.

The reduction step is the part of the recursive case where the input is modified to move closer to the base case. It ensures that each recursive call operates on a smaller version of the original problem. The reduction step is crucial for making progress towards the base case and solving the problem recursively.

# Understanding the Call Stack
The call stack can be thought of as a stack of function calls that keeps track of the order in which functions are called and their respective execution contexts. It operates on the Last-In-First-Out (LIFO) principle, meaning that the most recently added function call is the first one to be resolved and removed from the stack.

## Factorial Function
The factorial of a non-negative integer `n`, denoted as `n!`, is the product of all positive integers less than or equal to `n`. For instance, `5!` is calculated as `5 * 4 * 3 * 2 * 1 = 120`.

```js
function factorial(n) {
  if (n === 1) {
    return 1; // Base case: factorial of 1 is 1
  } else {
    return n * factorial(n - 1); // Recursive case
  }
}
```

If we were to call `factorial(3)` since it is not `1` it would trigger a recursive call to `factorial(2)`, then that would make a recursive call to `factorial(1)` which would return `1` (Since it is the base case and the last function call added to the stack). `factorial(2)` would then be resolved by multiplying `2 * 1` which would return `3`. Finally `factorial(3)` would return `3 * 2` which would give us a value of `6`.

## Stack Overflow
While recursive algorithms can be powerful, it is crucial to implement them correctly to avoid potential issues like stack overflow. A stack overflow occurs when the call stack exceeds its capacity, typically due to an infinite recursion or excessively deep recursion. When a stack overflow occurs, it means that the call stack has grown too large for the system to handle, resulting in a runtime error.


# Time and Space Complexity of Recursive Algorithms
To determine the overall time complexity we must find out the number of recursive calls and the amount of work done at each level.

## Time Complexity
Factorial Function:
```js
function factorial(n) {
  if (n === 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}
```
In the case of the factorial function, the number of multiplications is directly proportional to n because we make n recursive calls, reducing the input size by 1 each time until reaching the base case.

Thus, the time complexity of the factorial function is `O(n)`, indicating a linear growth rate with the input size. As the value of `n` increases, the number of operations and the runtime of the function increase linearly.

Fibonacci Sequence:
```js
function fibonacci(n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
```
- At each level of recursion, we make two recursive calls and perform the addition operation. This means that the work done at each level is proportional to the number of recursive calls.
- The number of recursive calls at each level follows a pattern. It doubles with each increase in level.
As the number of recursive calls doubles with each level, the time complexity can be approximated to `O(2^n)`, where `n` is the input size. This indicates exponential growth with the input size.

## Space Complexity
Factorial Function:
The space complexity is determined by the maximum depth of the recursive calls, which affects the height of the call stack. Each function call adds a new frame to the call stack, consuming memory.

As the factorial function makes recursive calls until it reaches the base case, the maximum depth of the recursive calls is equal to `n`. Therefore, the space complexity of the factorial algorithm is `O(n)`, indicating linear space usage.

Fibonacci Sequence:
When the Fibonacci algorithm is called with an input value of `n`, it doesn't make two recursive calls at once. Instead, it makes one recursive call and then proceeds to the next recursive call from within the first function call. The height of the call stack never exceeds `n`

Therefore, even if the input number is significantly large, the maximum height of the call stack remains at `N`. This implies that the space complexity is linear, denoted as `O(N)`.

# The Function Signature
This signature specifies the name of the function, the input parameters it expects, and the type of the output it should produce. It serves as a contract that defines how the function should be used and what it should return. By following the function signature, you ensure that your implementation meets the requirements of the problem.
```js
function fibonacci(num) {
  // Function implementation
}
```
The purpose of the fibonacci function is to calculate the Fibonacci sequence for the given num. The return type is not explicitly specified in the function signature because JavaScript is a dynamically typed language. However, in statically typed languages, you might see something like `function fibonacci(num: number): number`, which indicates that the function accepts a number as input and returns a number.

With a helper function we can avoid altering the function signature:
```js
function fibonacci(num) {
  return fibonacciHelper(num, {});
}

function fibonacciHelper(num, cache) {
  // Define the base case and recursive case
}
```
In this example we are using `fibonacci` as a wrapper that calls the recursive implementation of `fibonacciHelper`.
By using a helper function we can change the number of arguments or values passed to recursive calls without changing the function signature.

# Recursiong Practice Problem - Valid Palindrome String
```js
// Given a string, determine whether it is a valid palindrome or not.

// A palindrome string is a string that reads the same backwards as forwards.

// Input: "madam"
// Output: true

// Input: "abcbea"
// Output: false
```

```js
function isValidPalindrome(str) {
  if (str.length < 2) {
    return true;
  }
  return (
    str[0] === str[str.length - 1] &&
    isValidPalindrome(str.slice(1, str.length - 1))
  );
}
```
In the recursive case, we compare the first and last characters of the string (`str[0] and str[str.length - 1]`). If they are equal, we make a recursive call to the function with the substring obtained by removing the first and last characters using `str.slice(1, str.length - 1)`.

It's important to be aware that in this solution, each recursive call involves using the `slice` method to obtain a new substring. It's reasonable to assume that `slice` has a time complexity of `O(N)` and may also allocate new memory for the sliced substring.

Due to this slicing operation, the time and space complexity of the solution become `O(N^2)`. This is because, in the worst case, for each recursive call, we create a new substring that is nearly the same length as the original string. 

Using pointers instead of slice:
```js
function isValidPalindrome(str) {
  return isValidPalindromeHelper(str, 0, str.length - 1);
}

function isValidPalindromeHelper(str, start, end) {
  if (end <= start) {
    return true;
  }
  return (
    str[start] === str[end] && isValidPalindromeHelper(str, start + 1, end - 1)
  );
}
```
With this approach, we avoid the need for slicing and instead rely on efficient pointer manipulation. This results in improved time and space complexity, both of which are O(N) for the given problem.