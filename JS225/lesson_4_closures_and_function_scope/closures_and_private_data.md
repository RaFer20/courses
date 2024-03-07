# Closures and Private Data
Functions enclose the lexical environment at their definition point, so we call them closures. They always have access to what they close over, regardless of when and where the program invokes the function.

*Note that closures only close over the variables that the function needs. If the function uses the variable foo, but the outer scope contains both foo and bar, only foo will be included in the closure.*

```js
function makeCounter() {
  let count = 0;       // declare a new variable
  return function() {
    count += 1;        // references count from the outer scope
    console.log(count);
  };
}
```

`count` is private data for the function returned by makeCounter. The closure makes it impossible to access the value of count from outside itself:
```js
let counter = makeCounter();

console.log(count);
// ReferenceError: count is not defined
console.log(counter.count);
// undefined: Declarations inside closures aren't accessible from outside
```
On the other hand, the function returned by `makeCounter` can freely access and update `count`.