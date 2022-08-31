=begin
Create a method that takes two integers as arguments. The first argument is a count, 
and the second is the first number of a sequence that your method will create. 
The method should return an Array that contains the same number of elements as the count argument, 
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, 
while the starting number can be any integer value. If the count is 0, an empty list should be returned.

**Problem
Write a method that takes two integers as arguments, a count and the first number of a sequence.
The method will return an array containing the amount of elements specified by the first number.
The elements of the array will be multiples of the second number.
Assume the count will always be `0` or greater.

**Examples/Test Cases
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

**Data Structures
Input: two integers
Output: an array of integers

(3, 2) => [2, 4, 6]


**Algorithm
Initialize a new array to push values into
Start a loop
  -Break from the loop if `n1` equals `0`
  -Start an `if` statement within the loop
  --If `arr` is empty just push `n2` into the array
  --If `arr` is not empty add the last value in `arr` and `n2` then push it into the array
  -Break from the loop if `arr.size` equals `n1`
return array

**Code
=end

def sequence(n1, n2)
  arr = []
  loop do 
    break if n1 == 0
    if arr.empty?
      arr << n2
    else
      arr << (arr.last + n2)
    end
    break if arr.size == n1
  end
  arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
p sequence(3, 2) == [2, 4, 6]