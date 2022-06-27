# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4.

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def word_sizes(str)
  count_hash = {}
  words = str.split
  only_words = words.map{|word| word.chars.delete_if{|letter| !LETTERS.include?(letter)}.join}
  size_array = only_words.map{ |word| word.size }.sort
  size_array.map{|size|  count_hash[size] = size_array.count(size)}
  count_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}