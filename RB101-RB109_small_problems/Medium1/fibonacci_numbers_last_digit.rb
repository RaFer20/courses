=begin
In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. 
This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

**Problem
Write a method that returns the last digit of the fibonacci number specified by the argument.

**Examples/Test Cases
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

**Data Structures
Input: integer
Output: single digit integer

1 => 1
7 => 3

**Algorithm
return 1 if the number provided is equal or less than 2
Initialize `fibonacci_number` to an array `[1, 1]`
start an `until` loop
  -until number is less than 3
  -- `fibonacci_number` is equal to the last number in the fibonacci number array and (first + last)%10
  -- decrease `number` by 1

Return the last element of the fibonacci_number array

**Code
=end


# def fibonacci_last(number)
#   return 1 if number <= 2
#   fibonacci_number = [1, 1]
#   until number < 3
#     fibonacci_number = [fibonacci_number.last, (fibonacci_number.first + fibonacci_number.last) % 10]
#     number -= 1
#   end
#   fibonacci_number.last
# end

def fibonacci_last(number)
  return 1 if number <= 2
  n1 = 1
  n2 = 1
  fibonacci_number = 0
  until number < 3
    fibonacci_number = n1 + n2
    n1 = n2
    n2 = fibonacci_number
    number -= 1
  end
  fibonacci_number % 10
end

p fibonacci_last(4)
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4