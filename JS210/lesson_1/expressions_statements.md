# Expressions
An expression is any valid code that resolves to a value.
```js
'hello';   // a single string is an expression
10 + 13;   // arithmetic operations are expressions
sum = 10;  // assignments are expressions
```
The most common expression types are:

Arithmetic: these are expressions that evaluate to a number (i.e. `10 + 13`)
String: these are expressions that evaluate to a character string (i.e. `'Hello' + ', World'`)
Logical: these are expressions that evaluate to `true` or `false` (i.e `10 > 9`)

# Operator Precedence

```js
3 + 3 * 4;    // 15
(3 + 3) * 4;  // 24
```

Parentheses can enclose any expression, including function calls.

# Increment and Decrement Operators in Expressions
The increment (`++`) and decrement (`--`) operators increment or decrement their operands by `1`. The operator may appear either before (prefix) or after (postfix) the operand. When used as a standalone expression, it doesn't matter which form you use:
```js
let a = 1;
a++;        // same as "a = a + 1"; a is now 2
++a;        // same as "a = a + 1"; a is now 3
a--;        // same as "a = a - 1"; a is now 2
--a;        // same as "a = a - 1"; a is now 1
```
The prefix and postfix forms behave differently if they are part of a more complex expression:
- If the operator appears after the operand, JavaScript evaluates the expression, then modifies the operand.
- If the operator appears before the operand, JavaScript modifies the operand, then evaluates the expression.
```js
let a;
let b;
let c;

a = 1;
b = a++;  // equivalent to "b = a; a += 1;". so now b is 1 and a is 2
c = ++a;  // equivalent to "a += 1; c = a;". so now c is 3 and a is 3
```

# Logical Short Circuit Evaluation in Expressions
```js
let a = true;
let b = false;

a || (b = true);  // b is still false after this, because (b = true) is never evaluated
b && (a = 1);     // a is still true after this, because (a = 1) is never evaluated
```

# Statements
Unlike expressions, statements in JavaScript don't resolve to useful values. Instead, they control the execution of the program. For example, variable assignments are expressions, but variable declarations are statements:
```js
let a;                // a statement to declare variables
let b;
let c;
let d = (a = 1);      // this works, because assignments are expressions too
let e = (let f = 1);  // this gives an error, since a statement can't be used
                      // as part of an expression
```
Statements help to "do something", instead of giving you a value to use.

Statements don't evaluate to values. This means that you cannot use a statement as part of an expression.
```js
> 5 * let foo
SyntaxError: Unexpected identifier

> console.log(let bar)
SyntaxError: missing ) after argument list
```

Some statements include expressions as part of their syntax. For example, the `let` statement can include an initializer to set the initial value of the variable:
```js
> let foo = 42
= undefined
```

In the `let` statement, the code to the right of the `=` operator is an expression. That expression happens to be part of the `let` statement, but it is still an expression in its own right.