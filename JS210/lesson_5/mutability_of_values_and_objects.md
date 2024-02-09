# Mutability of Values and Objects
- Primitive values are immutable: you cannot modify them. Operations on these values return a new value of the same type.
- Objects are mutable: you can modify them without changing their identity. Objects contain data inside themselves; it's this inner data that you can change.


Similar operations using strings and arrays:
String:
```js
let alpha = 'abcde';
alpha[0] = 'z';     // "z"
alpha;              // "abcde"
```
`alpha[0] = 'z'` doesn't do anything except return the string `"z"`. `alpha` contains a string, which is a primitive type, so it is immutable.

Array:
```js
alpha = ['a', 'b', 'c', 'd', 'e'];
alpha[0] = 'z';       // "z"
alpha;                // [ "z", "b", "c", "d", "e" ]
```
Since Arrays are Objects and not primitive values, we can change the components (the elements) of the Array; this modifies the Array, but does not change the identity of the array. Here, element 0 (the `0` property of `alpha`) now points to a new String; the old value no longer belongs to `alpha`.


This ability to modify values within an Array can cause complications, especially when passing the Array to a Function.
```js
function lessExcitable(text) {
  return text.replace(/!+/g, '.');  // replaces ! with .
}

let message = 'Hello!';
lessExcitable(message);             // "Hello."
message;                            // "Hello!"
```
Since calling `replace` on a String returns a new String with a different value, this code doesn't modify the local variable `message`.


```js
function push(array, value) {
  array[array.length] = value;
  return array.length;
}

let numbers = [1, 6, 27, 34];
push(numbers, 92);                  // 5
numbers;                            // [ 1, 6, 27, 34, 92 ]
```
This function uses the mutability of Arrays. Instead of creating a new Array that includes all the old elements as well as the new value, it simply modifies the Array directly. This also modifies the original Array, numbers. If Arrays weren't mutable, you would not be able to do this, and would have to return a completely new Array.

# Nested Data Structures
It's important to remember that nested data structures behave differently than one would expect. Therefore, it's important to recognize when we're working with shallow copies of an object versus deep copies of an object.

## Shallow Copy
Sometimes, you may find that you need to copy an entire collection, perhaps to save the original collection before performing some modifications. There are different ways to copy different kinds of collections.

### Shallow Copying Arrays
One way to copy an array is to use the Array.prototype.slice method without arguments:
```js
let arr = ['a', 'b', 'c'];
let copyOfArr = arr.slice();
copyOfArr; // => [ 'a', 'b', 'c' ];
```
A more modern way is to use the ES6 spread syntax, which uses ... to expand an array to a list of values:
```js
let arr = ['a', 'b', 'c'];
let copyOfArr = [...arr];
copyOfArr; // => [ 'a', 'b', 'c' ];
```

Let's verify that the new arrays are in fact copies of the original arrays and not the same arrays.
```js
let arr = ['a', 'b', 'c'];
let copyOfArr = [...arr];

copyOfArr.push('d');

arr; // => [ 'a', 'b', 'c' ]
copyOfArr; // => [ 'a', 'b', 'c', 'd' ]
```

When the array contains other objects, like a nested array, then **those objects are shared, not copied.** That has major ramifications for nested collections:

```js
let arr = [['a'], ['b'], ['c']];
let copyOfArr = arr.slice();

copyOfArr[1].push('d');

arr; // => [ [ 'a' ], [ 'b', 'd' ], [ 'c' ] ]
copyOfArr; // => [ [ 'a' ], [ 'b', 'd' ], [ 'c' ] ]
```
It's important to understand that this behavior occurs because the destructive method push was called on a shared array object, ['b'], rather than a separate array. When you mutate a shared object in an array or other collection, it is the shared object you are affecting rather than the collection.
```js
let arr = [{ a: 'foo' }, { b: 'bar' }, { c: 'baz' }];
let copyOfArr = [...arr];

copyOfArr[1].d = 'qux';

arr; // => [ { a: 'foo' }, { b: 'bar', d: 'qux' }, { c: 'baz' } ]
copyOfArr; // => [ { a: 'foo' }, { b: 'bar', d: 'qux' }, { c: 'baz' } ]
```

### Shallow Copying Objects
`Object.assign` method can be used to copy properties of one or more objects into another:
```js
let obj1 = { a: 'foo' };
let obj2 = { b: 'bar' };

Object.assign(obj1, obj2); // => { a: 'foo', b: 'bar' }
obj1; // => { a: 'foo', b: 'bar' }
```
`Object.assign` copies over the properties from obj2 into obj1 and returns obj1. You might be able to see that we can use `Object.assign` to create a copy of an object by providing an empty object as the first argument:
```js
let obj = { a: 'foo', b: 'bar' };
let copyOfObj = Object.assign({}, obj);

copyOfObj; // => { a: 'foo', b: 'bar' }
```

We can verify that it is a copy:
```js
copyOfObj['c'] = 'baz';
copyOfObj; // => { a: 'foo', b: 'bar', c: 'baz' }
obj; // => { a: 'foo', b: 'bar' }
```

Note that Object.assign only creates a shallow copy of the object. That is, changes to nested objects within the copy will be reflected in the original:
```js
let obj = { a: { b: 'foo' }, c: ['bar'] };
let copyOfObj = Object.assign({}, obj);

obj['a']['d'] = 'baz';
copyOfObj; // => { a: { b: 'foo', d: 'baz' }, c: [ 'bar' ] }
obj; // => { a: { b: 'foo', d: 'baz' }, c: [ 'bar' ] }
```

## Deep Copy
JavaScript doesn't have an explicit method or function for deep copying objects, but there is an indirect way to do it. However, it only works with nested arrays and plain objects. Objects that have methods and complex objects like dates or custom objects cannot be deep-cloned with this technique. Most use cases of deep copying objects involve only plain objects and arrays, so this technique is useful to learn:
```js
let arr = [{ b: 'foo' }, ['bar']];
let serializedArr = JSON.stringify(arr);
let deepCopiedArr = JSON.parse(serializedArr);
```
The `JSON.stringify` method serializes any object, including arrays, that only have primitives, arrays, and plain objects as elements. Serializing involves converting an object to a string form that can be subsequently converted back into an identical object. The `JSON.parse` method performs that conversion from a string back to an object.

To verify that this is indeed a deep copy, we'll modify the second element of the deepCopiedArr array, which itself is an array. If the modification doesn't show in the original arr, we can conclude that it's a deep copy:
```js
deepCopiedArr[1].push('baz');
deepCopiedArr; // => [ { b: 'foo' }, [ 'bar', 'baz' ] ]
arr; // => [ { b: 'foo' }, [ 'bar' ] ]
```