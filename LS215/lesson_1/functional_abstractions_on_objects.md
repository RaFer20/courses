# Functional Abstractions on Objects

## Iteration
```js
let myObject = { a: 1, b: 2, c: 3 };

Object.keys(myObject).forEach(key => {
  console.log('key: ' + key + ', value: ' + String(myObject[key]));
});

// logs
key: a, value: 1
key: b, value: 2
key: c, value: 3
```

## Working with Keys or Values as Arrays
```js
let myObject = { a: 1, b: 2, c: 3 };
let keys = Object.keys(myObject);         // ["a", "b", "c"]
let values = Object.values(myObject);     // [1, 2, 3]
```

## Map, Reduce, Filter, and More?
We have to create our own custom functions to build up a new data structure

```js
// map to a new object with values doubled from myObject
function doubleObjectValues(object) {
  let objEntries = Object.entries(object);
  let objMapped = objEntries.map(([key, val]) => [key, val * 2]);

  return Object.fromEntries(objMapped);
}

console.log(doubleObjectValues({ a: 1, b: 2, c: 3 })); // { a: 2, b: 4, c: 6 }
```

```js
// filter an object to select only values with even numbers
function keepEvenValues(object) {
  let objEntries = Object.entries(object);
  let objFiltered = objEntries.filter(([key, val]) => val % 2 === 0);

  return Object.fromEntries(objFiltered);
}

console.log(keepEvenValues({ a: 1, b: 2, c: 3 })); // { b: 2 }
```

```js
// reduce an invoice object
function getTotalFromInvoice(invoice) {
  let total = Object.values(invoice).reduce((total, value) => total + value);

  return {total: total};
}

console.log(getTotalFromInvoice({ phone: 10000, internet: 8000, tax: 3000 })); // { total: 21000 }
```