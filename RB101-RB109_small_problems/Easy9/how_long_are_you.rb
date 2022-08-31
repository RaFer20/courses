=begin
Write a method that takes a string as an argument, and returns an Array that contains every word from the string,
to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

**Problem
Write a method that takes a string as an argument and returns an array containing every word and it's length separated by one space.
Every non-space character is considered a word

**Examples/Test Cases
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

**Data Structures
Input: string
Output: array containing words and their lengths

'abc defg' => ['abc 3', 'defg 4']

**Algorithm
Initialize a variable to the return value of calling the `split` method on the input string
Iterate over every word in the new array
-Transform every word into the return value of calling the `length` method interpolated into a string containing the word and a space.
Return the Array of words and their lengths

**Code
=end

def word_lengths(str)
  lengths = str.split
  lengths.map! {|word| "#{word} #{word.length}"}
  lengths
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []