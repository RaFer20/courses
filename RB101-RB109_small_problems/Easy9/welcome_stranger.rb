=begin
Create a method that takes 2 arguments, an array and a hash.
The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. 
The hash will contain two keys, :title and :occupation, and the appropriate values.
Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.


**Problem
Create a method that takes an array containing parts of a person's name and a hash containing key:value pairs for title and occupation.
The method returns a greeting that uses the person's full name and mentions their title and occupation.

**Examples/Test Cases
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

**Data Structures
Input: an array and a hash
Output: a greeting string containing a person's name and mentioning their occupation.


**Algorithm
Initialize a variable to the return value of calling the `join` method on the array and pacing a `space(' ')` as an argument.
Use string interpolation to create a sentence using the input values.

**Code
=end


def greetings(arr, hash)
  name = arr.join(' ')
  p "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
