You have a bank of switches before you, numbered from `1` to `n`. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches `2`, `4`, `6`, and so on. On the third pass, you go back to the beginning again, this time toggling switches `3`, `6`, `9`, and so on. You continue to repeat this process until you have gone through `n` repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after `n` repetitions.

Examples:
```js
function lightsOn(switches) {
  // ...
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

# Problem
Write a function that takes a number of switches and returns an array of lights that remain on after `n` repetitions
`n` in this case is the amount of lights, 5 lights === 5 rounds of flipping the switches
on every round we flip switches in a sequence of increasing multiples

# Examples / Test Cases
```js
function lightsOn(switches) {
  // ...
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

# Data Structures
Object and Array

# Algorithm
initialize an object and set each number to false
start a for loop, keep iterating while round is less than or equal to `n`
start a for loop with `i` = 0
- flip the switch for each switch where `i % round === 0`
- - lightsObj[i] = !lightsObj[i]
- round += 1
filter the keys that have a value of true and transform them to numbers
return the array


# Code
```js
function lightsOn(switches) {
  let lightsObj = {};
  for (let i = 1; i <= switches; i++) {
    lightsObj[i] = false;
  }

  for (let round = 1; round <= switches; round += 1) {
    for (let num = 1; num <= switches; num += 1) {
      if (num % round === 0) {
        lightsObj[num] = !lightsObj[num];
      }
    }
  }

  return Object.keys(lightsObj).filter(n => lightsObj[n] === true).map(Number)
}
```

Alternative:
```js
function lightsOn(n) {
  let lights = initializeLights(n);

  for (let i = 1; i <= n; i += 1) {          // rounds: 1..n
    lights = toggleLights(lights, i);
  }

  let result = [];
  for (let i = 0; i < n; i += 1) {           // indices: 0..n-1
    if (lights[i]) {
      result.push(i + 1);
    }
  }

  return result;
}

function initializeLights(n) {
  const lights = [];

  for (let i = 0; i < n; i += 1) {
    lights.push(false);
  }

  return lights;
}

function toggleLights(lights, round) {
  return lights.map((light, index) => (index + 1) % round === 0 ? !light : light);
}
```