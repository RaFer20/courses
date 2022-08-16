# Write a method that takes a string, and returns a new string in which every character is doubled.
=begin
**Problem
Write a method that takes a string as an argument and returns a new string with every character doubled.
If the input string is empty return an empty string

**Examples/Test Cases
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

**Data Structures
Input: string
Output: string with every charater doubled
'123' => '112233'

**Algorithm
Initialize a variable to an array containing the characters in the string
Initialize a new variable to an empty array to push values into
Iterate over the array containing the characters of the input string
 -Push the character being iterated over twice into the new array
 --Do this for every character
Join the characters within the new array into a string and return it

**Code
=end

def repeater(str)
  str_arr = str.chars
  doubled = []
  str_arr.each do |char| 
    doubled << char
    doubled << char
  end
  doubled.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

