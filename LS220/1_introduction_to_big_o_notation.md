# Time Complexity
When we analyze algorithm complexity, we aim to understand how the algorithm's performance scales with the size of the input, or, in other words, its "time complexity". 

Big O Notation allows us to focus on the scalability of an algorithm, enabling us to compare and analyze different algorithms more effectively. Instead of focusing on the exact number of steps, we shift our attention to the growth rate of the algorithm as the input size increases.

## Big O Notation
The "O" in Big O stands for "order." This refers to the order of magnitude of the algorithm's growth rate. In simple terms, it's about understanding which part of the algorithm has the most significant impact on how its run time increases with larger inputs.

Big O is called "Big" because it's concerned with the biggest factor that affects an algorithm's time complexity. It ignores less significant terms and constants that don't significantly change the overall trend as the input size gets very large.

With Big O we describe the worst case scenario of an algorithm's time complexity. As an example, in a linear search the worst case scenario is we're looking for the last element in an array or an element that's not there at all. Linear search has a time complexity of `O(N)`, pronounced "oh of N", where `N` is the input size.

Aside from the worst-case scenario, it can sometimes be valuable to consider the average-case and best-case scenarios when designing and evaluating algorithms for specific use cases or inputs.

### O(1)
An algorithm with a time complexity of O(1) is one where the number of steps required to complete an operation stays the same, regardless of the size of the input.
*This does not mean the operation takes one step, it means the input size does not affect the number of steps.*

Examples of O(1)
Retrieving a value from a hash table
```js
function getName(obj) {
  return obj['name'] // Accessing the value of a key in an object is considered to be O(1) operation
}
let person = {"name": "Srdjan", "age": 39, "job": "Software Engineer"}
getName(person) // 'Srdjan'
```

Accessing an element in an array by its index
```js
function sumFirstAndLast(arr) {
  if (arr.length > 1) {
    return arr[0] + arr[arr.length - 1]
  }
  return 0
}
sumFirstAndLast([1,2,3,4,5,6]) // 7
```
The break down of the function above is as follows
- Array Length Check: 
- - Accessing the length property is done in constant time and does not require iterating through the array.
- - Comparign the length with 1 is also done in constant time.
- Accessing and Summing Elements:
- - We access the first element in the array `arr[0]` by index which is done in constant time.
- - We access the last element in the array, also in constant time.
- - We sum both elements, the addition of two numbers is constant in time.
- Return Statement: The function returns the sum (or 0) in a single step constant in time.

The `sumFirstAndLast` function  has a fixed numbers of steps and is unaffected by the size of our input.

### O(logN)
When we discuss an algorithm with `O(logN)` time complexity, we are referring to a situation where the number of steps necessary to complete a task increases in proportion to the logarithm of the input size. 

A well-known example of O(logN) complexity is the binary search algorithm. In binary search, we find a specific value in a sorted array by repeatedly dividing the search space in half. 
```js
function binarySearch(sortedArray, target) {
    let start = 0;
    let end = sortedArray.length - 1;

    while (start <= end) {
        let mid = Math.floor((start + end) / 2);
        if (sortedArray[mid] === target) {
            return mid; // Target found
        } else if (sortedArray[mid] < target) {
            start = mid + 1; // Search right half
        } else {
            end = mid - 1; // Search left half
        }
    }
    return -1; // Target not found
}
```

The logarithmic nature of binary search becomes clear when we consider large arrays. If you have an array of 1,000 elements, a binary search would need about 10 steps in the worst case (as log2(1000) is approximately 10). Doubling the array size to 2,000 elements increases the steps needed only by one, to approximately 11 steps. This demonstrates logarithmic growth, where increasing the number of elements significantly doesn't proportionally increase the number of steps required.

### O(N)
The `O(N)` time complexity means that the performance of an algorithm or operation is directly proportional to the size of the input, denoted by `N`. This direct proportionality means that there is a one-to-one relationship between the increase in input size and the corresponding increase in the number of operations or time required.

Example of `O(N)`:
```js
function linearSearch(array, target) {
    for (let i = 0; i < array.length; i++) {
        if (array[i] === target) {
            return i; // Element found
        }
    }
    return -1; // Element not found
}
```
In the function above, if the input array contains 1,000 elements it may take up to 1,000 checks to find the target or realize it's not there.

Examples of `O(N)` opertaions
- Iterating over an array or list: The time taken is proportional to the number of elements you're iterating over.
- Copying Elements:  The number of copy operations is equal to the number of elements in the array.

### O(NlogN)
The O(NlogN) time complexity represents a scenario where the time an algorithm takes grows in proportion to N (the size of the input) multiplied by logN (the logarithm of N). 

```js
function binarySearch(sortedArray, target) {
    let start = 0;
    let end = sortedArray.length - 1;

    while (start <= end) {
        let mid = Math.floor((start + end) / 2);
        if (sortedArray[mid] === target) {
            return mid; // Target found
        } else if (sortedArray[mid] < target) {
            start = mid + 1; // Search right half
        } else {
            end = mid - 1; // Search left half
        }
    }
    return -1; // Target not found
}

function searchInMultipleArrays(listOfArrays, target) {
    for (let i = 0; i < listOfArrays.length; i++) {
        if (binarySearch(listOfArrays[i], target) !== 1) {
            console.log(`Target found in array ${i}`);
        } else {
            console.log(`Target not found in array ${i}`);
        }
    }
}
```
The key to understanding O(NlogN) complexity lies in recognizing the combination of linear and logarithmic components:
- Linear Component (M): The outer loop in searchInMultipleArrays runs once for each array in listOfArrays. If there are M arrays, this loop runs M times.
- Logarithmic Component (logN): Within each iteration of the loop, a binary search is performed on an array. Binary search has a O(logN) complexity for each array.

*The key takeaway here is that O(NlogN) time complexity is indicative of algorithms that combine a linear and a logarithmic component. It is often encountered in scenarios where an operation with O(logN) complexity is performed repeatedly for N times.*

### O(N^2)
Quadratic time complexity, denoted as `O(N^2)`, describes algorithms where the number of steps or operations required is proportional to the square of the input size (`N`). In practical terms, this means if the size of the input doubles, the time or number of steps required increases by a factor of four (since 2 squared equals 4).

```js
function findPairs(array) {
    for (let i = 0; i < array.length; i++) {
        for (let j = 0; j < array.length; j++) {
            console.log(`Pair: ${array[i]}, ${array[j]}`);
        }
    }
}
```
`findPairs` contains two nested for loops:

- The outer loop runs `N` times, where N is the length of the array.
- For each iteration of the outer loop, the inner loop also runs `N` times.

As a result, the total number of iterations becomes N * N, or N^2. This means that for an array of 10 elements, the function will perform 100 iterations (10 * 10), illustrating the quadratic growth and thereby the `O(N^2)` time complexity.

`O(N^2)` complexity is often seen in sorting algorithms like bubble sort and selection sort.

It's important to understand that while O(N^2) algorithms are suitable for small to medium-sized datasets, they might not be the most efficient choice for larger datasets.

### O(2^N)
Exponential time complexity, represented as `O(2^N)`, signifies that the execution time of an algorithm grows exponentially with the size of the input. In other words, as the input size increases, the execution time increases dramatically. For each additional element in the input, the execution time of the algorithm doubles.


A common example of an algorithm with exponential time complexity is non-memoized recursion.  In such cases, the algorithm often recalculates the same subproblems multiple times, leading to a dramatic increase in the number of operations.
```js
function fibonacci(n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}
```
With each non-base case input, the number of function calls doubles, leading to exponential growth. For example, fibonacci(3) involves fibonacci(2) and fibonacci(1), and fibonacci(2) itself requires additional calls to fibonacci(1) and fibonacci(0).

### O(N!)
Factorial time complexity, represented as O(N!), indicates an even more rapid growth in algorithm execution time than exponential time complexity. In this case, the execution time increases at a factorial rate relative to the size of the input.

The notation N! (read as "N factorial") refers to the product of all positive integers up to N. For example, if N is 5, then 5! (5 factorial) is calculated as 5 x 4 x 3 x 2 x 1, which equals 120. This means that with every additional element in the input, the total number of operations multiplies by that element, leading to extremely rapid growth. Factorial complexity is typically encountered in scenarios requiring the exploration of all possible permutations or combinations.

For instance, if a traveler needs to determine the shortest route among N cities, the number of potential paths to assess is factorial in nature. As the number of cities (N) increases, the number of possible routes (N!) grows extremely fast, making the algorithm exceedingly slow and impractical for a large number of cities.


# Space Complexity
While time complexity focuses on understanding how the algorithm's performance scales with the input size, space complexity indicates the maximum amount of memory that the algorithm requires to solve a problem. This measurement is important because an algorithm's memory usage can significantly impact its efficiency and practicality, particularly in environments where memory resources are limited.
The key difference between time and space complexity is what they measure: time complexity measures the computational time required by an algorithm, while space complexity measures the memory or space requirements of an algorithm.

Just like time complexity, space complexity is also expressed using Big O notation. For example, if an algorithm has a space complexity of O(N), it means that the maximum memory usage of the algorithm grows linearly with the input size. In simple terms, doubling the size of the input would result in a doubling of the memory needed. However, it's important to note that this doesn't necessarily mean that the memory usage will grow for every input, but rather it sets an upper limit on the memory consumption.