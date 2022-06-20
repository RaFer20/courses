=begin
 In the previous exercise, you developed a method that converts simple numeric strings to Integers.
 In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
 The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc.
 You may, however, use the string_to_integer method from the previous lesson. 
=end

=begin
Problem 
Write a method that takes a string of digits and returns in as an integer.
The number will always be valid. Do not use to_i, ().

Examples/Test Cases
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Data Structures
input: String of digits
Outputs: Integer

Algorithm
-Initialize a hash constant with keys being the string value of 
 every number and the values being the numbers themselves, turn both signs into '0's
- Initialize a variable `value` to 0
- turn the input number into an array of digits
- if the array had a sign before it it index 0 will have a '0'
- remove the 0 at the start of the array 
- if the original string started with '-' make the value negative
- else if it started with a '+' just ignore the sign
- return the value


=end

NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '+' => 0, '-' => 0
}

def string_to_signed_integer(string)
value = 0
if string.start_with?('-')
 value = -0
end

numbers = string.chars.map {|char|  NUMBERS[char]}

if numbers[0] == 0
  numbers.shift 
end

numbers.each do |number| 
  if string.start_with?('-')
    value = 10 * value + -number
  else
    value = 10 * value + number 
  end
end

value
end



p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100