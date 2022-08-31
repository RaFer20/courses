=begin
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

**Problem
Write a method that take an integer as an argument an returns every number between 1 and the argument as an array.
The Argument will always be a valid number greater than 0.

**Examples/Test Cases

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

**Data Structures
Input: integer
Output: array of integers from 1 to the argument number

2 => [1, 2]

**Algorithm
Initialize a new `sequence` variable as an empty array
Call the `upto` method on `1` and use the number provided in the input as an argument
-Store every value between 1 and the argument into the `sequence` array
Return the `sequence` array


**Code
=end

## Further exploration 
## Adjust to work with negative numbers too.

def sequence(num)
  sequence = []
  if num > 0
    1.upto(num) {|n| sequence << n}
  elsif num < 0
    -1.downto(num) {|n| sequence << n}
  end
  sequence
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-10) == [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]