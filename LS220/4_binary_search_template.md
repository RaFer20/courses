# Binary Search Template
When writing code for binary search, one common challenge is dealing with off-by-one errors. These errors arise when determining the iteration conditions and deciding which elements to eliminate at each step of the search. Specifically:

- We have to decide whether to iterate until `left < right`, `left + 1 < right`, or `left <= right`
- If we want to eliminate the left half of the remaining search space, we face the dilemma of whether to reassign the left pointer to `mid` or `mid + 1`.
- On the other hand, if we aim to remove the right half, we encounter the uncertainty of whether to reassign the right pointer to `mid` or `mid - 1`.

Template:
```js
let left = 0
let right = array.length - 1
while (left <= right) {
  mid = Math.floor((left + right) / 2)
  if (array[mid] == target) {
    // Optional early return
  } else if (***comparison***) {
    left = mid + 1
  } else {
    right = mid - 1
  }
}
```
Most often, if the target is not found, additional handling
or returning a specific value is needed. In most cases it will
be the value that `left` variable holds.

## Practice Problem 1
```js
// Write a function named findInsertPosition that takes in a
// sorted array of distinct integers and a target value as input.
// The function should return the index where the target value is
// found in the array, or the index where it would be inserted if
// it were not found.

// If the target value is found in the array, the function should
// return the index of the target value. If the target value is not found,
// the function should return the index where it would be inserted
// while maintaining the sorted order of the array.

// Example:
// Input: nums = [3, 5, 7, 9, 11], target = 9
// Output: 3

// Example:
// Input: nums = [3, 5, 7, 9, 11], target = 2
// Output: 0

function findInsertPosition(sortedArray, target) {
  let start = 0;
  let end = (sortedArray.length - 1);

  while (start <= end) {
    mid = Math.floor((start + end) / 2)
    if (sortedArray[mid] === target) {
      return mid;
    }else if (sortedArray[mid] < target) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }

  return start;
}

console.log(findInsertPosition([3, 5, 7, 9, 11], 9));
console.log(findInsertPosition([3, 5, 7, 9, 11], 2));
```

## Practice Problem 2
```js
// You are given a sorted array of integers in ascending order.
// Your task is to find the starting and ending positions of
// a given target value within the array.

// Implement a function findRange that takes in an array of integers
// "nums" and a target value "target". The function should return an array
// containing the starting and ending positions of the target value
// within the array. If the target value is not found, return [-1, -1].

// Example:
// Input: nums = [1, 2, 3, 3, 3, 3, 3, 4, 5], target = 3
// Output: [2, 6]

// Example:
// Input: nums = [1, 2, 3, 3, 3, 5, 6,], target = 4
// Output: [-1, -1]
function findRange(nums, target) {
  return [findLeftMostIndex(nums, target), findRightMostIndex(nums, target)];
}

function findLeftMostIndex(nums, target) {
  let left = 0;
  let right = nums.length - 1;
  let currLeftMost = -1;
  while (left <= right) {
    mid = Math.floor((left + right) / 2);
    if (nums[mid] == target) {
      currLeftMost = mid;
      right = mid - 1;
    } else if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return currLeftMost;
}

function findRightMostIndex(nums, target) {
  let left = 0;
  let right = nums.length - 1;
  let currRightMost = -1;
  while (left <= right) {
    mid = Math.floor((left + right) / 2);
    if (nums[mid] == target) {
      currRightMost = mid;
      left = mid + 1;
    } else if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return currRightMost;
}

console.log(findRange([1, 2, 3, 3, 3, 3, 3, 4, 5], 3)) // [2, 6]
console.log(findRange([1, 2, 3, 3, 3, 5, 6,], 4))      // [-1, -1]
```