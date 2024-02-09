To look at the steps of this problem solving approach in depth, we will work through a problem and see how to apply each step in the process. The problem we will look at compares software version numbers.

While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:
```js
1
1.0
1.2
3.2.3
3.0.0
4.2.3.0
```

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

If version1 `>` version2, we should return `1`.
If version1 `<` version2, we should return `-1`.
If version1 `===` version2, we should return `0`.
If either version number contains characters other than digits and the . character, we should return null.
Here is an example of version number ordering:
```js
0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
```

```js
function compareVersions(version1, version2) {
  // ...
}
```


# First attempt
```js
function compareVersions(version1, version2) {
  if (version1.match(/[^0-9.]/g) || version2.match(/[^0-9.]/g)) {
    return null;
  } else  if (version1.match(/^\.|\.{2,}|\.$/g) || version2.match(/^\.|\.{2,}|\.$/g)) {
    return null;
  }

  let v1 = version1.split(`.`);
  let v2 = version2.split(`.`);

  console.log(compareByNum(v1, v2));
}

function compareByNum(array1, array2) {
  let length = array1.length > array2.length ? array1.length : array2.length;
  
  for (let i = 0; i < length; i += 1) {
    if (array1[i] === undefined) {
      array1[i] = 0;
    }
    if (array2[i] === undefined) {
      array2[i] = 0;
    }
    
    if (Number(array1[i]) > Number(array2[i])) {
      return 1;
    } else if (Number(array1[i]) < Number(array2[i])) {
      return -1;
    } else {
      continue;
    }
  }
  return 0;
}
```

# Understanting The Problem
- Input: two version numbers in string representation, version1 and version2
- Output: one of the numbers from 1, 0, and -1; or null for invalid inputs

Rules:
- if any inputs contain invalid characters, return null
  - any characters other than digits and . are considered invalid
- Compare the two input versions
  - if version1 > version2, return 1
  - if version1 < version2, return -1
  - if version1 === version2, return 0
- The rules to compare two version numbers
  - start from the left most parts of the two version numbers
  - if the number part of the first version number is larger, then the first version number is larger
  - if the number part of the second version number is larger, then the first version number is smaller
  - if the number parts of both version numbers are the same, move to the next number part of the two version numbers
    - do the same comparison and decide which version number is larger
    - keep moving to the right until the result of the comparison is determined
    - if we get to the last number part of the two version numbers and they're equal,
      then the two version numbers are equal

# Test Cases / Examples
```js
1 is equal to 1
1.1 is greater than 1.0
2.3.4 is less than 2.3.5
```

Edge Cases:
```js
1.a is not a valid version          // we only want to deal with numbers and dots
.1 and 1. are not valid versions    // versions must begin and end with a number
1..0 is not a valid version         // dots can only appear between two numbers
1.0 and 1.0.0 are equal to 1        // zeros can be inferred but are not always shown
1.0.0 is less than 1.1              // can handle version numbers with different lengths
1.0 is less than 1.0.5              // can handle version numbers with different lengths
```

test cases:
```js
console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
```

```js
- if any inputs contain invalid characters, return null
  - any characters other than digits and . are considered invalid
- Compare the two input versions
  - if version1 > version2, return 1
  - if version1 < version2, return -1
  - if version1 === version2, return 0
- The rules to compare two version numbers
  - start from the left most parts of the two version numbers
  - if the number part of the first version number is larger, then the first version number is larger
  - if the number part of the second version number is larger, then the first version number is smaller
  - if the number parts of both version numbers are the same, move to the next number part of the two version numbers
    - do the same comparison and decide which version number is larger
    - keep moving to the right until the result of the comparison is determined
      - if we reach the end of only one number, pad that number with a 0 part
    - if we get to the last number part of the two version numbers and they're equal,
      then the two version numbers are equal
```

# Data Structure Choice
An array of numbers makes it easy to express what we're trying to accomplish.
which is:
```js
- iterate through the version numbers, part by part
- compare part numbers
```

# Algorithm
```js
- return null if the inputs contain any characters other than digits and dots
- split the input numbers into parts as arrays of integers
- loop through the two version numbers' parts
  - for each step, access one part from each version number
  - if one version number runs out of parts, use 0
  - compare the two parts
    - if part1 < part2
      - return -1
    - if part1 > part2
      - return 1
    - if part1 === part2
      - we move to the next pair of parts
- when we reach the end of the loop, return 0
```

# Code


```js
function compareVersions(versionA, versionB) {
  let validChars = /^[0-9]+(\.[0-9]+)*$/;

  if (!validChars.test(versionA) || !validChars.test(versionB)) {
    return null;
  }

  let aParts = versionA.split('.').map(Number);
  let bParts = versionB.split('.').map(Number);
  let maxLength = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < maxLength; i += 1) {
    let aValue = aParts[i] || 0;
    let bValue = bParts[i] || 0;

    if (aValue > bValue) {
      return 1;
    } else if (aValue < bValue) {
      return -1;
    }
  }

  return 0;
}
```