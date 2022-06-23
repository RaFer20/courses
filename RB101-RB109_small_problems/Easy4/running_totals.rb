# Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
# and each element has the running total from the original Array.


# def running_total(array)
#   new_array = []
#   running_total = 0

#   array.map do |num| 
#     running_total += num
#     new_array << running_total
#   end
#   new_array
# end

# Further exploration
# Solve using `each_with_object`

def running_total(array)
  running_total = 0
  array.each_with_object([]) do |num, arr|
    running_total += num
    arr.push(running_total)
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []