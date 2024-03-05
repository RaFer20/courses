# Sorting Algorithms
Sorting is a fundamental operation in computer science that involves arranging elements in a specific order, typically in ascending or descending order. It plays a vital role in various domains, ranging from data organization to search algorithms and optimization problems. Understanding sorting algorithms and their applications is crucial for efficient data manipulation and retrieval in a wide range of computational tasks.

The applications of sorting algorithms are widespread across various domains.
Examples:
- Databases: Sorting is integral to database management systems. By sorting data based on specific criteria, databases can efficiently retrieve information, perform searches, and execute complex queries. Sorting also enables the indexing of data, which accelerates data access operations and enhances the overall performance of database systems.

- Information Retrieval: Search engines heavily rely on sorting algorithms to provide accurate and relevant search results. Sorting helps rank search results based on relevance, popularity, or other criteria, ensuring that users receive the most pertinent information first.

- Computational Biology: Sorting algorithms find applications in processing and analyzing genomic data, protein sequences, and other biological datasets. Sorting allows for identifying patterns, detecting similarities, and performing advanced algorithms for gene expression analysis, sequence alignment, and DNA sequencing.

- Operating Systems: Operating systems employ sorting algorithms in various tasks such as task scheduling, memory management, and file systems. Sorting aids in organizing processes, allocating system resources efficiently, and improving overall system performance.

- Network Routing: Sorting plays a role in network routing algorithms used in computer networks. By sorting network nodes based on distances or network metrics, routing protocols can determine the optimal paths for data packets, ensuring efficient data transmission and minimizing network congestion.

## Bubble Sort
Bubble sort is one of the simplest sorting algorithms. While it is easy to understand and implement, it is not as efficient as some of the faster sorting algorithms available.

1. The algorithm starts by comparing the first two elements of the array.
 - If the first element is greater than the second element (in ascending order), they are swapped.
 - If they are in the correct order, no change is made.
2. The algorithm then moves to the next pair of elements (the second and third elements) and compares them.
3. This process continues, comparing and swapping adjacent elements until the end of the array is reached.
4. At the end of the first iteration, the largest element in the array will be in its correct position at the end.
5. The algorithm then starts the next iteration, repeating steps 1 to 3, but excluding the last element, as it is already in its correct position.
6. Each iteration moves the next largest element to its correct position at the end of the remaining unsorted portion of the array.
7. The iterations continue until no more swaps are needed, indicating that the array is completely sorted.

```js
function bubbleSort(arr) {
  const len = arr.length;

  for (let i = 0; i < len - 1; i++) {
     // Flag to track if any swaps were made
    let swapped = false;

    // Last i elements are already in place
    for (let j = 0; j < len - 1 - i; j++) {

      // Check if the element in the current iteration
      // is greater than the one in the next iteration
      if (arr[j] > arr[j + 1]) {

        // Swapping elements
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
        swapped = true
      }
    }

    if (!swapped) {
      // If no swaps were made in this iteration, the array is already sorted
      break;
    }
  }

  return arr;
}

const array = [5, 3, 8, 7, 2];
console.log(bubbleSort(array)); // Output: [2, 3, 5, 7, 8]
```
Bubble sort has a time complexity of `O(N^2)`, where N is the number of elements in the array. This means that the time it takes to sort the array grows quadratically with the input size.

- In certain cases, the comparison operation can be computationally expensive. For instance, if the elements being compared involve complex calculations, database queries, network requests, or involve accessing external resources, the time required for comparisons can be substantial.
- Swapping elements in memory can also be costly if the elements are large in size. For example, if the array contains large arrays or structures, performing swaps that involve moving significant amounts of data in memory can result in performance overhead. This consideration does not apply to languages where large elements are swapped by reference rather than by value.

However, when the array is already sorted or nearly sorted, the number of passes through the array will be significantly reduced. As soon as we iterate through the array without performing any swaps, we know that the array is already sorted. This means that in the best-case scenario, its time complexity is `O(N)`, as in a sorted array we only need to perform one pass. This makes bubble sort a viable choice in practical scenarios involving nearly sorted arrays due to its simple implementation.

## Selection Sort
Selection sort is a simple sorting algorithm that works by dividing the array into two parts: the sorted part and the unsorted part. The sorted part gradually grows from left to right, while the unsorted part shrinks from right to left.

1. The algorithm divides the array into two parts: the sorted part and the unsorted part.
2. Initially, the sorted part is empty, and the unsorted part contains the entire array.
3. In each pass, the algorithm scans the unsorted part of the array to find the smallest element.
4. Once the smallest element is identified, it is swapped with the leftmost element of the unsorted part (the element at the boundary of the sorted and unsorted parts).
5. After the swap, the boundary between the sorted and unsorted parts is shifted one position to the right.
6. The selected element is now considered part of the sorted part, and the unsorted part is reduced by one element.
7. Steps 3 to 6 are repeated until the unsorted part contains just one element, which means it must be sorted. Consequently, the entire array is sorted.

```js
function selectionSort(arr) {
  const len = arr.length;

  for (let i = 0; i < len - 1; i++) {
    let minIndex = i;

    for (let j = i + 1; j < len; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    if (minIndex !== i) {
      [arr[i], arr[minIndex]] = [arr[minIndex], arr[i]];
    }
  }

  return arr;
}

const array = [3, 8, 2, 1];
console.log(selectionSort(array)); // Output: [1, 2, 3, 8]
```
Selection sort has a time complexity of `O(N^2)`, where N is the number of elements in the array. This means that the time it takes to sort the array grows quadratically with the input size.

Selection sort can be superior to Bubble sort in terms of performance when the cost of swapping elements is significantly higher than the cost of comparisons as it makes a maximum of N swaps for an array of size N.

In bubble sort we swap elements when adjacent elements are out of order, which could lead to a large number of swaps. In selection sort we do a single swap after finding the smallest element on each iteration.

## Insertion Sort
In Insertion Sort, we are gradually building a sorted portion of the array from left to right. The steps involved are as follows, assuming that we are sorting in ascending order:

1. Start with the second element in the array (index 1).
2. Temporarily remove that element from the array, creating a gap.
3. Compare the removed value to the elements on its left.
4. If an element on the left is greater than the removed value, shift it to the right.
5. Continue the shifting phase, by moving until a smaller value is encountered or the left end of the array is reached.
6. Insert the removed value into the current gap.
7. Move to the next element in the array and repeat steps 2 to 6 until you reach the end of the array.
8. The sorted portion of the array gradually grows from left to right with each pass-through, until the array is fully sorted.

```js
function insertionSort(arr) {
  const len = arr.length;

  for (let i = 1; i < len; i++) {
    let current = arr[i];
    let j = i - 1;

    while (j >= 0 && arr[j] > current) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = current;
  }

  return arr;
}

const array = [4, 2, 1, 3];
console.log(insertionSort(array)); // Output: [1, 2, 3, 4]
```
In the worst-case scenario, where the input array is in reverse order, Insertion Sort demonstrates a time complexity of `O(N^2)`. This means that the number of operations required to sort the array grows quadratically with the size of the input.

Insertion Sort excels when working with partially sorted or nearly sorted arrays. In such scenarios, the algorithm benefits from a significant reduction in the number of comparisons and shifts required, resulting in improved performance. For arrays that are already sorted or nearly sorted, Insertion Sort can even outperform more complex algorithms like Merge Sort or Quick Sort. In this "best case scenario," Insertion Sort exhibits a linear time complexity of `O(N)`. The reason behind this linear time complexity lies in the fact that during each iteration of the algorithm when comparing an element with the elements on its left, only a few comparisons may be needed before determining its correct position.