What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
logValue();

function logValue() {
  console.log('Hello, world!');
}
```

`Hello, world!` Because of "hoisting" both the function declaration and body are hoisted and we're able to call the function even before declaring it.


# Further Exploration
Let's refactor the code a bit. What does it log now? What is the hoisted equivalent of this code?
```js
var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);
```

`string` The `function` declaration gets hoisted above the `var` variable declaration, execution eventually reacher the `logValue = 'foo';` assignment turning `logValue` into a string.