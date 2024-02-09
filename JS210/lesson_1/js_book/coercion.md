# Explicit Coercion
Suppose you have two string values in your program, `'1'` and `'2'`, that you want to add mathematically and get `3`. You can't do that directly since + performs concatenation when one of its operands is a string. Somehow, we need to coerce the strings `'1'` and `'2'` to the numbers `1` and `2`: we want to perform an explicit type coercion. The difference between explicit and implicit coercion is that explicit coercion lets you decide what you want to do, whereas implicit coercion lets the engine choose.

## String to Numbers
The Number function coerces a string to a number:
```js
> Number('1')
= 1

> Number('foo')
= NaN
```

`parseInt` parses an integer from a string.

when `parseInt` encounters a string whose value begins with a numeric digit or a `+` or `-` sign followed by a digit, it returns a numeric value, even though the remaining characters may not be numeric. It stops converting and ignores everything else once it encounters an invalid character:
```js
> parseInt('12')
= 12

> parseInt('12xyz')
= 12
```

parseInt returns an integer when the string is a number with a fractional component:
```js
> parseInt('3.1415')
= 3
```
If the number in the string is too big or too small to represent as a JavaScript number, `parseInt` returns `Infinity` or `-Infinity`.

A similar function, parseFloat, coerces a string to a floating-point (decimal) number.
```js
> parseFloat('12.5foo')
= 12.5
```

## Numbers to Strings
```js
> String(20)
= '20'
```