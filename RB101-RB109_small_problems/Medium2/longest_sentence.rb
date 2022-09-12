=begin
Write a program that reads the content of a text file and then prints
the longest sentence in the file based on number of words. 
Sentences may end with periods (.), exclamation points (!), or question marks (?). 
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
You should also print the number of words in the longest sentence.

**Problem
Write a program that prints the longest sentence in a text file based on the number of words.
-Sentences may end with periods, exclamation points or question marks.
-Sequences of characters that aren't spaces or sentence-enders should be treated as words.
-Also print the number of words in the longest sentence.

**Example/Test Cases
one. one two? one, two and three! => one, two and three! (4 words long)

**Data Structures
Input: Text file with multiple sentences
Output: String, longest sentence in the text file and amount of words.

**Algorithm
Initialize two variables, `longest sentence` as an empty string and `word count` as 0
Split text into an array of sentences based on periods/exclamation points/question marks.
Split a sentence into a word array and iterate through them to count the amount of elements in the array.
- If the amount of words if higher than `word_count`, reassign `word_count` to that value and `longest_sentece` to that sentence

Print the longest sentence and it's word count.


**Code
=end

text = File.read('sample_text2.txt') # Replace with txt file to read.
sentences = text.split(/\.|\?|!/)
longest_sentece = ''
word_count = 0
sentences.each do |sentence|
  if sentence.split.count > word_count
    word_count = sentence.split.count
    longest_sentece = sentence
  else
    next
  end
end
puts "The longest sentence is: '#{longest_sentece}' It contains #{word_count} words!"




