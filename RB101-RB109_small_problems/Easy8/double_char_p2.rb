=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

**Problem
Write a method that takes a string as an argument and doubles only consonants, everything else remains as it is in the input string

**Examples/Test Cases
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

**Data Structures
Input: string
Output: string with consonants doubled

'123' => '123'
'abc' => 'abbcc'
''    => ''

**Algorithm
Initialize a constant to an array containing every consonant
  -create an array containing every letter upper and lowercase and remove vowels
define a helper method to check if characters are consonants
  -check if a character is included in the `CONSONANTS` constant
define a `double_consonants` method that takes a string as an argument
Initialize a new variable to an empty array to push values into
Iterate over the string
Add an `if` statement,
- If the character being iterated through is included in the `CONSONANTS` contant, double push it twice into the new array.
- Else push it once
Join and return the `double_consonants` array as a string
**Code
=end
VOWELS = 'AEIOUaeiou'.chars
CONSONANTS = (('A'..'Z').to_a + ('a'..'z').to_a).select {|char| !VOWELS.include?(char)}

def consonant?(letter)
  CONSONANTS.include?(letter)
end

def double_consonants(str)
  double_consonants = []

  str.each_char do |char|
    if CONSONANTS.include?(char)
      double_consonants << char << char
    else
      double_consonants << char
    end
  end
  double_consonants.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""