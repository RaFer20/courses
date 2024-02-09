# Operators

## Arithmetic Operators
Arithmetic operators take two numeric values as input and return a single numeric value. The standard arithmetic operators are `+`, `-`, `/`, `*` and `%`.

## Assignment Operators
The assignment operator (`=`) assigns the value of the right operand to the left operand.
|Name	                      |Shorthand Operator	|Meaning  |
|:-------------------------:|:-----------------:|:-------:|
|Addition Assignment	      |a += b	            |a = a + b|
|Subtraction Assignment	    |a -= b	            |a = a - b|
|Multiplication Assignment	|a *= b	            |a = a * b|
|Division Assignment	      |a /= b	            |a = a / b|
|Remainder Assignment	      |a %= b	            |a = a % b|

## Comparison Operators
A comparison operator compares its operands and returns a boolean value (`true` or `false`).
The strict comparisons do not perform any conversions.
|Operator	                  |Description                                                           |
|:-------------------------:|:--------------------------------------------------------------------:|
|Equal (==)	                |Returns true if the operands are equal                                |
|Not Equal (!=)	            |Returns true if the operands are not equal                            |
|Strict Equal (===)	        |Returns true if the operands are equal and of the same type           |
|Strict Not Equal (!==)	    |Returns true if the operands are not equal and/or not of the same type|
|Greater than (>)	          |Returns true if the left operand is greater than the right            |
|Less than (<)	            |Returns true if the left operand is less than the right               |

## String Operators
We can compare strings just as numbers:
```js
'a' < 'b';         // true
'Ant' > 'Falcon';  // false
// String comparisons use Unicode lexicographical ordering
'50' < '6';        // true ('5' precedes '6' lexicographically)
```

Strings support a concatenation (`+`) operator to combine two strings. You can also use the `+=` operator, which works similarly to the numeric `+=` operator.
```js
let a = 'Hello';
a += ', world!';

a;       // "Hello, world!"
```

## Logical Operators
You can combine boolean values with logical operators.

### Logical And (`&&`)
- For boolean values, returns true if both operands are `true`, and `false` otherwise.
- For non-boolean values this returns the first operand if it can be converted to `false`, and the second operand otherwise.
```js
true && true;    // true
true && false;   // false
false && true;   // false
false && false;  // false
false && [];     // false
```

### Logical Or (`||`)
- For boolean values, returns `true` if at least one operand is true, and `false` otherwise.
- For non-boolean values this returns the first operand if is truthy, and the second operand otherwise.
```js
true || true;    // true
true || false;   // true
false || true;   // true
false || false;  // false
false || [];     // [] (second operand is non-boolean, it is returned as is)
```

### Logical Not (`!`)
- Returns `true` if its operand is falsey, and `false` otherwise.
- Note that this operator is a unary operator. It takes only one operand. You must specify the `!` before the operand.
```js
!true;   // false
!false;  // true
!!true;  // true
!1;      // false
![];     // false
```