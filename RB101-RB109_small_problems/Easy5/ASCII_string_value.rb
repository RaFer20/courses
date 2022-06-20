# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the ASCII 
# values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

=begin
Problem
Write a method that returns the ASCII string value of the input string. ASCII string values is the
value of every character in the string. Use String#ord to determine the value of a character.

Examples/Test Cases
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

Data Structures
Input: String
Output: Integer (ASCII string value)

Algorithm
- Inside the method initialize a variable to an array containing the characters in the string.
- initialize a `string_value` variable to `0`
- Iterate over each element within str_arr adding its ASCII value to `string_value`
- Return `string_value`

Code
=end

def ascii_value(string)
  str_arr = string.chars
  string_value = 0

  str_arr.each { |char| string_value += char.ord }
  string_value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0