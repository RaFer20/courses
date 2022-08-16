require 'pry'
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
# The return value should be arranged in order from shortest to longest substring.

=begin

**Problem**
Write a method that lists all substrings starting with the first character of the original string and return it.
The return value should be sorted from shortest to longest substring.

**Examples/Test Cases**
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

**Data Structures**
Input: String
Output: Array of substrings starting with the first character of the original string

"123" => ["1", "12", "123"]

**Algorithm**
Initialize a `leading substrings` empty array
Initialize a `stored value` variable to an empty string
Separate the characters in the string into an array
Iterate over the character array
Each iteration add the current element to the `stored value` string and push it to the `leading substrings` array (careful not to mutate `stored value`)
return `leading_substrings`

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

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']