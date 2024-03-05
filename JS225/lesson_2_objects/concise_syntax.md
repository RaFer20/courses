```js
function foo(bar) {
  return {
    bar: bar,
    qux: function() {
      console.log("hello");
    },
  };
}
```
This code returns an object that has two properties: a `bar` property whose value is given by the `bar` parameter, and a `qux` property that defines a method.


Concise Syntax:
```js
function foo(bar) {
  return {
    bar,                      // same as bar: bar
    qux() {                   // same as qux: function()
      console.log("hello");
    },
  };
}
```