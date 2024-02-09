# Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

# Examples:

# swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
# swap('Abcde');                          // "ebcdA"
# swap('a');                              // "a"


=begin
Problem
Write a 'swap' method that takes a string of words as a parameter and swaps the first and last letter of every word.
assume every word contains at least one letter, and every string contains at least one word.
The string will only contain words and spaces.

Examples/Data cases

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a" 

Data Structures
The method will return a string
input: a string of words separated by spaces
output: a string of words separated by spaces but the first and last letter of every word will be swapped.

Algorithm #split/chars
- utilize the split method to split the string into an array substrings containing the words separated by spaces
- use the each method to iterate over every elements (character) of the array
- initialize a variable "first" within the block for the each method
- use indexed

=end

def swap(str)
swapped_str = str.split.each do |word|
  first = word[0]
  word[0] = word[-1]
  word[-1] = first
end
p swapped_str
end

swap('Oh what a wonderful day it is'); # == "hO thaw a londerfuw yad ti si"
# swap('Abcde');                          == "ebcdA"
# swap('a');                              == "a" 