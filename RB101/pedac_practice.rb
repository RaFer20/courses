=begin
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once),
 how would you determine which value occurs twice? 
Write a method that will find and return the duplicate value that is known to be in the array. = end

Problem
find the number that occurs twice in the array

examples
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

Data Structures
input: array of numbers
outputs: integer that appears twice in the array

algorithm
define method 'find_dup' and give it an array 'arr' as a parameter
initialize a dup variable to the return value of calling the select method on the array
iterate over 'arr' to find numbers that appear more than once in the array
use the count method on the array to find numbers that appear twice in the array
the return value will be a 

code

def find_dup(arr)
  dup =arr.select do |num|
        arr.count(num) == 2
       end
    dup.pop
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


=end

=begin

problem
define an include? method that takes and array and a search value as a parameter.
can't use the include? method




examples/test cases
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

data structures
input: array, search value
output: boolean


algorithm
define a method called 'include?' and give it two parameters, an array 'arr' and a search value 'srch'
use the any? method on the array with the 'search value' as an argument to return a boolean value



code
=end

# def include?(arr, srch)
#   arr.any?(srch)
# end

# def include?(arr, srch)
#   result = arr.select do |v|
#             v == srch
#   end
#    if result == []
#     return false
#    else
#     result.pop == srch
#    end
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false


