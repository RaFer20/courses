=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
always starting with 1. The length of the string should match the given integer.

Problem
write a method that returns a string of alternating 1s and 0s based on an input positive integer.
the string should always start with 1 and the length should be equal to the input integer.

Examples/Test Cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Data Structures
input: positive integer
output: string of alternatings 1s and 0s, always starting with 1

Algorithm
- Define a method `stringy` that takes a positive integer as a parameter
- initialize a variable `string` to an empty string
- initialize a variable `counter` to the integer 0
- use the loop method to append a 1 or 0 to the string depending on the number on the counter
- when counter is equal to 0 or an even number appen '1' to the string, else append '0' to the string
- do this until the string's length is equal to the input integer
- return the string

Code
=end

def stringy(n)
  string = ''
  counter = 0

  loop do
    if counter.zero? || counter.even?
      string << '1'
    else
      string << '0'
    end
    counter += 1
    break if string.length == n
  end
  string
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'