# Implicit Primitive Type Coercions

```js
1 + true       // true is coerced to the number 1, so the result is 2
'4' + 3        // 3 is coerced to the string '3', so the result is '43'
false == 0     // false is coerced to the number 0, so the result is true
```
In other programming languages, the above expressions will produce errors or exceptions, but JavaScript tries to make sense of the expression. If necessary, it converts values to types that it can operate on. 

As a rule, you should avoid these automatic type conversions. However, you will likely encounter JavaScript code that uses these conversions, intentionally or not, so you need to know where these conversions occur and how they work. Without that knowledge, you may find it hard to update or troubleshoot the code.

## The Plus (`+`) Operator
The unary plus operator converts a value into a number, following the same rules as the `Number` function:
```js
+('123')        // 123
+(true)         // 1
+(false)        // 0
+('')           // 0
+(' ')          // 0
+('\n')         // 0
+(null)         // 0
+(undefined)    // NaN
+('a')          // NaN
+('1a')         // NaN
```

The binary plus operator (with two operands) means either addition for numbers or concatenation for strings. When `+` is used with mixed operands that include a string, JavaScript converts the other operand to a string as well:
```js
'123' + 123     // "123123" -- if a string is present, coerce for string concatenation
123 + '123'     // "123123"
null + 'a'      // "nulla" -- null is coerced to string
'' + true       // "true"
```

When both operands are a combination of numbers, booleans, nulls, or undefineds, they are converted to numbers and added together:
```js
1 + true        // 2
1 + false       // 1
true + false    // 1
null + false    // 0
null + null     // 0
1 + undefined   // NaN
```
In the last example above, `undefined` gets coerced to `NaN`. While NaN means "not a number", JavaScript still considers it to be a number. The result of `1 + NaN` is thus, `NaN`.

When one of the operands is an object (including arrays and functions), both operands are converted to strings and concatenated together:
```js
[1] + 2                     // "12"
[1] + '2'                   // "12"
[1, 2] + 3                  // "1,23"
[] + 5                      // "5"
[] + true                   // "true"
42 + {}                     // "42[object Object]"
(function foo() {}) + 42    // "function foo() {}42"
```

## Other Arithmetic Operations
The other arithmetic operators, `-`, `*`, `/`, `%`, are only defined for numbers, so JavaScript converts both operands to numbers:
```js
1 - true                // 0
'123' * 3               // 369 -- the string is coerced to a number
'8' - '1'               // 7
-'42'                   // -42
null - 42               // -42
false / true            // 0
true / false            // Infinity
'5' % 2                 // 1
```

## Equality Operators
JavaScript provides non-strict equality operators, `==` and `!=`, and strict equality operators, `===` and `!==`. The strict operators never perform type coercions. The non-strict operators have a set of rules for coercing types before performing the comparison.

### Strict Equality Operators
With the strict equality operators, the two operands are only equal if they are both the same type and have the same value:
```js
1 === 1               // true
1 === '1'             // false
0 === false           // false
'' === undefined      // false
'' === 0              // false
true === 1            // false
'true' === true       // false
```

### Non-strict Equality Operators
The non-strict equality operators work exactly the same as the strict equality operators when both operands are the same type. However, when the operands are different types, JavaScript implicitly coerces them to the same type before comparing them.

When one operand is a string and the other is a number, the string is converted to a number:
```js
'42' == 42            // true
42 == '42'            // true
42 == 'a'             // false -- becomes 42 == NaN
0 == ''               // true -- becomes 0 == 0
0 == '\n'             // true -- becomes 0 == 0
```

When one operand is a boolean, it is converted to a number:
```js
42 == true            // false -- becomes 42 == 1
0 == false            // true -- becomes 0 == 0
'0' == false          // true -- becomes '0' == 0, then 0 == 0 (two conversions)
'' == false           // true -- becomes '' == 0, then 0 == 0
true == '1'           // true
true == 'true'        // false -- becomes 1 == 'true', then 1 == NaN
```

When one operand is `null` and the other is `undefined`, the non-strict operator always returns `true`. If both operands are `null` or both are undefined, the return value is `true`. Comparing `null` or `undefined` to all other values returns false:
```js
null == undefined      // true
undefined == null      // true
null == null           // true
undefined == undefined // true
undefined == false     // false
null == false          // false
undefined == ''        // false
undefined === null     // false -- strict comparison
```

When one of the operands is `NaN`, the comparison always returns `false`:
```js
NaN == 0              // false
NaN == NaN            // false
NaN === NaN           // false -- even with the strict operator
NaN != NaN            // true -- NaN is the only JavaScript value not equal to itself
```

*The != and !== operators follow the same rules as above, except the result of the comparison is inverted (i.e., true becomes false).*

## Relational Operators
The relational operators, <, >, <=, and >= are defined for numbers (numeric comparison) and strings (lexicographic order). There are no strict versions of these operators. When both operands are strings, JavaScript compares them lexicographically. Otherwise, JavaScript converts both operands to numbers before comparing them.
```js
11 > '9'              // true -- '9' is coerced to 9
'11' > 9              // true -- '11' is coerced to 11
123 > 'a'             // false -- 'a' is coerced to NaN; any comparison with NaN is false
123 <= 'a'            // also false
true > null           // true -- becomes 1 > 0
true > false          // true -- also becomes 1 > 0
null <= false         // true -- becomes 0 <= 0
undefined >= 1        // false -- becomes NaN >= 1
```

