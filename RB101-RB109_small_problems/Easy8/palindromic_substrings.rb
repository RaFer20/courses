# Write a method that returns a list of all substrings of a string that are palindromic. 
# That is, each substring must consist of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, 
# "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
=begin
**Problem
Write a method that lists all palindromic substrings
The return value order should be the same as in the string and duplicate palindromes should be included multiple times.

**Examples/Test Cases

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]


**Data Structures
Input: String
Output: Array of substrings that are palindromes

'abba' => ['abba', 'bb']


**Algorithm
Use the substrings method to get a list of all substrings in an array
Write a `palindrome?` method that returns a boolean value to check if an input substring is a palindrome
iterate over the array of substrings select only the palindromes from the array and return them


**Code
=end

def leading_substrings(str)
  leading_substrings = []
  stored_value = ''
  str.chars.each do |char| 
    stored_value += char
    leading_substrings << stored_value
  end
  leading_substrings
end

def substrings(str)
  arr = []
  loop do
    arr << leading_substrings(str)
    str[0] = ''
    break if str == ''
  end
  arr.flatten
end

def palindrome?(str)
  str == str.reverse && str.length > 1
end

def palindromes(str)
  arr = substrings(str)
  arr.select{|substr| palindrome?(substr)}
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]