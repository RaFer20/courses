# Pointer Based Mental Models
When it comes to optimizing algorithms for lists, arrays, and strings (which may be thought of as arrays of characters), one powerful technique stands out: Pointer-Based Mental Models. This approach offers an optimization strategy that can transform our naive algorithms from quadratic solutions `O(N^2)` to linear solutions `O(N)`, all while preserving a constant space complexity `O(1)`. The greatest advantage of using pointer-based approaches is that they improve time complexity without the need for additional data structures.

## Start/End
The start-end pointer strategy is a powerful optimization technique commonly used for solving problems on sorted arrays. By utilizing two pointers, one starting at the beginning (start pointer) and the other starting at the end (end pointer), we can efficiently navigate the array and optimize our solution. 

To effectively use the start-end pointer strategy, we need to answer several key questions:

1. Where does my start pointer begin?
2. Where does my end pointer begin?
3. Under which condition do I move the start pointer?
4. Under which condition do I move the end pointer?
5. Under which condition do I cease the iteration?


### Example Problem

```js
// Given a sorted array in ascending order, our task is to find two numbers
// in the array that sum up to a target number, and return them.

// If you don't find a pair that adds up to the target, return null.

// The order of the output array matters, and the number that appears first
// should be the first one in the output array.

// Example:
// Input: nums = [1, 3, 6, 7, 8, 12], target = 14
// Output: [6, 8]

// Input: nums = [2, 6, 8, 10], target = 20
// Output: null
// Explanation: None of the pairs add up to 20.
function findTwoSum(array, target) {
  let start = 0;
  let end = array.length - 1;

  while (start < end) {
    const sum = array[start] + array[end];
    if (sum === target) {
      return [array[start], array[end]];
    } else if (sum < target) {
      start++;
    } else {
      end--;
    }
  }
  return null;
}

console.log(findTwoSum([1, 3, 6, 7, 8, 12], 14)); // [6, 8];
console.log(findTwoSum([2, 6, 8, 10], 20)); // null;
```

## Anchor/Runner
The anchor-runner pointer strategy is a widely-used approach for solving problems that involve manipulating arrays in place. 

To effectively use the anchor-runner pointer strategy, just like with the start-end pointer strategy, we need to answer several key questions:

1. Where does my anchor pointer start?
2. Where does my runner pointer start?
3. Under which condition do I move the anchor pointer?
4. Under which condition do I move the runner pointer?
5. What does the anchor do besides moving?
6. What does the runner do besides moving?

### Example Problem
```js
// Given an array of positive integers and zeroes, our task is
// to move all zeroes to the end of the array while preserving
// the relative order of non-zero elements. The goal is to solve
// this problem in constant space complexity.

// If no zeroes are present in the array, no changes are needed.

// Example:
// Input: nums = [0, 2, 0, 4, 8]
// Output: [2, 4, 8, 0, 0]
function moveZeroesToEnd(arr) {
  let anchor = 0;
  let runner = 0;

  while (runner < arr.length) {
    if (arr[runner] !== 0) {
      [arr[anchor], arr[runner]] = [arr[runner], arr[anchor]];
      anchor++;
    }
    runner++;
  }

  return arr;
}

const array = [0, 2, 0, 4, 8];
const transformedArray = moveZeroesToEnd(array);
console.log(transformedArray); // [2, 4, 8, 0, 0]

// Reader-Writer Variant
function moveZeroes(nums) {
  let writer = 0;
  let reader = 0;

  while (reader < nums.length) {
    if (nums[reader] !== 0) {
      nums[writer] = nums[reader];
      writer++;
    }
    reader++;
  }

  while (writer < nums.length) {
    nums[writer] = 0;
    writer++;
  }

  return nums;
}

const nums = [0, 2, 0, 4, 8];
console.log(moveZeroes(nums)); // Output: [2, 4, 8, 0, 0]
```
Both of these variants allow us to solve the problem in a linear O(N) time complexity. The space complexity is O(1) since we modify the array in-place without using any extra space.

When dealing with arrays, in the majority of cases, this is just a matter of stylistic preference, and wherever you can use the reader-writer variant, you can also use the anchor-runner. The situation becomes different when dealing with linked lists, as the option to swap elements of the list is no longer available to us, so, to perform mutation of node values in place, we would have to use the reader-writer variant.

## K-Window Slide
The K Window Slide strategy within the Two Pointers approach enables us to efficiently solve problems by having two pointers traverse the array at the same pace, while maintaining a fixed distance or window size (K) between them.

To understand the K Window Slide strategy, we need to answer the following questions:

1. Where do the left and right pointers start (what is the size of the window)?
2. What does the left pointer do besides moving?
3. What does the right pointer do besides moving?

### Example Problem
```js
// Write a function that takes an array of integers and an integer k
// as inputs and returns the maximum sum of any consecutive k elements in
// the array. If the array contains less than k elements, the
// function should return null.
// If the integer k is less than 1 return null as well.

// Example:
// Input: nums = [3, 2, 6, 5, 1, 10, -2], k = 4
// Output: 22

// Input: nums = [1, 2, 3], k = 4
// Output: null

// Input: nums = [1, 2, 3], k = 0
// Output: null
function maximumSum(nums, k) {
  if (nums.length < k || k < 1) {
    return null;
  }
  let left = 0;
  let right = k - 1;
  let sum = 0;

  for (let i = 0; i <= right; i++) {
    sum += nums[i];
  }

  let max = sum;

  while (right < nums.length - 1) {
    sum -= nums[left];
    left++;
    right++;
    sum += nums[right];
    max = Math.max(max, sum);
  }
  return max;
}

console.log(maximumSum([1, 2, 3, 4, 5, 6], 4)); // 18
console.log(maximumSum([1, 2, 3], 4)); // null
console.log(maximumSum([1, 2, 3], 0)); // null
```
This approach has a time complexity of O(N), where N is the length of the input array. It avoids the need for nested loops or additional data structures, making it an efficie