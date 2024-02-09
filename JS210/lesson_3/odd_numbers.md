# Odd numbers
Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). 
All numbers should be logged on separate lines.

Example:
```js
logOddNumbers(19);

// output on console
1
3
5
7
9
11
13
15
17
19
```


## Solution
```js
function logOddNumbers(num) {
  for (let i = 1; i <= num; i++) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
};
```

## Further Exploration
For more practice, consider the following:
- You can remove the conditional inside the loop and increment `currentNumber` by 2 with each step, instead of 1. How would you write code to do that?
- Instead of a conditional that checks for odd numbers, you can write a conditional that checks for even numbers, but skips them with the `continue` statement. How would you write your code?

incrementing by 2:
```js
function logOddNumbers(num) {
  for (let i = 1; i <= num; i += 2) {
    console.log(i);
  }
};
```

continue statement:
```js
function logOddNumbers(num) {
  for (let i = 1; i <= num; i++) {
    if (i % 2 === 0) {
      continue;
    }
    console.log(i);
  }
};
```