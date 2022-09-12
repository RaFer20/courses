=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, 
and whose digits occur exactly once each. 
So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), 
and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, 
and returns the next featured number that is greater than the argument. 
Return an error message if there is no next featured number.

**Problem
Write a method that takes an integer as an argument and returns the next featured number
Feature number are odd numbers that appear once and are multiples of 7

**Examples/Test Cases
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

**Data Structures
Input: integer
Output: integer

14 => 21
41 => 49
9_999_999_999 => Error Message

**Algorithm
Initialize a `featured` variable to 7
increase `featured` by 7 until its larger than the input number 
AND fulfills all the requirements 
OR its so large the are no more numbers that fullfil the requirements
if `featured` is equal or larger than 9_876_543_210 return an error message
otherwise return `featured`

**Code
=end

def featured(number)
  featured = 7
  featured += 7 until number < featured && featured.odd? && featured.to_s.chars.uniq.join.to_i == featured || featured >= 9_876_543_210
  if featured >= 9_876_543_210
    "No further number fulfills those requirements"  
  else 
    featured
  end
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements