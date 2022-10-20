=begin
Write a method that takes two sorted Arrays as arguments, 
and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array.
You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Examples:
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]
##########################################
Input: 2 arrays
Output: sorted array with the elements of both input arrays
Explicit Rules:
You may not provide any solution that requires you to sort the result array.
You must build the result array one element at a time in the proper order.
Your solution should not mutate the input arrays.

Data Structures
Array

Algorithm
Initialize a `result` variable as an empty array
Initialize an `elements` array containing all unique elements from both arrays
Iterate through `elements` an `elements.length` amount of times
- push thesmallest number to `result` an amount of times specified by the count of that element in a sum of both arrays.
- delete the smallest number
Return `result`

=end

def merge(arr1, arr2)
  result = []
  elements = (arr1+arr2).uniq
  (elements.length).times do 
    ((arr1+arr2).count(elements.min)).times{ result << elements.min }
    elements.delete(elements.min)
  end
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]