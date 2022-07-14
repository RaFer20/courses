# Write a method that combines two Arrays passed in as arguments, and returns a new Array 
# that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# def interleave(arr1, arr2)
#   new_array = []
#   size = arr1.size
#   size.times do |iteration|
#     new_array << arr1.shift
#     new_array << arr2.shift
#   end
#   new_array
# end

#Further exploration
# solve using `Array#zip`
def interleave(arr1, arr2)
  new_array = arr1.zip(arr2)
  new_array.inject(:+)
end





p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']