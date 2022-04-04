def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
 #6 arguments, expected 1

find_first_nonzero_among(1)
# integers do not have an each method