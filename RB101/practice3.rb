# Modify the kebabize function so that it converts a camel case string into a kebab case.

# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps')    // camels-have-humps
# Notes:

# the returned string should only contain lowercase letters

# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'


=begin
Problem
- Modify the kebabize method so it converts a 'CamelCase' string into a 'kebab-case' string
- The string returned should only contain lowercase letters and dashes


input: CamelCase string
output: kebab-case string

Example/Data Cases
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

Data Structures
- identify 'words' as substrings, ignore anything that's not a word or letter
- separate substrings with dashes
- A 'kebabized' string should be returned

Algorithm
- define a method called kebabize that takes a string as a parameter
- initialize a kebabized_string
- downcase the input string
- use the split method to split the input string into separate substrings with dashes
 (what should i use as an argument?/how do i define what a word is?)
- return the kebabized string
=end

def kebabize(str)
  kebabized_string = ''
  str = str.chars
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a

  str.each do |element|
    if !alphabet.include?(element)
      next
    elsif element == element.upcase
      kebabized_string << ('-' + element.downcase)
    else element == element.downcase
      kebabized_string << element
    end
  end

  kebabized_string
end  

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'