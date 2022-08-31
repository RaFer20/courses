=begin
Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


Write a program that prints out groups of words that are anagrams. 
Anagrams are words that have the same exact letters in them but in a different order. 
Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

**Problem
Write a program that will print out groups of words that contain the same letters in different orders.

**Examples/Test Cases
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon'] => ["demo", "dome", "mode"]
["neon", "none"]
#(etc)

**Data Structures
Input: Array
Output: Arrays will be printed out

'demo' => ['demo', 'dome', 'mode']

**Algorithm
Initialize an array that will contain sub arrays with the anagrams
Iterate through the `words` array and determine if the string being iterated through contains the same characters as one before it.
-Initialize a variable to the characters of the string being iterated through
-Initialize an `index` variable

-Start an if statement to determine whether or not the string is an anagram and contains the same characters as previous words
--If it does, start a loop
---If a word containing the same letters exist in [index] in the new array, push word into that array
---else add 1 to the value of index and try again until it finds one.
--If it does not, create a new array and push the value into it

Iterate through every array in `anagrams` and output it.

**Code
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = []

words.each do |word|
  word_arr = word.chars
  index = 0
  if anagrams.any?{|sub_arr| sub_arr.first.chars.sort == word_arr.sort}
    loop do
      if anagrams[index].first.chars.sort.join == word_arr.sort.join
         anagrams[index] << word
         break
      else
      index += 1
      end
    end 
  else
  anagrams << Array.new(1, word)
  end
end

anagrams.each{|anagram| p anagram}