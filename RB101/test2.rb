# Write a function that takes an array of numbers and returns an array with the same number of elements,
# but with each element's value being the running total from the original array.

# Examples:

# runningTotal([2, 5, 13]);             // [2, 7, 20]
# runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
# runningTotal([3]);                    // [3]
# runningTotal([]);                     // []


=begin
Problem
Write a method that takes an array of number and returns an array with the same number of elements but the value
of every element is the running total from the original array.
running total? (based on test cases every element in array will be the element added to the previous element in the original array)

Examples/Test cases

runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []

Data structures
Returns an array of numbers
input: array of numbers
output: array of numbers with every element being the running total 
if the input is an empty array return an empty array

Algorithm
- define a runningTotal method that takes an array (arr) as a parameter
- use the each_with_index method to iterate over every element (num) of the array but have access to the index (idx) aswell and initialize
  the return value to the variable "running_total"
- initialize a variable "current_idx" to the integer 0
- start a loop
- if idx < 0 do num[current_idx] += num[idx] 
  else do num[current_idx] = num[idx]
- add 1 to "current_idx"
- break when the running_total.size == arr.size
- return new array
=end


#Code
def runningTotal(arr)
 sum = 0
 result = []
 arr.each do |e|
  sum += e
  result.push(sum)
 end
 result
end

p runningTotal([2, 5, 13])            == [2, 7, 20]
p runningTotal([14, 11, 7, 15, 20])   == [14, 25, 32, 47, 67]
p runningTotal([3])                   == [3]
p runningTotal([])                    == []