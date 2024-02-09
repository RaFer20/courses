=begin
Problem
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, 
the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

explicit requirements:
input: string 
output: boolean

Examples/Test cases
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

Data Structures
a boolean value would be returned

Algorithm
- define a method called 'panagram' that takes a string as a parameter
- initialize an alphabet variable withing the method to an array containing every letter on the alphabet
- utilize the chars method to turn the input string into an array containing the letters on the string
- iterate through the alphabet array to check if every letter of the alphabet is included in the input string
- if all the letters are included return 'true' else return 'false'
=end


def panagram?(str)
  alphabet = ('a'..'z').to_a
  str = str.downcase.chars

  result = alphabet.map do |letter|
    str.include?(letter)
  end

  result.none?(false)
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false