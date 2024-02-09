require 'pry'
=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. 
In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in
 abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.


PROBLEM
Given an arrat of words, return an array of the number of letters that occupy their positions in the
alphabet for each word.

explicit requirements:
input: array of strings
output: array of integers

implicit requirements:
the returned array should output the same number regardless of uppercase or lowercase


examples/test cases
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]


data structures
an array of integers

algorithm
- define solve method with array passed as a parameter
- initialize 'alphabet' array to a string containing the entire alphabet
- initialize 'position' as an empty array
- initialize 'count' with the integer object '0' as its value
- iterate through each string in the array adding '1' when a letter's position in the string matches it's position in the alphabet
- reassing the value of position at the current index to the value of count
- reassign the value of count to 0 after each iteration
- return the position array after iterating through every string in the input array
=end


def solve(arr)
  alphabet = ('a'..'z').to_a
  position = []
  count = 0
  
  arr.each_with_index do |string, index|
    string.chars.each_with_index do |letter, i|
      count += 1 if string[i].downcase == alphabet[i]
    end
    position[index] = count
    count = 0
  end
  position
end


p solve(["abode","ABc","xyzD"])  == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]