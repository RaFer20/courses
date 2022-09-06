=begin
If you take a number like 735291, and rotate it to the left, you get 352917. 
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. 
Keep the first 2 digits fixed in place and rotate again to 321759. 
Keep the first 3 digits fixed in place and rotate again to get 321597. 
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

**Problem
Write a method that takes an integer as an argument and returns the argument's maximum rotation.
You can use `rotate_rightmost_digits` from the previous excersise.

**Examples/Test Cases
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

**Data Structures
Input: integer
Output: integer (rotated)

1 => 1
12 => 21
123 => 213

**Algorithm
Initialize a variable `rotation` to an integer which represents the amount of digits in the input number
Start a loop
- Break if rotation equals `0`
- Call the `rotate_rightmost_digits` method and pass it the input number and `rotation` as arguments, reassign `number` to the return value.
- Substract `1` from rotation
Return `number`

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

def max_rotation(number)
  rotation = number.to_s.length
  loop do
    break if rotation == 0
    number = rotate_rightmost_digits(number, rotation)
    rotation -= 1
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
