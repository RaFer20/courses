# Arrays and Operators

Some operators include:
`+`, `-`, `*`, `/`, `%`, `+=,` `-=`, `==`, `!=`, `===`, `!==`, `>`, `>=`, `<`, `<=`


## Arithmetic Operators
The arithmetic operators convert arrays to strings before performing the operation.
```js
let initials = ['A', 'H', 'E'];
initials + 'B';                   // "A,H,EB"
initials;                         // [ "A", "H", "E" ]
```

We can use the `String` function to see how JavaScript will coerce the array into a string:
```js
String([initials]);     // "A,H,E"
String([]);             // ""
String([undefined]);    // ""
```

```js
initials + ['B'];      // "A,H,EB"
initials;              // [ "A", "H", "E" ]
```

Let's see what * does:
```js
[1] * 2;              // 2 -- becomes '1' * 2, then 1 * 2
[1, 2] * 2;           // NaN -- becomes '1,2' * 2, then NaN * 2
```
Again, it's not a result that we may find useful.

Some other examples include:
```js
[5] - 2;              // 3
[5] - [2];            // 3
5 - [2];              // 3
5 - [2, 3];           // NaN -- becomes 5 - '2,3', then 5 - NaN
[] + [];              // '' -- becomes '' + ''
[] - [];              // 0 -- becomes '' - '', then 0 - 0
+[];                  // 0
-[];                  // -0
```
*The real danger of using operators on arrays isn't the fact that the results are useless. Instead, these pointless operations run without producing a warning. This makes it easy for bugs to go undetected.*

## Comparison Operators
```js
let friends = ['Bob', 'Josie', 'Sam'];
let enemies = ['Bob', 'Josie', 'Sam'];
friends == enemies;                    // false
friends === enemies;                   // false
[] == [];                              // false
[] === [];                             // false
```
Neither equality (`==`) nor strict equality (`===`) considers arrays with the same values to be equal.

The two arrays are unequal since they are different arrays. They happen to contain the same values, but the arrays themselves are different objects. If we modify the first value in `friends` to `'Susan'`, the first value in enemies remains unchanged. Thus, the two arrays are different arrays, and the equality operators act accordingly.

**The equality operators check whether the two arrays are the same array—they don't care if the arrays contain the same content.** Strictly speaking, arrays are only equal when they are the same object. 

Here we compare an array with itself:
```js
let friends = ['Bob', 'Josie', 'Sam'];
friends == friends;                    // true
friends === friends;                   // true
```

If we assign the same array to another variable, JavaScript still recognizes them as the same array, and returns true:
```js
let friends = ['Bob', 'Josie', 'Sam'];
let roommates = friends;
friends == roommates;                  // true
friends === roommates;                 // true
```

When an array is compared with a non-array using the non-strict equality operator, JavaScript implicitly coerces the array into a string before performing the comparison. For example:
```js
[] == '0';               // false -- becomes '' == '0'
[] == 0;                 // true -- becomes '' == 0, then 0 == 0
[] == false;             // true -- becomes '' == false, then 0 == 0
[] == ![];               // true -- same as above
[null] == '';            // true -- becomes '' == ''
[undefined] == false;    // true -- becomes '' == false, then false == false
[false] == false;        // false -- becomes 'false' == 0, then NaN == 0
```

The relational comparison operators, `>`, `>=`, `<`, and `<=`, are useless with arrays and objects. They return `true` or `false` in unexpected ways. Don't use them with arrays or objects.