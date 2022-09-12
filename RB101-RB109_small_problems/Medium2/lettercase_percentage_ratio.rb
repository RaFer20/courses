=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters,
as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: 
one represents the percentage of characters in the string that are lowercase letters, 
one the percentage of characters that are uppercase letters, 
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

**Problem

**Examples/Test Cases
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

**Data Structures
Input: String
Output: Hash

**Algorithm
Initialize constants for uppercase and lowercase letters as an array.
Initialize lowercase, uppercase and neither as `0`
Initialize a `length` variable to the length of the string as a float
Initialize an `arr` variable as the characters in the input string

Iterate over each `char` within the `arr` array
-Start an if statement
-- if `LOWERCASE` includes `char` increase `lowercase` by 1
-- if `UPPERCASE` includes `char` increase `uppercase` by 1
-- otherwise increase `neither` by 1

Initialize three variable to store the percentage amount of each case
- case variable divided by length will return a float amount, multiply it by 100 to get the percentage value

Make a new hash with the names of the `cases` as keys and their respective percentage values as values and return it

**Code
=end
LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(str)
  lowercase = 0
  uppercase = 0
  neither = 0
  length = str.length.to_f
  arr = str.chars
  
  arr.each do |char|
    if LOWERCASE.include?(char)
      lowercase += 1
    elsif UPPERCASE.include?(char)
      uppercase += 1
    else
      neither += 1
    end
  end
lowercase_percent = ((lowercase.to_f/length) * 100)
uppercase_percent = ((uppercase.to_f/length) * 100)
neither_percent = ((neither.to_f/length) * 100)

hash = {lowercase: lowercase_percent, uppercase: uppercase_percent, neither: neither_percent}
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }