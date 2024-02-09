# Practice Problems: Primitive Types and Type Coercion

1. The result of the following calculation is a string. Using type coercion, correct the calculation to produce the numeric result instead.
```js
let x = '13';
let y = 9;

console.log(x + y);
```

Solution
```js
console.log(parseInt(x, 10) + y);
```

2. Using the same block of JavaScript, change the addition operator to a multiplication operator and leave `x` as a string. Will the result be a string or a number?
Number, multiplication will always convert the string to a number value before performing the operation.


3. Convert the three parts of this telephone number to strings to produce a valid phone number.
```js
let npa = 212;
let nxx = 555;
let num = 1212;

console.log(npa + nxx + num);
```

Solution
```js
npa = '' + npa;
nxx = nxx + '';
num += '';

console.log(npa + nxx + num);  // 2125551212

// or
console.log(String(npa) + String(nxx) + String(num));
```

4. You can also use the `String` constructor to create Strings from numbers. This is a function that takes an argument and converts it to a string. Try it using the previous block of code; wrap each number in a call to `String`.

Solution
```js
console.log(String(npa) + String(nxx) + String(num));
```

5. The `toString` method is yet another way to convert values to strings. Try using `toString` to convert a boolean and an array to a String. Did you get the result you expected?
```js
let bool = true;
let arr = [1, 2, 3];
```

Solution
```js
console.log(bool.toString());  // "true"
console.log(arr.toString());   // "1,2,3"
```