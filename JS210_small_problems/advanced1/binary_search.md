It is quite common to find yourself in a situation where you need to perform a search on some data to find something you're looking for. Imagine that you need to search through the yellow pages to find the phone number of a particular business. A straightforward way to do this would be to go through the yellow pages one business at a time, checking if the current business name is the one you're trying to find.

This may be a simple and easy way to search, but it's not very efficient. In the worst case scenario, it could mean having to search through every single business name before finding out that the business isn't listed—or, slightly better, having to go through every letter from 'A' to 'Z' before finding the business. A linear search such as this can take quite a long time.

A binary search algorithm is a much more efficient alternative. This algorithm allows you to cut the search area in half on each iteration by discarding the half that you know your search term doesn't exist in. The binary search algorithm is able to do this by relying on the data being sorted. Going back to the yellow pages example, let's say that we're searching the following yellowPages data for the search item 'Pizzeria':
```js
// Yellow pages list of business names data:
const yellowPages = ['Apple Store', 'Bags Galore',
                     'Bike Store',  'Donuts R Us',
                     'Eat a Lot',   'Good Food',
                     'Pasta Place', 'Pizzeria',
                     'Tiki Lounge', 'Zooper'];
```
With a linear search, we would have to sequentially go through each of the items until we found the search item 'Pizzeria'. In a binary search, however, the following sequence happens:

- Retrieve the middle value from the data (assume truncation to integer) --> 'Eat a Lot'.
- If the middle value is equal to 'Pizzeria', stop the search.
- If the middle value is less than 'Pizzeria':
- -   Discard the lower half, including the middle value --> ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot'].
- -   Repeat the process from the top, using the upper half as the starting data --> ['Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'].
- If the middle value is greater than 'Pizzeria', do the same as the previous step, but with opposite halves.

Using the process described above, the search successfully ends on the second iteration when the middle value is 'Pizzeria'.

Implement a binarySearch function that takes an array and a search item as arguments, and returns the index of the search item if found, or -1 otherwise. You may assume that the array argument will always be sorted.

Examples:
```js
const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
binarySearch(yellowPages, 'Pizzeria');                   // 7
binarySearch(yellowPages, 'Apple Store');                // 0

binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77);    // -1
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89);    // 7
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5);     // 1

binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter');  // -1
binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler');  // 6
```

# Problem
implement a binary search algorithm, splitting the array to be searched in half over every iteration
Input: array and item to search within the array
Output: index of the item in the array, -1 if the item is not found

# Examples / Test Cases
```js
const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
binarySearch(yellowPages, 'Pizzeria');                   // 7
binarySearch(yellowPages, 'Apple Store');                // 0

binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77);    // -1
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89);    // 7
binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5);     // 1

binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter');  // -1
binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler');  // 6
```

# Data Structures
Array

# Algorithm
initialize a variable `start` and `end` to the first and last indices of the array
start a while loop, break out if start is more than end
initialize `mid` to the result of adding Math.floor(end - start / 2) to start
- if array[mid] is equal to item return mid
- if array[mid] is less than item reassign start to mid + 1
- else reassign end to mid - 1
return -1 if we break out of the while loop

# Code
```js
function binarySearch(array, item) {
  let start = 0;
  let end = array.length - 1;
  
  while (start <= end) {
    let mid = start + Math.floor((end - start)/2);

    if (array[mid] === item) {
      return mid;
    } else if (array[mid] < item) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }

  return -1;
}
```

Alternative:
```js
function binarySearch(array, searchItem) {
  let high = array.length - 1;
  let low = 0;

  while (low <= high) {
    let mid = low + Math.floor((high - low) / 2);
    if (array[mid] === searchItem) {
      return mid;
    } else if (array[mid] < searchItem) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1;
}
```