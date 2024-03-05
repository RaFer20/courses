# Practice Problems:  Hard Binding Functions with Contexts

1. What method can we use to permanently bind a function to a particular execution context?

Solution:
We can use the `Function` method `bind`.

2. What will the code below log to console?
```js
let obj = {
  message: 'JavaScript',
};

function foo() {
  console.log(this.message);
}

foo.bind(obj);
```

Solution:
Nothing, `bind` will instead return a *new* function that is bound to the context argument permanently.

3. What will the code below output?
```js
let obj = {
  a: 2,
  b: 3,
};

function foo() {
  return this.a + this.b;
}

let bar = foo.bind(obj);

console.log(bar());
```

Solution:
`5` will be logged to the console. The value of `bar` is a `foo` function that is bound to `obj` permanently, so `this` refers to `obj`.


4. What will the code below log to the console?
```js
let positiveMentality = {
  message: 'JavaScript makes sense!',
};

let negativeMentality = {
  message: 'JavaScript makes no sense!',
};

function foo() {
  console.log(this.message);
}

let bar = foo.bind(positiveMentality);

negativeMentality.logMessage = bar;
negativeMentality.logMessage();
```

Solution:
`'JavaScript makes sense!'` will be logged to the console. We are adding `bar` as a property to `negativeMentality`, the `bar` function is bound to `positiveMentality`.

5. What will the code below output?
```js
let obj = {
  a: 'Amazebulous!',
};
let otherObj = {
  a: "That's not a real word!",
};

function foo() {
  console.log(this.a);
}

let bar = foo.bind(obj);

bar.call(otherObj);
```

Solution:
`Amazebulous!` will be logged to the console. Even though we attempt to explicitly change the context with `call` the `bar` function is permanently bound to `obj` so when we invoke it `this` will point to `obj` instead of `otherObj`.