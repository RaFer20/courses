# Practice Problems - Garbage Collection

## 1. Is JavaScript a garbage-collected language, and if so, what does this entail?

### Solution:
Yes, this means the process of allocating and deallocating memory is handles by JS runtime.

## 2. Consider the code below:
```js
let myNum = 1;

function foo() {
  let myArr = ['this is an array'];
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code
```
Are either of the values `1` or `['this is an array']` eligible for garbage collection on line 5? What about on line 10?

### Solution:
None of the values are eligible for garbage collection on line 5.
`['this is an array']` is eligible for garbage collection on line 10 after the function finishes running.
Since variables that contain numbers are stored on the stack, the value `1 is never eligible for GC. 


## 3. Consider the code below:
```js
function makeGreeting() {
  let foo = { greeting: 'hello' };
  return function(name) {
    foo.name = name;
    return foo;
  };
}

let greeting = makeGreeting();

// is the object eligible for GC here?

// more code
```
Is the object created and assigned to `foo` on line 2 eligible for garbage collection on line 11?

### Solution:
No, the function returned by `makeGreeting` creates a closure that prevents the object referenced by `foo` from being garbage collected on line 11.

## 4. Consider the script below:
```js
let bash = {};
```
Will the object `{}` ever be eligible for garbage collection?

### Solution:
Yes. After the script finishes running the object will be eligible for garbage collection.