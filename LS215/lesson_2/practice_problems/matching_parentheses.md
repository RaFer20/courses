# Matching Parentheses
Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

Examples
```js
isBalanced('What (is) this?');        // true
isBalanced('What is) this?');         // false
isBalanced('What (is this?');         // false
isBalanced('((What) (is this))?');    // true
isBalanced('((What)) (is this))?');   // false
isBalanced('Hey!');                   // true
isBalanced(')Hey!(');                 // false
isBalanced('What ((is))) up(');       // false
```

## Solution
```js
function isBalanced(string) {
  let count = 0;
  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === '(') {
      count += 1;
    } else if (string[i] === ')') {
      count -=1;
    }
    
    if (count < 0) return false
  }
  return count === 0;
}
```

## Futher Exploration
Can you refactor the current solution to work with the forEach method? Why does our current solution work with a for loop, but not with forEach?

The current solution does not work with forEach because it ignores the return, if we want to return false when the tally is negative we have to change how we do it.
```js
function isBalanced(string) {
  let arr = string.split('');
  let count = 0;
  let unbalanced = false;

  arr.forEach((char) => {
    if (char === '(') {
      count += 1;
    } else if (char === ')') {
      count -= 1;
    }

    if (count < 0) unbalanced = true;
  })

  if (unbalanced) return false;
  return count === 0;
}
```