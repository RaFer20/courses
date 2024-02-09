# Functions
Function definition:
```js
function funcName() {
  func_body;
}
```

function named `say`
```js
function say() {
  console.log("Hi!");
}
```

defult parameters:
```js
function say(text = "hello") {
  console.log(text + "!");
}

say("Howdy"); // => Howdy!
say();        // => hello!
```

# Nested Functions
```js
function foo() {
  function bar() {
    console.log("BAR");
  }

  bar(); // => BAR
  bar(); // => BAR
}

foo();
bar(); // ReferenceError: bar is not defined
```
Here, the bar function is nested within the foo function. Such nested functions get created and destroyed every time the outer function runs. (This usually has a negligible effect on performance.) They are also private functions since we can't access a nested function from outside the function where it is defined.

# Functions vs. Methods
Method invocation occurs when you prepend a variable name or value followed by a period (.) to a function invocation, e.g., 'xyzzy'.toUpperCase(). We call such functions methods.

# Reassignment and Mutations
```js
let num = 3;              // A variable assigned to a primitive value
let arr = [1, 2, 3];      // A variable assigned to an array
let obj = { a: 1, b: 2 }; // A variable assigned to an object

num = 42;    // Reassignment
arr[1] = 42; // Reassignment of array element, but NOT the variable
             // The array referenced by arr is mutated!
obj.a = 42;  // Reassignment of object property, but NOT the variable
             // The object referenced by obj is mutated.

// You can still reassign the variables
arr = 42;                 // Reassignment; array is lost
obj = { b: 1, c: 2 }      // Reassignment: now refers to a different object
```

# Three ways to define a function
## function declaration
```js
function functionName(zeroOrMoreArguments...) {
  // function body
}
```
In JavaScript, we call a function definition that looks like that a `function declaration`. A notable property of function declarations is that you can call the function before you declare it. 

Example of invoking a function before declaring it:
```js
greetPeople();

function greetPeople() {
  console.log("Good Morning!");
}
```

## Another way to define a function called a function expression.
```js
let greetPeople = function () {
  console.log("Good Morning!");
};

greetPeople();
```

Any function definition that doesn't have the word `function` at the very beginning of a statement is a function expression. Even wrapping what looks like a function declaration in parentheses creates a function expression:
```js
(function greetPeople() { // This is a function expression, not a declaration
  console.log("Good Morning!");
});
```

## Arrow function
```js
let add = (a, b) => a + b;
```
Note the lack of a return statement. We can omit it in arrow functions when and only when the function body contains a single expression that is not itself surrounded by curly braces (the expression may have subexpressions, but the entire expression must evaluate to a single value). Suppose it contains two or more expressions or statements. In that case, you must explicitly return a value if you need it, and you must also use curly braces:
```js
let add = (a, b) => a + b;
let getNumber = (text) => {
  let input = prompt(text);
  return Number(input);
};

let number1 = getNumber("Enter a number: ");
let number2 = getNumber("Enter another number: ");
console.log(add(number1, number2));
```