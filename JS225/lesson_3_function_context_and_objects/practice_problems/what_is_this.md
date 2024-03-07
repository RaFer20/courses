# Practice Problems - What is this? Part 1

## 1. What does `this` point to in the code below?
```js
function whatIsMyContext() {
  return this;
}
```

### Solution:
We can't tell until the function is invoked.

## 2. What does `this` point to in the code below?
```js
function whatIsMyContext() {
  return this;
}

whatIsMyContext();
```

### Solution:
`this` points to the implicit global object, if we're using strict mode `this` is `undefined` instead.

## 3. What does `this` point to in the code below?
```js
function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();
```

### Solution:
`this` points to the implicit global object, or `undefined` if we're using strict mode.

## 4. What does `this` point to in the code below?
```js
let obj = {
  count: 2,
  method() {
    return this.count;
  },
};

obj.method();
```

### Solution:
`this` points to `obj` in the code above.

## 5. In strict mode, what does the following program log to the console?
```js
function foo() {
  console.log(this.a);
}

let a = 2;
foo();
```

### Solution:
Since we didn't explicitly specified a context `this` resolves to the global context, the global execution context is `undefined` so the code above raises an error. We're trying to access a nonexistent property `a` of `undefined`.

## 6. What does the following program log to the console?
```js
let a = 1;
function bar() {
  console.log(this.a);
}

let obj = {
  a: 2,
  foo: bar,
};

obj.foo();
```

### Solution:
`2` is logged to the console. When we invoke `foo` it sets the context to `obj`. This happens because we didn't explicitly specified a context for `foo` and a method invoked without an explicit context defaults to the calling object.

## 7. What does the following code log to the console?
```js
let foo = {
  a: 1,
  bar() {
    console.log(this.baz());
  },

  baz() {
    return this;
  },
};

foo.bar();
let qux = foo.bar;
qux();
```

### Solution:
```js
Object {a: 1, bar: f, baz: f}
Uncaught TypeError: this.baz is not a function
```
The first output returns the `foo` object as expected because we're calling `bar` as a method of `foo`.
After that since `baz` doesn't exist as a property of the global object it throws an error.

# Practice Problems - What is this? Part 2
While working through these practice problems, assume that the code runs within a web page.

## 1. What does `this` point to in the code below, and what does the method return?
```js
let myObject = {
  count: 1,
  myChildObject: {
    myMethod() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod();
```

### Solution:
`this` points to `myChildObject`. The method call returns `undefined` because `myChildObject` doesn't have a `count` property.

## 2. In the previous problem, how would you change the context, or the value of `this`, to `myObject`?

### Solution:
```js
myObject.myChildObject.myMethod.call(myObject);
```
Alternative:
```js
myObject.myChildObject.myMethod.call(myObject);
```

## 3. What does the following code log to the console?
```js
let person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

let whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman();
```

### Solution:
`Peter Parker is the Amazing Spiderman!`

## 4. What does the following code log to the console?
```js
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
```
If you want this program to log 34000, how would you fix it?

### Solution:
```js
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    let self = this;
    function specialDiscount() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
```

Alternatives 1:
```js
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    let specialDiscount = function () {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }.bind(this);

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
```

Alternative 2:
```js
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    };

    return this.price + this.shipping + tax - specialDiscount.call(this);
  }
};

console.log(computer.total());
```

Alternative 3:
```js
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    let specialDiscount = () => {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    };

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
```