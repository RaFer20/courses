# Dealing with Context Loss

## Method Losing Context when Taken Out of Object
A method loses it's context when it is removed from it's containing object and executed:
```js
let john = {
  firstName: 'John',
  lastName: 'Doe',
  greetings() {
    console.log('hello, ' + this.firstName + ' ' + this.lastName);
  },
};

let foo = john.greetings;
foo();

// => hello, undefined undefined
```

We can use `foo.call(john)` to restore the context, but if we don't want to execute the `foo` right away or want to pass it to another function `john` could be out of scope by the time we want to execute it.
```js
function repeatThreeTimes(func) {
  func();       // can't do func.call(john), out of scope
  func();
  func();
}

function foo() {
  let john = {
    firstName: 'John',
    lastName: 'Doe',
    greetings() {
      console.log('hello, ' + this.firstName + ' ' + this.lastName);
    },
  };

  repeatThreeTimes(john.greetings); //
}

foo();

// => hello, undefined undefined
// => hello, undefined undefined
// => hello, undefined undefined
```

We can update `repeatThreeTimes` by adding an extra parameter and pass in the context:
```js
function repeatThreeTimes(func, context) {
  func.call(context);
  func.call(context);
  func.call(context);
}

function foo() {
  let john = {
    firstName: 'John',
    lastName: 'Doe',
    greetings() {
      console.log('hello, ' + this.firstName + ' ' + this.lastName);
    },
  };

  repeatThreeTimes(john.greetings, john);
}

foo();

// hello, John Doe
// hello, John Doe
// hello, John Doe
```

*We see this kind of code often with JavaScript's built-in methods, such as `Array.prototype.forEach`. These methods let us specify an optional `thisArg` argument as the context object (value of `this`) that the function should use.*

If we can't update the function or can't supply a context object we can use `bind` to hard bind the context:
```js
function repeatThreeTimes(func) {
  func();
  func();
  func();
}

function foo() {
  let john = {
    firstName: 'John',
    lastName: 'Doe',
    greetings() {
      console.log('hello, ' + this.firstName + ' ' + this.lastName);
    },
  };

  repeatThreeTimes(john.greetings.bind(john));
}

foo();

// => hello, John Doe
// => hello, John Doe
// => hello, John Doe
```

## Internal Function Losing Method Context
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    function bar() {
      console.log(this.a + ' ' + this.b);
    }

    bar();
  },
};

obj.foo();
> undefined undefined
```
In the code above wven though `foo` executes within the obj context, the call to `bar` does not provide an explicit context, which means that JavaScript binds the global object to the function. In other words, `this` is the global object, not `obj`.

Some solutions to this problem
### Preserve Context with a Local Variable in the Lexical Scope
A common approach is the `let self = this` or `let that = this` fix. We can save `this` in a variable named `self` or `that` before calling the function, then reference the variable in the function.
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    let self = this;

    function bar() {
      console.log(self.a + ' ' + self.b);
    }

    bar();
  }
};

obj.foo();
> hello world
```
Based on its lexical scope, `bar` has access to `self`, so it can freely use `self` instead of `this` to access the proper context object.


### Pass the Context to Internal Functions
We can use `call` or `apply` to pass the context object to the function:
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    function bar() {
      console.log(this.a + ' ' + this.b);
    }

    bar.call(this);
  }
};

obj.foo();
> hello world
```

### Bind the Context with a Function Expression
We can use `bind` when we define the function to provide `bar` with a permanent context.
*Note `bind` must be called with a function expression, not a function declaration; using bind with a function declaration results in an error.*
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    let bar = function() {
      console.log(this.a + ' ' + this.b);
    }.bind(this);

    // some lines of code

    bar();

    // more lines of code

    bar();

    // ...
  }
};

obj.foo();
> hello world
> hello world
```
An advantage of using `bind` this way is we can do it once and call it as often as we want without having to provide context explicitly.

### Using an Arrow Function
We can define `bar` using an arrow function since the value of this when using an arrow function is the current value of this in the defining function, namely, the function where the arrow function is defined:
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    let bar = () => console.log(this.a + ' ' + this.b);
    bar();
  }
};

obj.foo();
> hello world
```
`this` inside the arrow function points to `obj`, which is the current execution context of foo.

## Function as Argument Losing Surrounding Context
```js
function repeatThreeTimes(func) {
  func();
  func();
  func();
}

let john = {
  firstName: 'John',
  lastName: 'Doe',
  greetings() {
    repeatThreeTimes(function() {
      console.log('hello, ' + this.firstName + ' ' + this.lastName);
    });
  },
};

john.greetings();

// => hello, undefined undefined
// => hello, undefined undefined
// => hello, undefined undefined
```
In this example, we call `repeatThreeTimes` with a function argument that contains this. `repeatThreeTimes` calls its argument three times, but each time it does so without an explicit context. 
This means the context is the global object.


Consider this code:
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    [1, 2, 3].forEach(function(number) {
      console.log(String(number) + ' ' + this.a + ' ' + this.b);
    });
  },
};

obj.foo();

// => 1 undefined undefined
// => 2 undefined undefined
// => 3 undefined undefined
```
`forEach` executes the anonymous function passed to it, so it gets executed with the global object as context.

We can use the same solutions we used previously for [internal functions](#internal-function-losing-method-context).

### Use a local variable in the lexical scope to store `this`
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    let self = this;
    [1, 2, 3].forEach(function(number) {
      console.log(String(number) + ' ' + self.a + ' ' + self.b);
    });
  },
};

obj.foo();

// => 1 hello world
// => 2 hello world
// => 3 hello world
```
### Bind the argument function with the surrounding context
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    [1, 2, 3].forEach(function(number) {
      console.log(String(number) + ' ' + this.a + ' ' + this.b);
    }.bind(this));
  },
};

obj.foo();

// => 1 hello world
// => 2 hello world
// => 3 hello world
```
### Use the optional `thisArg` argument
Some methods that take function arguments allow an optional argument that defines the context to use when executing the function. 
`Array.prototype.forEach`, `Array.prototype.filter`, `Array.prototype.map`, `Array.prototype.some` and `Array.prototype.every` are examples of methods that take an optional `thisArg` argument.
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    [1, 2, 3].forEach(function(number) {
      console.log(String(number) + ' ' + this.a + ' ' + this.b);
    }, this);
  },
};

obj.foo();

// => 1 hello world
// => 2 hello world
// => 3 hello world
```
### Use arrow function for the callback
The `this` binding for arrow functions is not dependent on how the function is invoked. Instead, JavaScript resolves it by looking at the execution context of the surrounding environment at the time the arrow function was defined.
```js
let obj = {
  a: 'hello',
  b: 'world',
  foo() {
    [1, 2, 3].forEach((number) => {
      console.log(String(number) + ' ' + this.a + ' ' + this.b);
    });
  },
};

obj.foo();

// => 1 hello world
// => 2 hello world
// => 3 hello world
```
In this case `this` resolves to `obj` which is the execution context of `foo`.

#### Note About Arrow Functions
Arrow functions do not get their context lexically, arrow functions rely on the execution state at the time of definition to determine their execution context.
```js
let obj1 = {
  a: 'This is obj1',

  foo() {
    let bar = () => console.log(this.a);
    bar();
  },
};

let obj2 = {
  a: 'This is obj2',
};

obj1.foo();                   // This is obj1

obj2.foo = obj1.foo;
obj2.foo();                   // This is obj2
```
Since the context is determined based on the context at the time the function is created, `obj2.foo()` prints `This is obj2`.