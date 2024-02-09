
# While loops
A while loop uses the while keyword followed by a conditional expression in parentheses and a block. The loop executes the block again and again for as long as the conditional expression remains truthy.

```js
let counter = 1;
while (counter <= 10) {
  console.log(counter);
  counter = counter + 1;
}

```


```js
counter += 1;

> let a = 3
> a *= 4            // 3 * 4
= 12

> a /= 6            // 12 / 6
= 2

> a -= 2            // 2 - 2
= 0
```

The `increment operator` (++) increments its operand by 1; that is, it adds 1 to the existing value. There's a corresponding `decrement operator` (--) that decrements a variable's value by 1. That is, it subtracts 1 from the value. 

There are two forms of ++: one that comes before the variable name (the pre-increment operator), and one that comes after (the post-increment operator). Both increment the variable, but they differ in what gets returned by the expression. The pre-increment form returns the new value of the variable, while the post-increment form returns the previous value of the variable.

```js
> let a = 1;
> ++a;
= 2

> a
= 2

> a++
= 2

> a
= 3
```
## note
  There are corresponding pre-decrement and post-decrement operators (e.g., --a and a--) that work in a similar way.

  There's a growing sentiment among some developers that the increment and decrement operators are harmful. It's easy to mistype them in ways that can lead to strange bugs, especially if you're not mindful of the return values. They recommend using the += and -= operators instead; it's only a few characters more to type.
  Most developers still use them in the increment clause of a for loop:
  ```js
  for (var index = 0; index < 5; ++index) {
    // body of loop
  }
  ```
  However, they shouldn't be used anywhere else.

## Looping over arrays with while
Let's write a program that iterates over the names in an array of names and creates a new array with the names in uppercase:
```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
let upperNames = [];
let index = 0;

while (index < names.length) {
  let upperCaseName = names[index].toUpperCase();
  upperNames.push(upperCaseName);
  index += 1;
}

console.log(upperNames); // => ['CHRIS', 'KEVIN', 'NAVEED', 'PETE', 'VICTOR']
```

# do/while loop
A `do/while loop` differs visibly from a while loop, but its behavior is almost identical. The crucial difference is that do/while always executes the code in the block at least once. A while loop can't make that guarantee since the initial condition may be falsy; if it is, the loop body doesn't run. In a `do/while loop`, the conditional check occurs at the end of the loop instead of the beginning which allows it to run the code at least once, even if the condition is falsy when the loop begins.
```js
let answer;
do {
  answer = prompt("Do you want to do that again?");
} while (answer === 'y');
```

# For loops
`for` loops have the same purpose as `while` loops, but they use a condensed syntax that works well when iterating over arrays and other sequences. A for loop combines variable initialization, a loop condition, and the variable increment/decrement expression all on the same line:

```js
for (initialization; condition; increment) {
  // loop body
}
```
which is similar to:
```js
initialization;
while (condition) {
  // loop body
  increment;
}
```

```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
let upperNames = [];

for (let index = 0; index < names.length; index += 1) {
  let upperCaseName = names[index].toUpperCase();
  upperNames.push(upperCaseName);
}

console.log(upperNames); // => ['CHRIS', 'KEVIN', 'NAVEED', 'PETE', 'VICTOR']
```
`for` loops let you see and understand the looping logic at a single glance. The syntax also lets you move the `index` variable from the global scope into the scope of the for statement, and it helps make your code cleaner and more organized.


# Controlling loops
JavaScript uses the keywords `continue` and `break` to provide more control over loops. `continue` lets you start a new iteration of the loop, while `break` lets you terminate a loop early.

## continue
Suppose we want all the uppercase names in our upperNames array except 'Naveed'. The continue statement can help us do that.
```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
let upperNames = [];

for (let index = 0; index < names.length; index += 1) {
  if (names[index] === 'Naveed') {
    continue;
  }

  let upperCaseName = names[index].toUpperCase();
  upperNames.push(upperCaseName);
}

console.log(upperNames); // => ['CHRIS', 'KEVIN', 'PETE', 'VICTOR']
```

You can rewrite a loop that uses `continue` with a negated `if` conditional.
```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
let upperNames = [];

for (let index = 0; index < names.length; index += 1) {
  if (names[index] !== 'Naveed') {
    let upperCaseName = names[index].toUpperCase();
    upperNames.push(upperCaseName);
  }
}

console.log(upperNames); // ['CHRIS', 'KEVIN', 'PETE', 'VICTOR']
```

## break
You sometimes want to skip all remaining iterations of a loop. For instance, when you search an array for a specific value, you probably want to stop searching once you find it. There's no reason to keep searching if you don't need any subsequent matches.
```js
let array = [3, 1, 5, 9, 2, 6, 4, 7];
let indexOfFive = -1;

for (let i = 0; i < array.length; i += 1) {
  if (array[i] === 5) {
    indexOfFive = i;
  }
}

console.log(indexOfFive);
```

Notice that the loop continues executing once it finds the element whose value is 5. It iterates over every element in the array, even if 5 is the first element. That seems pointless and wasteful of precious CPU resources. That's where break steps in and saves the day:
```js
let array = [3, 1, 5, 9, 2, 6, 4, 7]
let indexOfFive = -1;

for (let i = 0; i < array.length; i += 1) {
  if (array[i] === 5) {
    indexOfFive = i;
    break;
  }
}

console.log(indexOfFive);
```

# Array iteration
JavaScript arrays have several methods that iterate over the elements without using the looping syntax we've seen thus far.

One way is to use the built-in forEach method for arrays:
```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];

names.forEach(function(name) {
  console.log(name);
});
```

You may recognize that the function definition is, in fact, a function expression: we talked about them back in the Functions chapter. This function expression doesn't have a name: it's an anonymous function.

One feature of JavaScript that sets it apart from most other languages is that it has first-class functions. That means that functions are values: you can assign them to variables, pass them around as arguments to other functions, and even use them as return values in other functions. 

We can make the code more concise by using an arrow function:
```js
let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];

names.forEach(name => console.log(name));
```

# Recursion
Recursive functions are functions that call themselves. Such code doesn't look much like a loop, but there's a close relationship between loops and recursion. The relationship is close enough that we say that recursion is another way to create loops in JavaScript.

Suppose you want to know the result of doubling a number, then the result of doubling that number, and so on until the number reaches some predefined maximum, such as 50.
```js
function doubler(number) {
  console.log(number * 2);
}
```
Let's refactor doubler to use recursion:
```js
function doubler(number) {
  console.log(number);

  if (number <= 50) {
    doubler(number * 2);
  }
}

doubler(5); // => 5
            // => 10
            // => 20
            // => 40
            // => 80
```
Each invocation of doubler logs a new number, then calls itself with a new value twice that of the input number. To make sure the "loop" stops, we skip the recursive call when the number is greater than 50.

## complex example

```js
function fibonacci(number) {
  if (number < 2) return number; // 0 if number is 0, 1 if number is 1
  return fibonacci(number - 1) + fibonacci(number - 2);
}

console.log(fibonacci(6));  // => 8
console.log(fibonacci(20)); // => 6765
```

Every recursive function has a baseline condition that marks the end of the recursion (`number < 2` in our code) and some code that recursively calls the function with a new argument. In most cases, the baseline condition returns a concrete value that gets reused as the code "unwinds" the recursive calls. Each unwind step uses the previous return value(s) to calculate an intermediate result that gets returned in the next step.