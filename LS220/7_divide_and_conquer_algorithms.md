# Introduction to Divide and Conquer Algorithms
In computer science, the Divide and Conquer algorithm is a problem-solving technique that involves breaking down a complex problem into smaller sub-problems that are easier to solve individually. The solutions to these sub-problems are then combined to obtain the final answer. This algorithm can be divided into three main steps: `divide`, `conquer`, and `combine`.

- Divide: Breaking Down the Problem
- Conquer: Solving the Sub-Problems
- Combine: Merging the Solutions

## Quicksort Algorithm
QuickSort is a popular sorting algorithm used by many programming languages due to its exceptional speed and efficiency, particularly in average scenarios. Though it performs similarly to Insertion Sort and Selection Sort in worst-case scenarios (such as when dealing with inversely sorted arrays), it significantly outperforms them in average scenarios, which are more commonly encountered in practice.

### Partitioning
The fundamental part of the QuickSort algorithm is 'partitioning'. To partition the array, we first select a pivot point, which is a somewhat random element in the array. Afterwards, we arrange the elements in such a way that elements smaller than the pivot are positioned before it, while elements larger than the pivot are placed after it. Elements equal to the pivot can be placed on either the left or right side, as long as we are consistent throughout the partitioning process.

Partitioning Process:
1. Choose the pivot element (the first element in the array in our case).

2. In the second step, assign `left` and `right` pointers to the leftmost and rightmost indices of the remaining elements in the array, respectively.

3. Increment the `left` pointer continuously, one cell at a time, until it reaches a value that is greater than or equal to the pivot or until it becomes greater than `right`.

4. Decrement the `right` pointer continuously, one cell at a time, until it reaches a value that is less than the pivot, or until it becomes smaller than `left`.

5. Once you're done incrementing and decrementing the pointers, evaluate whether the `left` pointer has gone beyond the `right` pointer.
- If this is the case, move on to step 6.
- If this is not the case, swap the values that the `left` and `right` pointers are pointing to, move both pointers toward each other, and repeat steps 3 and 4.

6. Swap the value at the pivot index with the value the `right` pointer is pointing to. This places the pivot at its correct position in the array.
```js
function partition(arr) {
  const pivot = arr[0];
  let left = 1;
  let right = arr.length - 1;

  while (true) {
    while (left <= right && arr[left] < pivot) {
      left++;
    }

    while (left <= right && arr[right] >= pivot) {
      right--;
    }

    if (left > right) {
      break;
    }

    // Swap values at left and right pointers
    [arr[left], arr[right]] = [arr[right], arr[left]];
    left++;
    right--;
  }
  // Swap pivot with the element at the right pointer
  [arr[0], arr[right]] = [arr[right], arr[0]];

  // Return modified arr
  return arr;
}
```

### Adding Recursion
1. Partition the array based on a chosen pivot element. Select a pivot element from the array and rearrange the elements so that all elements smaller than the pivot are placed to its left, and all elements greater than the pivot are placed to its right.

2. Treat the subarrays to the left and right of the pivot as their own arrays and recursively repeat the first step. Partition each smaller subarray by selecting a new pivot and applying the partitioning process again.

3. Continue recursively partitioning the subarrays until you reach subarrays that have zero or one element. These smaller subarrays serve as the base case, as an empty array or an array with one element is already sorted.
```js
function partition(arr, low = 0, high = arr.length - 1) {
  const pivot = arr[low];
  let left = low + 1;
  let right = high;

  while (true) {
    while (left <= right && arr[left] < pivot) {
      left++;
    }

    while (left <= right && arr[right] >= pivot) {
      right--;
    }

    if (left > right) {
      break;
    }

    // Swap values at left and right pointers
    [arr[left], arr[right]] = [arr[right], arr[left]];

    left++;
    right--;
  }

  // Swap pivot with the element at the right pointer
  // thus putting it at its correct spot
  [arr[low], arr[right]] = [arr[right], arr[low]];

  // Return the pivot index
  return right;
}

function quickSort(arr, low = 0, high = arr.length - 1) {
  if (low < high) {
    const pivotIndex = partition(arr, low, high);
    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
}

const arr = [7, 3, 9, 8, 5, 1];
quickSort(arr);
console.log(arr); // Output: [1, 3, 5, 7, 8, 9]
```
In this code, the `partition` function implements the partitioning logic, while the quickSort function recursively calls itself to sort the subarrays. The `partition` function selects a pivot element, moves the `left` and `right` pointers, and swaps elements until they meet. Finally, the pivot element is placed at its correct position, and the function returns the pivot index. You may have noticed that we modified the implementation slightly from the initial one mentioned above. Since the `left` and `right` pointers can vary depending on the subarrays we are working on, we introduced additional arguments `low` and `high` to specify the range. This allows us to set the pivot, `left`, and `right` based on these values. Ultimately, the `partition` function returns the index of the pivot rather than the modified array.

### Choosing The Pivot Element
When the first element of the array is chosen as the pivot, there are several downsides to consider. One major drawback is the potential for poor worst-case performance. If the input array is already sorted or nearly sorted, using the first element as the pivot can lead to inefficient partitioning and a time complexity of `O(n^2)`. This degradation in performance is undesirable and undermines the primary objective of Quicksort.

To address these downsides, we can choose the middle element of the array as the pivot. Opting for the middle element significantly improves the algorithm's overall performance. By selecting a pivot closer to the median value, the likelihood of encountering already sorted or nearly sorted input arrays decreases. This choice reduces the risk of worst-case scenarios and enables Quicksort to exhibit superior efficiency.

### Implementaion with Middle Pivot Element
```js
function partition(arr, low, high) {
  const pivotIndex = Math.floor((low + high) / 2);
  const pivot = arr[pivotIndex];
  let left = low;
  let right = high;

  while (left <= right) {
    while (arr[left] < pivot) {
      left++;
    }

    while (arr[right] > pivot) {
      right--;
    }

    if (left > right) {
      break;
    }

    // Swap values at left and right pointers
    [arr[left], arr[right]] = [arr[right], arr[left]];

    left++;
    right--;
  }

  // Return the pivot index
  return left;
}

function quickSort(arr, low = 0, high = arr.length - 1) {
  const pivotIndex = partition(arr, low, high);
  if (low < pivotIndex - 1) {
    quickSort(arr, low, pivotIndex - 1);
  }
  if (pivotIndex < high) {
    quickSort(arr, pivotIndex, high);
  }
}

const arr = [7, 3, 9, 8, 5, 1];
quickSort(arr);
console.log(arr); // Output: [1, 3, 5, 7, 8, 9]
```

- Divide: The divide step occurs in the partition function, where the array is divided into two subarrays based on a chosen pivot element. The pivot element is selected from the array, and the partition function rearranges the elements such that all elements smaller than the pivot are on the left side, and all elements greater than the pivot are on the right side. This partitioning step essentially divides the array into two subarrays.

- Conquer: The conquer step is the recursive part of the algorithm, implemented in the quickSort function. After dividing the array into subarrays, the quickSort function is called recursively on each subarray. This recursive call applies the same divide-and-conquer process to the subarrays, further dividing them into smaller subarrays until the base case is reached.

- Combine: In the Quicksort algorithm, there is no explicit combine step. Instead, the combine step is implicitly handled during the partitioning process in the partition function. As the partition function partitions the array and places the pivot element at its correct sorted position, it effectively combines the sorted subarrays. This process does not significantly affect the overall time complexity.

### Time Complexity
#### Partitioning Step
During the partitioning step, Quicksort scans the array once and partitions it based on the chosen pivot element. The partitioning process involves rearranging the elements such that elements smaller than the pivot are placed to the left, and elements greater than the pivot are placed to the right. On average, this process takes linear time, `O(N)`, where `N` is the number of elements in the array. The exact implementation details of partitioning may vary, but the overall time complexity remains linear.

#### Recursion Step
After partitioning, Quicksort recursively applies the partitioning process to the subarrays created. This recursive process repeatedly divides the array into smaller parts until each subarray contains either zero or one element, which are already considered sorted. The recursion occurs on average `log N` times because each recursive call typically divides the array into two roughly equal-sized subarray.

#### Combining the Partitioning and Recursion Steps
Since the partitioning step takes linear time, and the recursion occurs logarithmically, we can multiply these complexities together. As a result, the overall average-case time complexity of Quicksort is expressed as `O(N log N)`, where `N` is the number of elements in the array.

However, in the worst-case scenario, the time complexity of Quicksort can degrade to `O(N^2)`. This occurs when the input array is already sorted or nearly sorted, and a poor pivot selection strategy is used. 