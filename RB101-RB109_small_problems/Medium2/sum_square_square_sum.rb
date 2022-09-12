=begin
Write a method that computes the difference between the square of the sum of the first n positive integers 
and the sum of the squares of the first n positive integers.

**Problem
write a method that substracts the sum of the squares of the first n positive integers
from the square of the sum of the first n positive integers

**Examples/Test Cases
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

**Data Structures
Input: Integer
Output: Integer

2  =>  4 

**Algorithm
Initialize an array from 1 to the input integer
initialize a `square_of_sum` variable 
- `inject(:+)` to add all the values within the array
- Get the square of that value
Initialize a `sum_of_square` variable
- iterate through the array and mutate every value to it's square
- `inject(:+)` to add all the sqaured values

Subtract `sum_of_square` from `square_of_sum` and return the value

**Code
=end

def sum_square_difference(num)
  array = (1..num).to_a
  square_of_sum = (array.inject(:+))**2
  sum_of_square = array.map{|number| number**2}.inject(:+)
  square_of_sum - sum_of_square
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150