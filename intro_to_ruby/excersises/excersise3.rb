# excersise3.rb

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each do |x| 
  if x % 2 != 0
    puts x
  end
end

# the ones below are the solutions on the book

# one line version
new_array = array.select { |number| number % 2 != 0 }

# multi-line version
new_array = array.select do |number|
  number % 2 != 0
end