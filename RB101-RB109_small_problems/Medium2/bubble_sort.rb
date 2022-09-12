=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, 
but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. 
On each pass, each pair of consecutive elements is compared. 
If the first of the two elements is greater than the second, then the two elements are swapped. 
This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm
as well as a minor optimization technique, the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. 
Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. 
 may assume that the Array contains at least 2 elements.

**Problems
Write a method that takes an array as an argument and mutates it by using the bubble sort algorithm
-Assume the array contains at least two elements.

**Examples/Test Cases
6	2	7	1	4	|Start: compare 6 > 2? Yes
2	6	7	1	4	|Exchange
2	6	7	1	4	|6 > 7? No (no exchange)
2	6	7	1	4	|7 > 1? Yes
2	6	1	7	4	|Exchange
2	6	1	7	4	|7 > 4? Yes
2	6	1	4	7	|Exchange
2	6	1	4	7	|2 > 6? No
2	6	1	4	7	|6 > 1? Yes
2	1	6	4	7	|Exchange
2	1	6	4	7	|6 > 4? Yes
2	1	4	6	7	|Exchange
2	1	4	6	7	|6 > 7? No
2	1	4	6	7	|2 > 1? Yes
1	2	4	6	7	|Exchange
1	2	4	6	7	|2 > 4? No
1	2	4	6	7	|4 > 6? No
1	2	4	6	7	|6 > 7? No
1	2	4	6	7	|1 > 2? No
1	2	4	6	7	|2 > 4? No
1	2	4	6	7	|4 > 6? No
1	2	4	6	7	|6 > 7? No
1	2	4	6	7	|No swaps; all done; sorted

**Data Structures
Input: array
Output: sorted array

3 1 4 2 => 1 2 3 4

**Algorithm
Initialize a variable to the lenght of the input array
Start a loop
-Initialize a `swap` variable and set it to `false` (it will be set back to this after every complete iteration)
-initialize an `index` variable and set it to one
-iterate over the array from `index` to `lenght - 1` 
--start an if statement
---if A > B then swap them and set `swap` to `true`
--Increase index by `1` 
-decrease n by `1` (every time we iterate through the entire array the largest element is placed in its final position, no need to iterate through it again)
-Break from the loop when swap remains as `false` after iterating

**Code
=end

def bubble_sort!(arr)
  n = arr.size
  loop do
    swap = false
    1.upto(n-1) do |index|
      if arr[index-1] > arr[index]
        arr[index-1], arr[index] = arr[index], arr[index-1]
        swap = true
      end
    index += 1
    end
    n -= 1
    break if swap == false
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)