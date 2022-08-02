=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers,
 and returns a new Array that contains the product of every pair of numbers
  that can be formed between the elements of the two Arrays. 
 The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.


**Problem**
Write a method that will take two arrays of numbers as arguments and returns a new array containing the product
of every pair of numbers formed between the two arrays.

**Example/Test Cases**

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

**Data Structures**

new_array << array1[0] * array2[0] 
new_array << array1[0] * array2[1] 
new_array << array1[0] * array2[2] 
new_array << array1[0] * array2[3]
new_array << array1[1] * array2[0] ... etc

**Algorithm**

Initialize a new empty array within the method to push the values into
initialize two `index` variables to `0`
start a loop to iterate through the arrays
Increment the second `index` by 1 after every iteration, when it reaches `array.size` reset it to 0 and increment first index by 1
Loop until every number is accounted for and break when the new array's length == (array1.size * array2.size)
Sort the new array and return it


**Code**
=end

def multiply_all_pairs(array1, array2)
  product = []
  index1 = 0
  index2 = 0

  loop do 
    break if (array1.size * array2.size) == product.size
    product << array1[index1] * array2[index2]
    index2 += 1
    if index2 == array2.size then index2 = 0 end
    if index2 == 0 then index1 += 1 end
  end
  product.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]