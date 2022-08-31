=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, 
and returns a string that contains the last name, a comma, a space, and the first name.

**Problem
Write a method that takes a string as an argument, a first name, a space and a last name.
The method should return the last name, a comma, a space and the first argument.

**Examples/Test Cases
swap_name('Joe Roberts') == 'Roberts, Joe'

**Data Structures
Input: String containing first and last name
Output: String with the names swapped and a comma and space separating them

'a b' => 'b, a'

**Algorithm
Split the words into an array containing the first and last names
Use string interpolation to switch the names around and add a comma and a space in between them
return the finished product


**Code
=end

def swap_name(str)
  name_array = str.split
  "#{name_array[1]}, #{name_array[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'