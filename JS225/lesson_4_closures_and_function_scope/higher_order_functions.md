# Higher-Order Functions
A higher-order function can accept a function as an argument, return a function when invoked, or both.

In other words a higher-order function is one in which either an input or output value is a function.

Example of a higher-order function:
```js
function timed(func) {
  return function() {
    let start = new Date();
    func();
    let stop = new Date();
    console.log((stop - start).toString() + ' ms have elapsed');
  };
}
```
`timed` records how long it takes to execute a function.

`loopy` sums every number from 1 to 1,000,000,000 and then logs the result:
```js
function loopy() {
  let sum = 0;
  let i;

  for (i = 1; i < 1000000000; i += 1) {
    sum += i;
  }

  console.log(sum);
}
```

We can use `loopy` as an argument when we call `timed`
```js
> timed(loopy)();           // immediate invocation of returned function
499999999067109000
952 ms have elapsed
```