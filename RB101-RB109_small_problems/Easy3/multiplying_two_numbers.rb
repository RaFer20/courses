# Create a method that takes two arguments, multiplies them together, and returns the result.
=begin
Problem
Create a method that multiplies two input numbers.

examples/Test Cases 
multiply(5, 3) == 15

Data Structures
input: Two integers
Output: Product of the two input integers

Algorithm
- Define a method that takes two parameters.
- multiply the numbers passed as arguments.
- return the result of the multiplication.

Code
=end

def multiply(n1, n2)
n1 * n2
end

p multiply(5, 3) == 15

# further exploration
# p multiply([1, 5], 3) == ([1, 5, 1, 5, 1, 5])
# If the first argument is an array it will return an array with the elements within the array showing up a number
# of times specified by the second argument.