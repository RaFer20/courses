=begin
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

problem
write a method that takes a string and returns a string with the words in reverse order

examples/test cases
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

data structures
input: string
output: string with words in reverse order
empty strings and strings with only spaces return an empty string

algorithm
- define method `reverse_sentence` which takes a string as a parameter.
- use the `split` method on the string to return an array with every word on the string
- use the `reverse` method on the new array to reverse the order of the elements withing the array
- use the `join` method with a space (' ') as an argument to rejoin the words back into a string and assign it's return value to
  a new variable `reversed_string`
- return reversed_string

code
=end

def reverse_sentence(string)
  reversed_string = string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''