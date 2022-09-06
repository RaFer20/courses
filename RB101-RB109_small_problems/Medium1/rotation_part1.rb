=begin
Write a method that rotates an array by moving the first element to the end of the array. 
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

**Problem
Write a method that takes an array as an argument and returns a new array containing the same elements but with the first
element moved to the end of the array. Don't modify the original array.

**Examples/Test Cases
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

**Data Structures
Input: Array
Output: Array

 ['a', 'b', 'c'] => ['b', 'c', 'a']

**Algorithm
Initialize an empty array to push values into
Iterate through the original array without mutating it
  -Start an If statement
    --If value we are iterating through is equal to the first value in the original array, move to next iteration
    --Else push the value into the new array
Append the first value in the original array to the end of the new array.
Return the new array.

**Code
=end

def rotate_array(arr)
  new_array = []

  arr.each do |element|
    if element == arr.first
      next
    else
      new_array << element
    end
  end

  new_array << arr.first
end

# Shorter approach
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


#Further exploration
#Rotate strings and integers
# You may use rotate_array

def rotate_string(str)
  rotate_array(str.chars)
end

p rotate_string("hello") == ['e', 'l', 'l', 'o', 'h']

def rotate_numbers(num)
  str = rotate_array(num.to_s.chars)
  str.join.to_i
end

p rotate_numbers(374) == 743
p rotate_numbers(1234) == 2341