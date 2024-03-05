# Hard Binding Functions with Contexts
JavaScript has a bind method that lets us bind a function to a context object permanently:
```js
let object = {
  a: 'hello',
  b: 'world',
  foo() {
    return this.a + ' ' + this.b;
  },
};

let bar = object.foo;
bar();                                // "undefined undefined"

let baz = object.foo.bind(object);
baz();                                // "hello world"

let object2 = {
  a: 'hi',
  b: 'there',
};

bar.call(object2);  // "hi there"

baz.call(object2);  // "hello world" - `this` is still `object`
```
Unlike `call` or `apply`, `bind` doesn't execute the function that invokes it. Instead, it creates and returns a new Function that permanently binds the invoking function to a given context object. Thus, we can pass the returned function around without concern that its context will change; it won't -- we will always be able to use it to call the original function with the desired context.

`bind` is implemented something like this:
```js
Function.prototype.bind = function (...args) {
  let fn = this;
  let context = args.shift();
  // Remaining arguments are "pre-bound" arguments that will be passed to fn

  return function (...moreargs) {
    let allArgs = args.concat(moreargs);
    // Combine pre-bound args with args supplied when calling the function
    // returned by `bind`.
    return fn.apply(context, allArgs);
  };
};
```
`bind`'s context is the original function, and it returns a new function that calls the original function with the context supplied to `bind` as its first argument. This code also shows why the binding makes permanent changes -- no matter what you do to the returned function, you can't change the value of context.

Another example of using `bind`:
```js
let greetings = {
  morning: 'Good morning, ',
  afternoon: 'Good afternoon, ',
  evening: 'Good evening, ',

  greeting(name) {
    let currentHour = (new Date()).getHours();

    if (currentHour < 12) {
      console.log(this.morning + name);
    } else if (currentHour < 18) {
      console.log(this.afternoon + name);
    } else {
      console.log(this.evening + name);
    }
  },
};

let spanishWords = {
  morning: 'Buenos dias, ',
  afternoon: 'Buenas tardes, ',
  evening: 'Buenas noches, ',
};

let spanishGreeter = greetings.greeting.bind(spanishWords);

spanishGreeter('Jose');
spanishGreeter('Juan');
```
In this example we bind `greetings` to `spanishWords` and assing the values to `spanishGreeter`.
When we call `spanishGreeter()` JavaScript will use `spanishWords` as the `this` value.