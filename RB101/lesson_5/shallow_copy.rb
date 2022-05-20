# Both of these methods create a shallow copy of an object.
# This means that only the object that the method is called on is copied.
# If the object contains other objects - like a nested array - 
# then those objects will be shared, not copied. 
# This has major impact to nested collections.

# dup allows objects within the copied object to be modified.
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]


# clone works the same way.
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]


# Example 1
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
# we are changing arr2 but not the elements within it so arr1 remains unchanged

# Example 2
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
# We are calling the upcase! method on each element of the array so the changes in arr2 are reflected in arr1