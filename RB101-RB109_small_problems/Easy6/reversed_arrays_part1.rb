# Write a method that takes an Array as an argument, and reverses its elements in place;
# that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(arr)
  counter = 0
  new_arr = []
  arr_size = arr.size

  if arr.empty?
    arr
  else
    loop do
      counter += 1
      new_arr << arr.pop
      break if counter >= arr_size
    end
    counter = 0
    loop do
      counter += 1
      arr << new_arr.shift
      break if counter >= arr_size
    end
    arr
  end
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true


=begin
Solution provided by LS

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end
=end