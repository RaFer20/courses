=begin
Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.


**Problem
Write a method that takes a string and returns the middle characters of the argument
-Input string is always a non-empty string
-Return a single character string if odd
-Return a two character string if even

**Example/Test Cases
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

**Data Structures
Input: String
Output: One character string if odd, two character string if even

'abc' => 'b'
'abcd' => 'bc'

**Algorithm
Initialize a variable `mid` to a the return value of calling the length method on the string and dividing it by two
Start an if statement
 -the length of the string is an even number number
 -- `mid` - 1
 -- the character at `mid` index and the one following it should be returned
 -the length of the string is an odd number
 -- `mid` stays as is
 -- the character at `mid` index should be returned
The result of the if statement will be returned


**Code
=end
def center_of(str)
  mid = ((str.length)/2)
  
  if (str.length).even?
    mid -= 1
    str[mid, 2]
  else
    mid
    str[mid]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'