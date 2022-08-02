# Write a method that takes an Array of integers as input, multiplies all the numbers together, 
# divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. 
# Assume the array is non-empty.


def show_multiplicative_average(arr)
  multiplication = arr.inject(:*)
  division = multiplication.to_f/arr.size
  division =  division.round(3)
  "The result is #{format('%.3f', division)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


=begin
Further Exploration
What happens if you omit the call to #to_f on the first line of our method?

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end


If we omit the call #to_f we'd be working with an integer instead of a float so every number woulds display "number.000" at the end
=end