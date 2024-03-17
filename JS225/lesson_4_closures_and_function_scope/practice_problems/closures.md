# Closures

## 1. Write a function named `makeMultipleLister` that, when invoked and passed a number, returns a function that logs every positive integer multiple of that number less than 100. Usage looks like this:
```js
> let lister = makeMultipleLister(13);
> lister();
13
26
39
52
65
78
91
```

### Solution
```js
function makeMultipleLister(num) {
  return function () {
    for (let i = num; i < 100; i += num) {
      console.log(i);
    }
  };
}
```

## 2. Write a program that uses two functions, `add` and `subtract`, to manipulate a running total value. When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console. Usage looks like this:
```js
> add(1);
1
> add(42);
43
> subtract(39);
4
> add(6);
10
```

### Solution
```js
let total = 0;

function add(n) {
  if (typeof n === 'number')total += n;
  console.log(total);
}

function subtract(n) {
  if (typeof n === 'number')total -= n;
  console.log(total);
}
```

## 3. Given the following code:
```js
function startup() {
  let status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

let ready = startup();
let systemStatus = // ?
```
Is there a way to set the value of `systemStatus` to the value of the inner variable `status` without changing startup in any way? If so, how?

### Solution
No, the value of status is private and can't be accessed from outside of the function.