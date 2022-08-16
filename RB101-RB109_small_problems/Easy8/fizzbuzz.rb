=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz",
if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".


**Problem
Write a method that takes two numbers as an argument and prints out every number except the ones divisible by 3 and 5.
If the number is divisible by 3 print 'Fizz'
If the number is divisible by 5 print 'Buzz'
If the number is divisible by both 3 and 5 print 'FizzBuzz'

**Examples/Test Cases
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

**Data Structures
Input: two integers, a starting number and an ending number
Output: Prints out a list of numbers, "Fizz", "Buzz" and "FizzBuzz"

1, 3 => 1, 2, 'Fizz'

**Algorithm
Initialize a variable to an array containing every number in between the two input numbers (including them)
Initialize an empty array to push values into
Iterate over the array and add a conditional statement to each iteration
- If the number is divisible by both 3 and 5 print 'FizzBuzz'
- If the number is divisible by 3 print 'Fizz'
- If the number is divisible by 5 print 'Buzz'
- If none of those conditions apply just print the number currently being iterated over

**Code
=end

def fizzbuzz(n1, n2)
  arr = (n1..n2).to_a
  fizzbuzz = []
  fizzbuzz << arr.map do |number|
    if (number % 3) == 0 && (number % 5) == 0
      'FizzBuzz'
    elsif (number % 3) == 0
      'Fizz'
    elsif (number % 5) == 0
      'Buzz'
    else
      number
    end
  end
 puts fizzbuzz.join(', ')
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz