# Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

=begin
**Problem
Write a method that reverses the digits in a positive integer passed to it as an argument.

**Examples/Test Cases
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

**Data Structures
Input: Integer
Output: Input integer reversed

'123' => '321'

**Algorithm
Turn the integer into a string
Reverse the characters on the string
turn the reversed string into an integer and return it

**Code
=end

def reversed_number(num)
  num.to_s.reverse.to_i
end



p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1