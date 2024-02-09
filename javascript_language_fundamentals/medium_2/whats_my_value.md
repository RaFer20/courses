# What's my Value
What will the following program log to the console? Can you explain why?
```js
const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length);
console.log(Object.keys(array).length);

array[-2] = 'Watermelon';
console.log(array.length);
console.log(Object.keys(array).length);
```

## Solution
```js
3
4
3
5
```
On lines 3 and 7 we are assigning non-element values to keys, the `length` function does not cound these values when returning the length, it will only count keys that are non negative integers.
On lines 5 and 9 we call `length` on an array returned by calling `keys` on the array, which will count the keys as element and return the length accordingly.
