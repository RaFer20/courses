=begin
Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins. 
This means that all substrings that start at position 0 should come first, 
then all substrings that start at position 1, and so on. 

Since multiple substrings will occur at each position, 
the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

**Problem**
Write a method that returns all subrstrings that start with each character in the string, sorted by the index of the starting character
and shortest to longest.

**Example/Test Cases**
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

**Data Structures**
Input: String
Output: array containing substrings

"123" => ['1', '12', '123', '2', '23', '3']

**Algorithm** Unfinished
initialize an empty array
Start a loop
-call `leading_substrings` on the string and push into the new array
-reassign the character at `index 0` with `''`
-break when the input str == ''
unite the arrays within the nested array
return new array containing all substrings


**Code**
=end

def leading_substrings(str)
  leading_substrings = []
  stored_value = ''
  str.chars.each do |char| 
    stored_value += char
    leading_substrings << stored_value
  end
  leading_substrings
end

def substrings(str)
  arr = []
  loop do
    arr << leading_substrings(str)
    str[0] = ''
    break if str == ''
  end
  arr.flatten
end

p substrings('abcde') == [
   'a', 'ab', 'abc', 'abcd', 'abcde',
   'b', 'bc', 'bcd', 'bcde',
   'c', 'cd', 'cde',
   'd', 'de',
   'e'
 ]

