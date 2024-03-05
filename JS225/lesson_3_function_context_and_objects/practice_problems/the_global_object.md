# Practice Problems: The Global Object

1. With strict mode not enabled, what object serves as the implicit execution context? What happens when strict mode is enabled?

Solution:
`window` object
When we enable strict mode we can't access the global object.

2. What does the code below log?
```js
a = 10;

console.log(window.a === a);
```

Solution:
```js
true
```
Since the global object is the implicit context for evaluating expressions, `a` is created as a property of the global object.

3. What does the code below log?
```js
"use strict"

a = 10;

console.log(window.a === a);
```

Solution:
Nothing, `a = 10` raises a `ReferenceError`. Since `a` was not previously declared, the assignment on line 3 raises an error.

4. What does the code below do?
```js
function func() {
  let b = 1;
}

func();

console.log(b);
```

Solution:
Nothing is logged, `b` is not accessible to the global object, it was declared inside `func()` so the declaration is scoped to the function.

5. What does the code below do?
```js
function func() {
  b = 1;
}

func();

console.log(b);
```

Solution:
```js
1
```
Since we didn't declare `b` using `let`, `var` or `const` it is created as a property on the global object which makes it accessible outside of `func()`

6. What does the code below log?
```js
"use strict"

function func() {
  b = 1;
}

func();

console.log(b);
```

Solution:
Nothing, `b = 1` raises an error because we can't declare a variable in strict mode without using `let`, `var` or `const`.  In strict mode, we don't have access to the global object as the implicit execution context.