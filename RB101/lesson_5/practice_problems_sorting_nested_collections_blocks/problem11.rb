# Given the following data structure use a combination of methods, including either the select or reject method,
# to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_array = []
arr.each do |arr2|
  new_array << arr2.select { |n| n % 3 == 0 }
end
p new_array