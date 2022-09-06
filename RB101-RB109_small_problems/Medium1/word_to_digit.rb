=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the 
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

**Problem
Write a method that takes a string as an argument and replaces the `word numbers` within the string with their numeric values.

**Examples/Test Cases
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

**Data Structures
Input: String
Output: String with `word numbers` replaced by the numeric values

"one two three" => "1 2 3"

**Algorithm
Initialize a constant hash containing values from `0` to `9` in words as keys and numeric as values

Split the string into an array of substrings and iterate over every `word` in the array
- If the substring is included in the NUMBERS hash as a key, replace it by its value
- If it is not included in the NUMBERS hash move on to the next iteration

Return the new sentence

**Code
=end
require 'pry'

NUMBERS = {}
['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].each_with_index{|word, idx| NUMBERS[word] = idx.to_s}

def word_to_digit(string)
  new_sentence = string.split.map do |word|
      if NUMBERS.include?(word)
        NUMBERS[word]
      elsif NUMBERS.include?(word.gsub('.',''))
        NUMBERS[word.gsub('.','')] + '.'
      else
        word
      end
    end
    new_sentence.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'