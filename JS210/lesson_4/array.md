You can create Arrays using a simple Array literal syntax:
```js
[]         // an empty Array

[0, 1, 2]  // an Array holding three values

[42, 'hello', false, [3, 5], [true, 'hello']]  // Arrays can contain any other object
```

You can also create arrays with the Array constructor.
```js
let count = new Array(1, 2, 3);

// Usually written as:
let count = [1, 2, 3];
```


You can add values to an Array using a similar notation:
```js
let count = [1, 2, 3];
count[3] = 4;
count;            // [ 1, 2, 3, 4 ]
count.length;     // 4
```

JavaScript lets you assign a value to any location within an Array.
```js
// continue from the previous code snippet
count[5] = 5;
count[9] = 9;
count[9];         // returns 9
count.length;     // 10
```

The `length` property returns a value that is one greater than the highest index.

For the indexes that we didn't explicitly assign a value, JavaScript designates it as empty. Empty items have no value at all, and if you try to access the values at those indexes you'll get undefined.
```js
// continue from the previous code snippet
count;            // [ 1, 2, 3, 4, empty x 1, 5, empty x 3, 9 ]
count[4];         // undefined
```

You can also change the Array's length by assigning a new value to the length property:
```js
let count = [1, 2, 3];

count.length = 10;
count;            // [ 1, 2, 3, empty x 7 ]
count.length = 2;
count;            // [ 1, 2 ]; excess elements are lost
```

**Arrays are objects**
JavaScript Arrays are really Objects (we'll talk more about Objects later on). You can see this with the typeof operator:
```js
typeof [];        // "object"
```

If you need to determine whether a value is an Array, this can be a problem. If you find yourself in this position, use Array.isArray instead; it returns true when the argument is an Array, false if it is anything else:
```js
Array.isArray([]);        // true
Array.isArray('array');   // false
```