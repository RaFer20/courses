=begin
Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number.
If the number is 0 or negative, return the original number.


**Problem
Write a method that takes a number as an argument and returns a negative number if the argument if positive.
Return the original number if it's 0 or negative.

**Examples/Test Cases
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

**Data Structures
Input: Integer
Output: Integer, always negative or 0

10 => -10
0 => 0
-10 => -10

**Algorithm
Write an `if` statement 
-return the original number if it's either 0 or negative
-return the (number -(number * 2)) if it's a positive number

**Code
=end

def negative(num)
  if num == 0
    return num
  elsif num.negative?
    return num
  else
    return (num - (num * 2))
  end
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
p negative(1654752) == -1654752
