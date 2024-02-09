A distinct string is a string that is present only once in an array.

Given an array of strings, arr, and an integer, k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty string "".

Note that the result string is the one encountered earliest in the array.
```js
distinctString(["d","b","c","b","c","a"], 2); // "a"
```

# Problem
Write a function that given an array and a number, returns the nth 'distinct' element in that array
If the element does not exist (fewer than `n`, `n` is 0 or less, empty array) return an empty string

# Examples / Test Cases
```js
distinctString(["d","b","c","b","c","a"], 2);     // "a"
distinctString(["d","b","c","b","c","a"], -1);    // ""
distinctString(["d","b","c","b","c","abcde"], 2); // "abcde"
distinctString(["d","b","c","b","c","a"], 0);     // ""
distinctString([], 3);                            // ""
```

# Data Structures
Array

# Algorithm
initialize an empty array `distinct`
iterate through the elements in `arr` 
- if current element exists only once, push it into `distinct`
- else ignore that element
return the element at index `n - 1`, return empty string instead if it doesnt exist


# Code
```js
function distinctString(arr, n) {
  const distinct = [];

  for (let i = 0; i < arr.length; i += 1) {
    if (arr.filter(element => element === arr[i]).length === 1) {
      distinct.push(arr[i]);
    }

    if (distinct.length === n) {
      return distinct[n - 1]
    }
  }
  
    return '';
}
```