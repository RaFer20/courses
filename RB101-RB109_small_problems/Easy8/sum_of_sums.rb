=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. 
You may assume that the Array always contains at least one number.


**Problem**

**Example/Test Cases**
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

**Data Structures**
Input: an array of numbers
Output: an Integer, sum of sums of each leading subsequence in the array

[1, 2, 3] == (1) + (1+2) + (1+2+3)

**Algorithm**
Initialize a `sum` empty varible
initialize an  `array` variable as an empty array to hold the numbers we have iterated through in it
Iterate over the array and push each element into `array`
use inject to add the values within `array` on each iteration.
return the sum

**Code**
=end

def sum_of_sums(arr)
  sum = 0
  array = []
  arr.each do |num| 
    array << num
    sum += array.inject(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35