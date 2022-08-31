=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; 
double numbers should be returned as-is.

**Problem
Write a method that multiplies a number by two unless the number provided is a double number
a double number's left-side digits and righ-side digits are exactly the same.

**Examples/Test Cases
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

**Data Structures
Input: Integer
Output: Same integer if it is a double number, doubled integer if it isn't

10 => 20
11 => 11

**Algorithm
Create a helper method to check if the number provided is a double number.
  -return false right away if the number isn't an even number
  -turn integer into a string
  -store the (length/2) of the string in a variable, this is the amount of characters we want to 
   check from left to right starting from index '0' and index '(length/2)'
  -Use an `if` statement to return `true` if the first half and second half of the string are the same, `false`
   if it isn't.

Within the `twice` method use an `if` statement and use the helper method check if it's a double number
  -if the number is a double number just return it as it is
  -if it isn't a double number multiply if by two
return the return value of the `if` statement.


**Code
=end

def double?(num)
  return false if (num.to_s.length).odd?
  half_length = (num.to_s.length)/2
  num = num.to_s

  if num[0, half_length] == num[half_length, half_length]
    true
  else 
    false
  end
end

def twice(num)
 if double?(num)
  num
 else
  num * 2
 end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10