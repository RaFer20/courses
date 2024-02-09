# Array Slice and Splice
In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.

The `slice` function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the extracted elements starting from begin up to but not including end. slice does not mutate the original array.

The `splice` function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array, a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index. If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.

Additional specifications:

`slice`:

- The values of begin and end will always be integers greater than or equal to 0.
- If the value of begin or end is greater than the length of the array, set it to equal the length.

`splice`:
- The values of start and deleteCount will always be integers greater than or equal to 0.
- If the value of start is greater than the length of the array, set it to equal the length.
- If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
- Takes optional arguments for elements to add to the array; denoted by the rest parameter ...args. If no elements to add are provided, splice only removes elements from the array.

Examples:
```js
function slice(array, begin, end) {
  // ...
}

slice([1, 2, 3], 1, 2);               // [2]
slice([1, 2, 3], 2, 0);               // []
slice([1, 2, 3], 5, 1);               // []
slice([1, 2, 3], 0, 5);               // [1, 2, 3]

const arr1 = [1, 2, 3];
slice(arr1, 1, 3);                     // [2, 3]
arr1;                                  // [1, 2, 3]

function splice(array, start, deleteCount, ...args) {
  // ...
}

splice([1, 2, 3], 1, 2);              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []

const arr2 = [1, 2, 3];
splice(arr2, 1, 1, 'two');             // [2]
arr2;                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
splice(arr3, 1, 2, 'two', 'three');    // [2, 3]
arr3;                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
splice(arr4, 1, 0);                    // []
splice(arr4, 1, 0, 'a');               // []
arr4;                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
splice(arr5, 0, 0, 'a');               // []
arr5;                                  // ["a", 1, 2, 3]
```

## Solution
```js
function slice(arr, begin, end) {
  let slicedArr = []
  begin = begin > arr.length ? arr.length : begin;
  end = end > arr.length ? arr.length : end;

  for (let i = begin; i < end; i++) {
    slicedArr.push(arr[i]);
  }

  return slicedArr;
}

function splice(array, start, deleteCount, ...args) {
  start = start > array.length ? array.length : start;
  deleteCount = deleteCount > (array.length - start) ? array.length - start : deleteCount;

  const arrayCopy = slice(array, 0, array.length);
  const elementCount = args.length;
  const newLength = array.length + elementCount - deleteCount;
  array.length = newLength;
 
  // insert arguments into the original array
  for (let i = 0; i < elementCount; i += 1) {
    array[start + i] = args[i];
  }

  // copy remaining elements back to the original array
  let copyBackCount = arrayCopy.length - (start + deleteCount);
  for (let i = 0; i < copyBackCount; i += 1) {
    array[start + elementCount + i] = arrayCopy[start + deleteCount + i];
  }

  return slice(arrayCopy, start, start + deleteCount);
}
```