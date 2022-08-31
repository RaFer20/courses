=begin
Write a method that takes a string argument,
and returns true if all of the alphabetic characters inside the string are uppercase,
false otherwise.
Characters that are not alphabetic should be ignored.


**Problem
Write a method that takes a string argument and returns a boolean value, 
true if every alphabetic character if uppercase, false if they aren't.

**Examples/Test Cases
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

**Data Structures
Input: string
Output: boolean

'T' => true
't' => false

**Algorithm
Check if the string provided as an argument matches the same string with the `upcase` method called on it
Return the boolean value

**Code
=end

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true