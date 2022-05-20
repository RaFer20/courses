def multiply(array, num)
  transformed_array = []
  counter = 0

  loop do
    break if counter == array.size

    transformed_array << array[counter] * num

    counter += 1

  end
  transformed_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

