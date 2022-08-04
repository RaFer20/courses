=begin
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.


**Problem**
Write a method that takes a string as an argument and returns the second to last word in the string. A word
is any sequence of non-blank characters and the input string will contain at least two words.

**Example/Test Cases**
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

**Data Structures**
Input: string containing two or more words
Output: String containing next to last word in the input string

"One two three four" => "three"

**Algorithm**
Within the method separate string into an array of words and initialize a variable to it
Use the index to find the penultimate and return it

**Code**
=end

def penultimate(string)
  arr = string.split
  arr[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'