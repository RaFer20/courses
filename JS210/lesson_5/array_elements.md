# Array: What is an Element
All of the indexes of an array are properties of the object, after translation to a string value. This fact has surprising consequences: some, but not all, properties are elements of the array. That leads to ambiguities, such as "What do we mean by an empty array?"

## Array Keys
```js
let arr = [];
console.log(arr);              // []
console.log(arr.length);       // 0
console.log(Object.keys(arr)); // []
```


when the array contains elements:
```js
let arr = [2, 4, 6];
console.log(arr);              // [2, 4, 6]
console.log(arr.length);       // 3
console.log(Object.keys(arr)); // ['0', '1', '2']
```
Lines 2 and 3 display the values you likely expect: we see that the array has 3 elements with values 2, 4, and 6, and the total length is 3. Line 4 shows that the property keys are '0', '1', and '2'; these string values correspond to the indexes of the array.

We can add properties to the object arr that are not elements of the array. All we have to do is use a key that is not a non-negative integer; it doesn't even have to be a number:
```js
let arr = [2, 4, 6]
arr[-3] = 5;
arr['foo'] = 'a';
console.log(arr);              // [ 2, 4, 6, '-3': 5, foo: 'a' ]
console.log(arr.length);       // 3
console.log(Object.keys(arr)); // [ '0', '1', '2', '-3', 'foo' ]
arr.map(x => x + 1);           // [ 3, 5, 7 ]
```
In the last line above, we can see that map ignores the non-element values. All built-in Array methods ignore properties that are not elements, so map does nothing with `arr[-3]` and `arr['foo']`.

This weird behavior leads to some ambiguity:
```js
let arr = [];
arr[-3] = 5;
arr['foo'] = 'a';

// Is arr empty?
console.log(arr.length);       // 0                Yes
console.log(Object.keys(arr)); // [ '-3', 'foo' ]  No
```
To determine whether arr is empty on lines 6 and 7, we first need to define what we mean by an empty array. If we're only interested in elements, then we can use length to determine whether the array is empty. However, if we need to include non-elements, then we need to look at the object keys to learn whether the array is empty. There is no one right answer here. That's a decision we have to make when writing the code.

## Sparse Arrays
Another consideration with arrays is that they are "sparse". The number of elements in an array isn't necessarily the same as its length: there can be gaps in the array. One way to create these gaps is by increasing the size of the length property without adding any values to the array:
```js
let arr = [2, 4, 6];
arr.length = 5;
console.log(arr);              // [2, 4, 6, <2 empty items> ]
console.log(arr.length);       // 5
console.log(Object.keys(arr)); // ['0', '1', '2']
```
The array has a length of 5, but only contains 3 elements.
The empty items, arr[3] and arr[4], have no value at all. In fact, the array completely lacks elements at those index positions; you can see that on line #5 where Object.keys makes no mention of keys '3' and '4'.

If you try to access either value, JavaScript will tell you that it is undefined.
```js
console.log(arr[4]);           // undefined
```
However, that does not mean its value is undefined. The value is not set at all. 

We can change one of these elements to an explicit `undefined`.
```js
let arr = [2, 4, 6];
arr.length = 5;
arr[4] = undefined;
console.log(arr);              // [2, 4, 6, <1 empty item>, undefined ]
console.log(arr.length);       // 5
console.log(Object.keys(arr)); // ['0', '1', '2', '4']
```
`arr[3]` is still an empty item, but `arr[4]` is undefined. `arr[4]` has a value; `arr[3]` does not. Note, also, that Object.keys includes the key of the explicitly undefined element ('4') in the return value. Still, it does not include the key for the gap at `arr[3]`.

This behavior again leads to ambiguity about what arrays are empty and which are not:
```js
let arr = [];
arr.length = 3;

// Is arr empty?
console.log(arr.length);       // 3      No
console.log(Object.keys(arr)); // []     Yes
```