# Write a method that takes two strings as arguments,
# determines the longest of the two strings, and then
# returns the result of concatenating the shorter string, the longer string,
# and the shorter string once again. You may assume that the strings are of different lengths.

=begin
Problem
Write a method a method that takes two strings as arguments and returns the result of concatenating them in a short-long-short pattern.
Assume the strings are of different lengths.

Examples/Test Cases
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

Data Structures
Input: Two strings
Outputs: a string made up of the two input strings in a short-long-short pattern

Algorithm
- Initialize a variable to an empty string
- Make a conditional statement to determine the order of the concatenation by figuring out which string is shorter/longer.
- return concatenated string

Code
=end


def short_long_short(str1, str2)
  concatenated_string = ''
  if str1.length < str2.length
    concatenated_string << str1
    concatenated_string << str2
    concatenated_string << str1
  else
    concatenated_string << str2
    concatenated_string << str1
    concatenated_string << str2
  end
concatenated_string
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
