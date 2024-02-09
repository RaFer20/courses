# How Many
Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.

Example:
```js
const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1
```


## Solution
```js
function countOccurrences(array) {
  const occurrences = {};

  for (let i = 0; i < array.length; i++) {
    if (occurrences[array[i]]) {
      occurrences[array[i]] += 1
    } else {
      occurrences[array[i]] = 1
    }
  }

  for (entry in occurrences) {
    console.log(`${entry} => ${occurrences[entry]}`)
  }
}
```

Alternative:
```js
function countOccurrences(elements) {
  const occurrences = {};

  for (let i = 0; i < elements.length; i += 1) {
    occurrences[elements[i]] = occurrences[elements[i]] || 0;
    occurrences[elements[i]] += 1;
  }

  logOccurrences(occurrences);
}

function logOccurrences(occurrences) {
  for (let item in occurrences) {
    console.log(`${item} => ${occurrences[item]}`);
  }
}
```