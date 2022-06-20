# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row,
# you should only have one space in the result (the result should never have consecutive spaces).

=begin 
Problem
Write a method that given a string with non-alphabetic characters and some words will return the letters normally but 
non-alphabetic characters as a space. consecutive non-alphabetic characters will only output one space.

Examples/Test Cases
cleanup("---what's my +*& line?") == ' what s my line '

Data Structures
Input: String with words and non-alphabetic characters
Output: String with words and spaces

Algorithm
- Initialize a variable as an array containing every letter of the alphabet
- Initialize a variable within the method to an empty string
- Transform non-alphabetic characters into spaces ignoring consecutive non-alphabetic characters and add them into the empty string
- Add alphabetic characters into the empty string without altering them
- Squeeze spaces so that there aren't any consecutive spaces at a time
- return the new string

Code
=end

def cleanup(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  new_str = ''

  string.chars do |char| 
    if letters.include?(char)
      new_str << char
    else
      new_str << ' '
    end
  end
  new_str.squeeze(' ')
end


p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("*** Hello#!%World(*&") == ' Hello World '
p cleanup("This##is!@%#$%!#an&!!!!!*^&example") == 'This is an example'
p cleanup("Consecuutiive!!letteeers@!#aree&%^okay") =="Consecuutiive letteeers aree okay"