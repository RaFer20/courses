=begin
Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters reversed.
Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.

problem
write a method that only reverses words that contain 5 or more characters

examples/test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

data structures
input: string
output: string with words longer that 5 characters reversed
only string that contain more than one word will include spaces

algorithm
- define a method `reverse_words` that takes a string as a parameter.
- initialize a variable `reversed_array` to the return value of calling the split method on the input string then call map on it
  to transform (reverse) the elements only if their length is equal to 5 or more, else return the element as it is
- use the join method on `reversed_array` with a space as an argument to rejoin the array as a string

code
=end

def reverse_words(string)
  reversed_array = string.split.map {|element| if element.length >= 5 then element.reverse else element end}
  reversed_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS