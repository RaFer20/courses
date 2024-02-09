1. Set a variable, `apples`, to 3. Set a second variable, `bananas`, to 5. Write a conditional using `==` that checks whether apples is equal to `bananas`. Log a message if true.
Solution
```js
let apples = 3;
let bananas = 5;

if (apples == bananas) {
  console.log('Equal!');
}
```

2. Set the value of `bananas` to the string value "3". Use the same conditional as the previous problem.
Solution
```js
let apples = 3;
let bananas = '3';

if (apples == bananas) {
  console.log('Equal!');
}
```

3. Change the conditional from the previous practice problem to use `===` instead. Why doesn't this one output a message?
Solution
```js
if (apples === bananas) {
  console.log('Strict Equal!');
}
```

4. Write an `else` clause that logs a different message if false.
Solution
```js
if (apples === bananas) {
  console.log('Strict Equal!');
} else {
  console.log('Not Strictly Equal :(');
}
```

5. Between the `if` and `else` clauses, insert an `else if` clause that checks whether `apples == bananas`. Log a message stating that the two are the same number but different types.
Solution
```js
if (apples === bananas) {
  console.log('Strict Equal!');
} else if (apples == bananas) {
  console.log('Same Number But Different Type');
} else {
  console.log('Not Strictly Equal :(');
}
```

6. Move the `else if` clause into the `else` clause and change it to an `if` statement. After your `if` statement, append an `else` clause that outputs your "not strictly equal" message as before. The structure of the code should look like:
```js
else {
  if (…) {
    …
  }
  else {
    …
  }
}
```
Solution
```js
if (apples === bananas) {
  console.log('Strict Equal!');
} else {
  if (apples == bananas) {
    console.log('Same Number But Different Type');
  } else {
    console.log('Not Strictly Equal :(');
  }
}
```

7. Set the variables `apples` and `bananas` to 3. Set a variable, `areEqual`, to the value of `apples` compared to `bananas`. This works the same way as the `if` statements we have been writing, but instead of an `if` and the condition in parentheses, we just use the condition from within the parentheses as the new value for our variable. Log the value of `areEqual`.
Solution
```js
apples = 3;
bananas = 3;
let areEqual = (apples === bananas);

console.log(areEqual);
```

8. Set the value of `apples` to 3 and `bananas` to `undefined`. Set a variable named `eitherOr` to the value of `apples` or `bananas`. This works the same as the previous problem, where you write the comparison as the assignment of the variable. Log the value of `eitherOr`.
Solution
```js
apples = 3;
bananas = undefined;
let eitherOr = (apples || bananas);

console.log(eitherOr);
```

9. Set the value of `bananas` to 1. Perform the same assignment for `eitherOr`. Log the value of `eitherOr`. Afterward, assign `bananas || apples` to the `eitherOr` variable. Note that the value is now the `bananas` variable instead of `apples`. JavaScript reads this statement from left to right. If the left-side has a truthy value, it is used. Otherwise, the right-side value is used.
Solution
```js
apples = 3;
bananas = 1;
eitherOr = (apples || bananas);

console.log(eitherOr);
eitherOr = (bananas || apples);
console.log(eitherOr);
```

10. Create two new variables, `lastName` and `familyMessage`. Set `lastName` to your last name, then use a ternary that checks whether `lastName` is equal to your last name to set `familyMessage` to either "You're part of the family!" or "You're not family."
The ternary operator is another useful method for defining a variable to one of two possible values. This can also replace an if and else statement, but can sometimes be confusing when used that way.
Solution
```js
let lastName = 'Fernandez'
let familyMessage = lastName === 'Fernandez' ? "You're part of the family!" : "You're not family.";
```