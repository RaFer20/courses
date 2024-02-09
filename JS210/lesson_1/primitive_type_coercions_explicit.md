# Explicit Primitive Type Coercions

## Converting Strings to Numbers
```js
Number('1');             // 1

Number('abc123');        // NaN

parseInt('123', 10);     // 123
parseInt('123.12', 10);  // 123, will only return whole numbers
parseInt('123.12');      // 123
parseFloat('123.12');    // 123.12, can handle floating point values
```
Note that `parseInt` takes an optional radix argument. This represents the base in mathematical numeral systems. It is recommended to always specify this parameter to avoid reader confusion and to have more predictable behavior.

## Converting Numbers to Strings
```js
String(123);             // "123"
String(1.23);            // "1.23"

(123).toString();        // "123"
(123.12).toString();     // "123.12"
```

We can convert a number to a string with the + operator to "add" it to a string:
```js
123 + '';                // "123"
'' + 123.12;             // "123.12"
```
However, this code does not make its intent clear so we should avoid using code like this.

## Booleans to Strings
```js
String(true);            // "true"
String(false);           // "false"

true.toString();         // "true"
false.toString();        // "false"
```

## Primitives to Booleans?
There is no direct coercion of strings to booleans. Therefore, if you have a string representation of a boolean, you can just compare it with `'true'` to determine whether that string is `'true'` or `'false'`:
```js
let a = 'true';
let b = 'false';
a === 'true';            // true
b === 'true';            // false
```

## `Boolean`
```js
Boolean(null);           // false
Boolean(NaN);            // false
Boolean(0);              // false
Boolean('');             // false
Boolean(false);          // false
Boolean(undefined);      // false
Boolean('abc');          // other values will be true
Boolean(123);            // true
Boolean('true');         // including the string 'true'
Boolean('false');        // but also including the string 'false'!
```

The double ! operator provides a simpler way to coerce a truthy or falsy value to its boolean equivalent. The ! operator returns the opposite of the value's boolean equivalent, so a double ! returns the value's boolean equivalent:

```js
!!(null);                // false
!!(NaN);                 // false
!!(0);                   // false
!!('');                  // false
!!(false);               // false
!!(undefined);           // false

!!('abc');               // true
!!(123);                 // true
!!('true');              // true
!!('false');             // this is also true! All non-empty strings are truthy in JavaScript
```