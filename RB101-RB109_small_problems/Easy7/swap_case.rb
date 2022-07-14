=begin
Write a method that takes a string as an argument and returns a new string in which every 
uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. 
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.


Problem
Write a method that swaps lowercase and uppercase letters and ignores every other character.

Examples/Test Cases
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
swapcase('') == ''

Data Structures
Input: String
Output: String with uppercase/lowercase leters swapped

Algorithm
initialize a constant with every uppercased and lowercased letter
initialize a new empty string within the method
Separate the input string into individual characters
iterate through the characters to check if they are included within the LETTERS array
if they aren't just add them as they are, if they are included swap for uppercase/lowercase before adding them to the new string
Define methods to check if they are uppercase/lowercase.
return the new string
Code
=end

LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

def uppercase?(str)
  uppercased = ('A'..'Z').to_a
  uppercased.include?(str)
end

def lowercased?(str)
  lowercased = ('a'..'z').to_a
  lowercased.include?(str)
end

def swapcase(str)
  new_str = ''
  str.chars do |char|
    if !LETTERS.include?(char)
      new_str << char
    elsif LETTERS.include?(char) && uppercase?(char)
      new_str << char.downcase
    else 
       new_str << char.upcase
    end
  end
  new_str
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('') == ''