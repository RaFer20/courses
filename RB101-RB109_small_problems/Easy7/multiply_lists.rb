=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.
=end

=begin
**Problem**
Write a method that takes two arrays of the same length, containing numbers, as arguments and returns a new array with the product
of the numbers on the same index in each array.


**Examples/Test Cases**

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
multiply_list([0, 4, 8], [2, 4, 6]) == [0, 16, 48]

**Data Structures**
Input: two arrays of the same length
Output: New array containing the product of the arguments arrays at each index

array1[index0] * array2[index0] == new_array[index0]

**Algorithm**
Initialize a new array within the method
iterate through the argument arrays and multiply the numbers at each index
push the product number into the new array
return the product array

**Code**
=end

def multiply_list(arr1, arr2)
  product = []
   arr1.each_with_index do |number, index|
   product << (arr1[index] * arr2[index])
  end
  product
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([0, 4, 8], [2, 4, 6]) == [0, 16, 48]


#further Exploration 
# The Array#zip method can be used to produce an extremely compact solution to this method. Read the documentation for zip, 
# and see if you can come up with a one line solution (not counting the def and end lines).

def multiply_list(a, b)
  a.zip(b).map {|sub_array| sub_array.inject(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11])