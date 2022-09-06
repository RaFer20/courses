=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

**Problem
Write a method that takes two integers as arguments, the second integer will specify how many numbers to rate at the end of the first integer.
Assume that `n` will always be a positive integer
You may use `rotate_array` from the previous excersise.

**Examples/Test Cases
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

**Data Structures
Input: Two integers, a number to be rotated and one to specify how many numbers to rotate within the first integer.
Output: Integer, input integer after being rotated as specified

1234, 2 => 1243
12345, 4 => 13452

**Algorithm
Utilize helper methods from the previous excersise to rotate arrays

Initialize a `temp_number` variable to an empty array, 
Turn the first input number into a string and then into an array and store them in a `remainder` variable
Slice off the amount of elements specified by `n` from the end of the number and append them to `temp_number`, 

Call the `rotate_array` method on the `temp_number` array, then concatenate it to the remainder array
return the remainder after re-joining the elements and calling `to_i` on the string.



**Code
=end
def rotate_array(arr)
  new_array = []

  arr.each do |element|
    if element == arr.first
      next
    else
      new_array << element
    end
  end

  new_array << arr.first
end

def rotate_rightmost_digits(number, n)
  temp_number = []
  remainder = number.to_s.chars
  

  temp_number << remainder.pop(n)
  temp_number = rotate_array(temp_number.flatten)
  result = remainder + temp_number
  result.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917