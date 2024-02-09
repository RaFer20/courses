# Conditionals
Example:
```js
let a = prompt('Enter a number');

if (a === '3') {
  console.log("a is 3");
} else if (a === '4') {
  console.log("a is 4");
} else {
  console.log("a is neither 3, nor 4");
}
```

More Examples:
```js
if (x === 3) {                          // Example 1
  console.log("x is 3");
}

if (x === 3) {                          // Example 2
  console.log("x is 3");
} else {
  console.log("x is NOT 3");
}

if (x === 3) console.log("x is 3");     // Example 3

if (x === 3)                            // Example 4
  console.log("x is 3");

if (x === 3)                            // Example 5
  console.log("x is 3");
else
  console.log("x is NOT 3");

if (x === 3) {                          // Example 6
  console.log('x is 3');
} else {
  if (x === 4) {
    console.log('x is 4');
  } else {
    console.log('x is NOT 3 or 4');
  }
}

if (x === 3) {                          // Example 7
  console.log("x is 3");
} else if (x === 4) {
  console.log("x is 4");
} else {
  console.log('x is NOT 3 or 4');
}
```

# Comparisons
The expressions or values that an operator uses are its operands. In comparisons, the expressions to the left and right of the operator are the operands. For instance, the equality comparison `x === y` uses the `===` operator with two operands: `x` and `y`.

## ===
The strict equality operator, also known as the identity operator, returns `true` when the operands have the same type and value, `false` otherwise. 
```js
> 5 === 5
= true

> 5 === 4
= false

> 'abc' === 'abc'
= true

> 'abc' === 'abcd'
= false

> 'abc' === 'aBc'
= false

> '5' === '5'
= true

> '5' === '6'
= false

> 5 === '5'
= false

> '' === 0
= false
```

## !==
The strict inequality operator returns `false` when the operands have the same type and value, `true` otherwise. Note that `!==` is the inverse of `===`: when `===` returns `true`, `!==` returns `false`, and vice versa.
```js
// Compare with the `===` examples.

> 5 !== 5
= false

> 5 !== 4
= true

> 4 !== 156
= true

> 'abc' !== 'def'
= true

> 'abc' !== 'aBc'
= true

> 5 !== '5'
= true
```

## ==
The non-strict equality operator, also known as the loose equality operator, is similar to `===`. However, when the operands have different types, `==` attempts to coerce one of the operands to the other operand's type before it compares them, and it may coerce both operands in some cases. The result is `true` when the final values are the same, `false` otherwise. 

When we compare the number `5` to the string `'5'` using `==`, we get `true`; with `===`, we get `false`.
```js
// Compare with the `===` examples.

> 5 == 5
= true

> 5 == 4
= false

> 5 == '5'
= true

> '' == 0
= true
```

## !=
The non-strict inequality operator, also known as the loose inequality operator, is similar to `!==`. However, when the operands have different types, `!=` attempts to coerce one of the operands to the other operand's type before it compares them, and it may coerce both operands in some cases. The result is `false` when the final values are the same, `true` otherwise.
```js
// Compare with the `==` and `!==` examples.

> 5 != 5
= false

> 5 != 4
= true

> 5 != '5'
= false

> '' != 0
= false
```

## <
The less than operator returns `true` when the value of the left operand has a value that is less than the value of the right operand, `false` otherwise.

```js
> 4 < 5
= true

> 5 < 4
= false

> 5 < 5
= false

> "4" < "5"
= true

> "42" < "402"
= false

> "42" < "420"
= true

> "42" < 420
= true
```

*When comparing strings, the comparison is character-by-character. JavaScript moves from left-to-right in the strings looking for the first character that is different from its counterpart in the other string. Once it finds a character that differs, it compares that character with its counterpart, and makes a decision based on that. If both strings are equal up to the length of the shorter string as in the next to last example, then the shorter string is considered less than the longer string.*

## >
The greater than operator returns `true` when the value of the left operand has a value that is greater than the value of the right operand, `false` otherwise.
```js
// Compare with the `<` examples.

> 4 > 5
= false

> 5 > 4
= true

> 5 > 5
= false

> "4" > "5"
= false

> "42" > "402"
= true

> "42" > "420"
= false

> "42" > 420
= false
```

## <=
The less than or equal to operator returns `true` when the value of the left operand has a value that is less than or equal to the value of the right operand, `false` otherwise.
```js
// Compare with the `<` examples.

> 4 <= 5
= true

> 5 <= 4
= false

> 5 <= 5
= true
```

## >=
The greater than or equal to operator returns `true` when the value of the left operand has a value that is greater than or equal to the value of the right operand, `false` otherwise.
```js
// Compare with the `>` examples.

> 4 >= 5
= false

> 5 >= 4
= true

> 5 >= 5
= true
```

# Logical Operators
The `!`, `&&`, and `||` logical operators provide the ability to combine conditions

## !
The `not` operator returns `true` when its operand is `false` and returns `false` when the operand is `true`. That is, it negates its operand.
```js
> !true
= false

> !false
= true

> !(4 === 4)
= false

> !(4 !== 4)
= true
```

## &&
The `and` operator returns `true` when both operands are `true` and `false` when either operand is `false`.
```js
> true && true
= true

> true && false
= false

> false && true
= false

> false && false
= false

> (4 === 4) && (5 === 5)
= true

> (4 === 4) && (5 === 6)
= false

> (4 === 5) && (5 === 5)
= false

> (4 === 5) && (5 === 6)
= false
```

## ||
The or operator returns `true` when either operand is `true` and `false` when both operands are `false`.
```js
> true || true
= true

> true || false
= true

> false || true
= true

> false || false
= false

> (4 === 4) || (5 === 5)
= true

> (4 === 4) || (5 === 6)
= true

> (4 === 5) || (5 === 5)
= true

> (4 === 5) || (5 === 6)
= false
```

# Short Circuits
The `&&`and `||` operators both use a mechanism called short circuit evaluation to evaluate their operands. Consider these two expressions:
```js
> isRed(item) && isPortable(item)
> isGreen(item) || hasWheels(item)
```
The first expression returns `true` when item is both red and portable. If either condition is `false`, then the overall result must be `false`. If the first condition is false the expression doesn't need to call `isPortable()` since the entire expression is already `false`.

The second expression returns `true` when item is either green or has wheels. When either condition is `true`, the overall result must be `true`. Thus, if the program determines that item is green, it doesn't have to check whether it has wheels.

# Truthiness
JavaScript can coerce any value to a boolean value, and that's what it does in conditional contexts like the if statement.

```js
let a = 5
if (a) {
  console.log("how can this be true?");
} else {
  console.log("it is not true");
}

let b = 0
if (b) {
  console.log("how can this be true?");
} else {
  console.log("it is not true");
}
```
The first example logs "how can this be true?" while the second logs "it is not true." This works since JavaScript coerces the value `5` to `true`, and the value `0` to `false`. We often say that the expression 'evaluates as' or 'evaluates to' `true` or `false`.

```js
let x;

if (x = 5) {
  console.log("how can this be true?");
} else {
  console.log("it is not true");
}
```
The above code doesn't test whether `x` is equal to `5`. Instead, it assigns the variable `x` to `5`, then evaluates the assignment's return value (`5`) as a boolean. Here, `5` evaluates as true when it appears in a boolean expression.

JavaScript treats the following values as false:
- `false`
- The number `0`
 - 0: The ordinary zero value.
 - 0: A negative zero. That's mathematical nonsense, but a real thing in JavaScript.
 - 0n: The BigInt version of zero.
- An empty string ('')
- `undefined`
- `null`
- `NaN`

Everything else evaluates as `true`

The `&&` and `||` logical operators use short-circuit evaluation. These operators work with truthy and falsy values too, and they can also return truthy values instead of boolean values. When using `&&` and `||,` the return value is always the value of the operand evaluated last:
```js
> 3 && 'foo'  // last evaluated operand is 'foo'
= 'foo'

> 'foo' && 3  // last evaluated operand is 3
= 3

> 0 && 'foo'  // last evaluated operand is 0
= 0

> 'foo' && 0  // last evaluated operand is 0
= 0

> 3 || 'foo'  // last evaluated operand is 3
= 3

> 'foo' || 3  // last evaluated operand is 'foo'
= 'foo'

> 0 || 'foo'  // last evaluated operand is 'foo'
= 'foo'

> 'foo' || 0  // last evaluated operand is 'foo'
= 'foo'

> '' || 0     // last evaluated operand is 0
= 0
```

Suppose you have an expression of some kind that returns a value that is either truthy or falsy, but isn't a boolean value:
```js
let foo = null;
let bar = 'qux';
let isOk = foo || bar;
```
In this code, isOk gets set to a truthy value of "qux". In most cases, you can use "qux" as though it were actually a boolean true value. However, using a string value as though it is a boolean isn't the clearest way to write your code. 

```js
// if statement
let isOk;
if (foo || bar) {
  isOk = true;
} else {
  isOk = false;
}

// ternary expression
let isOk = (foo || bar) ? true : false;
```

Either of those snippets sets isOk to an appropriate boolean value. However, they do so in a somewhat wordy manner. Many JavaScript programmers use a more concise coercion by using what looks like a !! operator:
```js
let isOk = !!(foo || bar);
```

`!!` isn't a separate operator in JavaScript. Instead, it's two consecutive ! operators. The expression `!!a` is equivalent to writing `!(!a)`. The inner `!` converts the value of a to `false` if it is truthy, or `true` if a is falsy. The outer `!` then flips `true` to `false` or `false` to `true`.

```js
> !!3    // 3 is truthy, !3 is false, !false is true
= true

> !!''   // '' is falsy, !'' is true, !true is false
= false
```

# Nullish Coalescing Operator
The nullish coalescing operator evaluates to the right-hand operand if the left-hand operand is nullish (either `null` or `undefined`). Otherwise, it evaluates to the value of the left-hand operand.
```js
> null ?? "over here!"
= 'over here!'

> undefined ?? "pick me!"
= 'pick me!'

> false ?? "not me"
= false

> 0 ?? "not me either"
= 0
```

This is similar to the`|| operator, but there's an important difference:

- `||` will return the right-hand operand if the left operand is a falsy value.
- `??` will return the right-hand operand if the left operand is nullish.

The nullish coalescing operator will short-circuit if the left operand is not nullish:
```js
> null ?? "over here!"    // does not short-circuit
= 'over here!

> undefined ?? "pick me!" // does not short-circuit
= 'pick me!'

> false ?? "not me"       // short-circuits
= false

> 0 ?? "not me either"    // short-circuits
= 0
```

`??` is most useful when dealing with code that could result in undefined or null, and you want to handle the situation gracefully:
```js
function foo(str) {
  let found = ["Pete", "Alli", "Chris"].find(name => name === str);
  return found ?? "Not found";
}

console.log(foo("Alli"));     // => Alli
console.log(foo("Allison"));  // => Not found
```


## Operator Precedence
JavaScript has a set of precedence rules it uses to evaluate expressions that use multiple operators and sub-expressions. The following is a list of the comparison operations from the highest precedence (top) to lowest (bottom).

- <=, <, >, >= - Comparison
- ===, !==, ==, != - Equality
- ===, !==, ==, != - Equality
- || - Logical OR

Example:
```js
if (x || y && z) {
  // do something
}
```
The program first evaluates the `y && z` sub-expression since `&&` has higher precedence than `||.` It then takes the result of that evaluation and evaluates `x || result`.


We can use parentheses to override the precedence: sub-expressions in parentheses get evaluated before un-parenthesized expressions at the same depth in the main expression:
```js
if ((x || y) && z) {
  // do something
}
```
In this code, `x || y` gets evaluated first, and then `result && z`.

# The Ternary Operator
The ternary operator is a quick and easy way to write a short, concise, and simple `if/else` conditional. It uses a combination of the `?` and `:` symbols and takes 3 operands (hence, the name "ternary"):
```js
> 1 == 1 ? 'this is true' : 'this is not true'
= 'this is true'

> 1 == 0 ? "this is true" : "this is not true"
= 'this is not true'
```

The biggest advantage that the ternary operator has over an `if/else` statement is that the entire structure is an expression. What that means is that we can treat the ternary expression as a value: we can assign it to a variable, pass it as an argument, and so on. Since `if/else` is a statement, we can't capture its result to a variable.

```js
> let message = true ? 'this is true' : 'this is not true'
= undefined

> message
= 'this is true'

> console.log(false ? 'this is true' : 'this is not true')
this is not true
= undefined
```

All of the following are good examples of using a ternary expression:
```js
let foo = hitchhiker ? 42 : 3.1415;    // Assign result of ?: to a variable
console.log(hitchhiker ? 42 : 3.1415); // Pass result as argument
return hitchhiker ? 42: 3.1415;        // Return result
```
However, the following snippets use ternaries that choose between actions, and should be considered inappropriate uses:
```js
hitchhiker ? foo = 42 : bar = 3.1415;               // Setting variables
hitchhiker ? console.log(42) : console.log(3.1415); // Printing
```

# Switch Statement
A switch statement is similar to an `if` statement, but it has a different interface. It compares a single value against multiple values for strict equality (as with the `===` operator), whereas `if` can test multiple expressions with any condition.

Switch statements use the reserved words `switch`, `case`, `default`, and `break`.
```js
let a = 5;

switch (a) {
  case 5:
    console.log('a is 5');
    break;
  case 6:
    console.log('a is 6');
    break;
  default:
    console.log('a is neither 5, nor 6');
    break;
} // => a is 5
```

This example is functionally identical to the following if/else statement:
```js
let a = 5;

if (a === 5) {
  console.log('a is 5');
} else if (a === 6) {
  console.log('a is 6');
} else {
  console.log('a is neither 5, nor 6');
} // => a is 5
```

The `break` statement in each case is crucial. Without a `break`, execution "falls through" to the next case clause.

There are use cases where fall-throughs. For instance, suppose you want to execute the same action for two or more cases:
```js
let a = 5;

switch (a) {
  case 5:
  case 6:
  case 7:
    // executed if a is 5, 6, or 7
    console.log("a is either 5, 6, or 7");
    break;
  case 8:
  case 9:
    // executed if a is 8 or 9
    console.log('a is 8 or 9');
    break;
  default:
    // executed if a is anything else
    console.log('a is not 5, 6, 7, 8, or 9');
    break;
}
```