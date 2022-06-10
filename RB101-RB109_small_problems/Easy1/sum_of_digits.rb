=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Problem
Write a method that takes a positive integer and returns a sum of its digits.

Examples/Test Cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

Data Structures
input: positive integer
output: positive integer (sum of the digits in the input)

Algorithm
- Define a method `sum` that takes a positive integer as a parameter.
- use the `.to_s` method and `chars` method to turn the number into a string and split the string into an array of substrings.
- iterate over the array using `map` and use the .to_i method to turn the substrings back into integers.
- Use inject to add the numbers together.
- return the sum

Code
=end

def sum(num)
  array_nums = num.to_s.chars.map{|n| n.to_i}
  array_nums.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45