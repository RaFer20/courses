# Functional Scopes and Lexical Scoping
In JavaScript, every function or block creates a new variable scope.

## The Global Scope
Very small JavaScript programs with no functions or blocks exist entirely within a single scope called the global scope:
```js
let name = 'Julian';
console.log(name);
```

## Function Scope
```js
let name = 'Julian';

function greet() {
  let myName = name;
  console.log(myName);
}

greet();   // => Julian
```
With this code, we now have two scopes: (1) the global scope and (2) the scope from the declaration of the `greet` function. In this code, `name` and `greet` are in the global scope, while `myName` is in the local scope of `greet`. Within the function, we can access the `name` variable since the code within a function can access all variables in all surrounding scopes. However, `myName` is only available inside of `greet` -- variables declared inside a function have function scope, and they cannot be accessed outside the body of the function.


## Block Scope
```js
let name = 'Julian';       // `name` is in global scope

function greet() {         // `greet` is also in global scope
  let counter = 0;         // `counter` is in function scope
  while (counter < 3) {
    let myName = name;     // `myName` is in block scope
    console.log(myName);
    counter += 1;
  }

  // console.log(myName); // would raise an error (myName not in scope)
  console.log(counter);   // => 3
}

greet();                  // => Julian (3 times)
// console.log(myName);   // would raise an error (not in scope)
// console.log(counter);  // would raise an error (not in scope)
```
We now have a block scope, introduced by the block used by the `while` loop. As with function scopes, the code inside a block scope can access any variables declared in the surrounding (outer) scope(s).

We now have three scopes: (1) the global scope (which includes `name` and `greet`). the function scope (which includes `counter`), and (3) the block scope of the loop, which includes `myName`. Both function and block scopes are also called local scopes.

# Lexical Scoping
JavaScript uses Lexical Scoping to determine where it looks for variables; it uses the structure of the source code to determine the variable's scope. That is, the source code defines the scope. This means that when you write a function in your code, it creates a scope even if the function never gets executed and has no variables of its own. At any point in a JavaScript program, there is a hierarchy of scopes from the local scope of the code up to the program's global scope.

When JavaScript tries to find a variable, it searches this hierarchy from the bottom to the top. It stops and returns the first variable it finds with a matching name. This means that variables in a lower scope can shadow, or hide, a variable with the same name in a higher scope.

## Adding Variable to the Current Scope
- Use the `let` or `const` keywords.
- Use the `var` keyword, which we'll introduce later in this lesson.
- Define parameters for a function - each parameter is a local variable.
- A function declaration creates a variable with the same name as the function.
- A class declaration also creates a variable with the same name as the class.

```js
function lunch() {    // A function declaration creates a new variable scope
  let food = 'taco';  // 1. Add a new variable food within the current variable scope
}

function eat(food) {  // 2. Parameters create variables during function invocation
  console.log('I am eating ' + food);
}

function drink() {    // 3. Add a new variable drink within the global variable scope
  console.log('I am drinking a glass of water');
}
```

```js
let country = 'Spain';
function update() {
  country = 'Liechtenstein';
}

console.log(country);  // logs: Spain

update();
console.log(country);  // logs: Liechtenstein
```
This code checks the current scope and then each higher scope, looking for a variable with the name `country`. JavaScript sets the first `country` variable it finds to "Liechtenstein".

If JavaScript can't find a matching variable, it creates a new global variable instead. *This is rarely what you want*; it can be the source of subtle bugs.

```js
// no other code above
function assign() {
  let country1 = 'Liechtenstein';
  country2 = 'Spain';
}

assign();
console.log(country2);   // logs: Spain
console.log(country1);   // gets ReferenceError
// no other code below
```

## Variable Shadowing
```js
let name = 'Julian';

function greet() {
  let name = 'Logan';
  console.log(name);
}
```
The variable declaration for `name` in the `greet` function shadows the outer `name` variable. Within greet, you can only access the inner `name`.