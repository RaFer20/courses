# How Old is Teddy?
Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

Example Output:
```js
Teddy is 69 years old!
```

## Solution
```js
function randomNumBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

const age = randomNumBetween(20, 200);

console.log(`Teddy is ${randomNumBetween(20, 200)} years old!`)
```

## Further Exploration
- The randomBetween function used the Math.floor() method. Would it make a difference if the Math.round() method was used instead?
On very rare occassion it could round up to 201.

- Also, how can we make the function more robust? What if the user inadvertently gave the inputs in reverse order (i.e., the value passed to min was greater than max)?
```js
function randomNumBetween(min, max) {
  if (min > max) {
    [max, min] = [min, max];
  }
  
  return Math.floor(Math.random() * (max - min + 1) + min);
}

const age = randomNumBetween(20, 200);

console.log(`Teddy is ${randomNumBetween(20, 200)} years old!`)
```