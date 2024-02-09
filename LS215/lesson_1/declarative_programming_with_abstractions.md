# Declarative Programming with Abstractions

## Imperative Style
```js
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let newArray = [];

for (let i = 0; i < array.length; i += 1) {
  if (array[i] % 2 === 1) {
    newArray.push(array[i]);
  }
}

console.log(newArray);
```

## Imperative Style with Function Abstractions
```js
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let newArray = [];

for (let i = 0; i < array.length; i += 1) {
  if (isOddNumber(array[i])) {
    newArray.push(array[i]);
  }
}

console.log(newArray);

function isOddNumber(number) {
  return number % 2 === 1;
}
```
Here, we define a new function, isOddNumber. This moves the details of detecting odd numbers to the body of that function. Now, when we read the if statement, the function's name tells us what the conditional does. By moving the "how to do something" and focusing on "what we need to do," we raise the abstraction level of the program.

## Iteration Focused Abstraction
```js
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let newArray = [];

array.forEach(element => {
  if (isOddNumber(element)) {
    newArray.push(element);
  }
});

console.log(newArray);

function isOddNumber(number) {
  return number % 2 === 1;
}
```
This raises the abstraction level again. This time, though, we rely on the built-in `Array.prototype.forEach` method instead of writing a new function. This lets us focus on "what to do as we iterate through the array," instead of having to deal with the mechanics of looping through an array with a `for` loop.

## Filter Abstraction that Truly Reflects the Purpose
```js
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let oddNumbers = array.filter(element => isOddNumber(element));
console.log(oddNumbers);

function isOddNumber(number) {
  return number % 2 === 1;
}
```

Since `isOddNumber` is a first-class function, we can refactor the code to:
```js
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let oddNumbers = array.filter(isOddNumber);

console.log(oddNumbers);

function isOddNumber(number) {
  return number % 2 === 1;
}
```
Finally, we raise the abstraction level once more. This time, instead of expressing the solution on the abstraction level of "create a new empty array, iterate through the original array and push the odd numbers onto the new array, and log the new array to the console", we express the solution as "filter the original array to get odd numbers and log them on the console." This is exactly the same level of abstraction as the requirements, and is also the level of abstraction that humans usually operate on. The resulting code, once you get used to the syntax, shows our purpose:

- more readable, since it fits our mental model of the problem.
- more concise, since the code is shorter.
- more robust, since we now use a built-in abstraction (filter) instead of writing our own function.

# Declarative Programming
The higher the level of abstraction that you work with, the more declarative your code is. Declarative programming frees programmers to think on a higher level that's more natural for humans. We focus on writing a good description of the problem to solve, and the computer takes care of the rest. In comparison, imperative programming often means that you must imagine yourself as the computer – "I am going to do this first, then if this condition is true I do x, otherwise I do y.", "I need to use this variable to hold this value, then increment it as I go through this array". Obviously, we are more productive and happier when we think like humans, and don't have to pretend to be computers.

The JavaScript language provides a rich list of built-in list processing abstractions that let you program declaratively. You can also build your own abstractions to "push down" the implementation details, elevate your thinking, and let your code communicate its true intent.

## List Processing Abstractions
| **Abstraction**       | **Used To**                                              | **Returns**   | **Array Methods**   |
|-----------------------|----------------------------------------------------------|---------------|---------------------|
| Iteration             | Perform an operation on each element in an Array         | undefined     | forEach             |
| Filtering / Selection | Select a subset of elements                              | new Array     | filter              |
| Transformation        | Compute a new value from each element                    | new Array     | map                 |
| Ordering              | Rearrange elements by sorting the Array in place         | sorted Array  | sort                |
| Reducing / Folding    | Iteratively compute a result based on all element values | single value  | reduce, reduceRight |
| Interrogation         | Determine whether an Array's elements meet a condition   | boolean value | every, some         |