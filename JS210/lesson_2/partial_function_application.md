# Partial Function Application
```js
function add(first, second) {
  return first + second;
}

function makeAdder(firstNumber) {
  return function(secondNumber) {
    return add(firstNumber, secondNumber);
  };
}

let addFive = makeAdder(5);
let addTen = makeAdder(10);

console.log(addFive(3));  // 8
console.log(addFive(55)); // 60
console.log(addTen(3));   // 13
console.log(addTen(55));  // 65
```

In this program, the makeAdder function creates and returns a new function that, in turn, calls and returns the return value of calling add with two arguments. What's interesting here is that we define the first number when we call makeAdder. We don't supply the second number until later when we call the function that makeAdder returns.

A function such as makeAdder is said to use partial function application. It applies some of the function's arguments (the add function's first argument here) when called, and supplies the remaining arguments when you call the returned function. Partial function application refers to the creation of a function that can call a second function with fewer arguments than the second function expects. The created function supplies the remaining arguments.



Partial function application is most useful when you need to pass a function to another function that won't call the passed function with enough arguments. It lets you create a function that fills in the gaps by supplying the missing elements. For instance, suppose you have a function that downloads an arbitrary file from the Internet. The download may fail, so the function also expects a callback function that it can call when an error occurs:
```js
function download(locationOfFile, errorHandler) {
  // try to download the file
  if (gotError) {
    errorHandler(reasonCode);
  }
}

function errorDetected(url, reason) {
  // handle the error
}

download("https://example.com/foo.txt", /* ??? */);
```
`errorDetected`, takes two arguments, but download only passes one argument to the error handler. Suppose the `download` function is part of a 3rd party library that you can't modify. You can turn to partial function application to get around the single-argument limitation:
```js
function makeErrorHandlerFor(locationOfFile) {
  return function(reason) {
    errorDetected(locationOfFile, reason);
  };
}

let url = "https://example.com/foo.txt";
download(url, makeErrorHandlerFor(url));
```

The download method now calls the partially applied function returned by `makeErrorHandlerFor`, and `errorDetected` gets both arguments it needs.



*Rather than creating a makeErrorHandlerFor function, you can use bind to perform partial function application. In most cases, `bind` is all you need.*
```js
let url = "https://example.com/foo.txt";
download(url, errorDetected.bind(null, url));
```

## Recognizing Partial Function Application
Partial function application requires a reduction in the number of arguments you have to provide when you call a function. If the number of arguments isn't reduced, it isn't partial function application.

### not a partial function application
```js
function makeLogger(identifier) {
  return function(msg) {
    console.log(identifier + ' ' + msg);
  };
}
```

### partial function application
```js
function makeLogger(identifier) {
  return function(msg) {
    console.log(identifier, msg);
  };
}
```