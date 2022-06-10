=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Problem
Write a method that takes an array of positive integers as an argument and returns the average of all numbers in the array.
The array will never be empty and will only contain positive integers.

Examples/Test Cases
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

Data Structures
input: array of integers
output: integer (average of numbers in the array)

Algorithm
- Define a method `average` that takes an array as a parameter.
- Use inject to add the values in the array
- divide the final sum by the `length` of the array.
- return the product of the division.

Code
=end

def average(array)
  sum = array.inject(:+)
  sum/array.length
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

#Further Exploration
=begin
def average(array)
  sum = array.inject(:+)
  sum.to_f/array.length.to_f
end
=end