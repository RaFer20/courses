# Array Object Part 2
A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the `average` function to return 5. Is the user's expectation correct? Why or why not?
```js
const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

average(myArray);
```

## Solution
No, the output will be 10 because even though we have added values to `myArray`, the values using negative indices do not affect the length of the array. This means that the last line of the function is returning `20/2` since the array only has a length of 2.

## Further Exploration
Refactor the `average` function so that it returns the result that the user expected, 5.

```js
const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;
  let counter = 0;

  for (value in array) {counter+= 1}

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / counter;
}

average(myArray);
```