=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition,
 and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate.
For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, 
especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.
=end

def find_fibonacci_index_by_length(num)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.length >= num

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

=begin
Further Exploration
def fibonacci(n)
  return  n  if (0..1).include?(n)
  (fibonacci(n - 1) + fibonacci(n - 2))
end

Fibonacci numbers are sometimes used in demonstrations of how to write recursive methods. 
Had we tried to use a recursive method, it probably would have resulted in the program running out of stack space. 
Ruby isn't well equipped to deal with the level of recursion required for a recursive solution.
=end