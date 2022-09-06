=begin
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow
and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed 
for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). 
With higher values of nth, the recursive solution is impractical. 
(Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

**Problem
Write a method that returns the fibonacci number of the argument passed to it without using recursion

**Examples/Test Cases
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

**Data Structures
Input: Integer
Output: Integer

1 => 1
2 => 1
3 => 2
7 => 13

**Algorithm
return 1 if the number provided is equal or less than 2
Initialize two variable to `1`
start an `until` loop
  -until number is less than 3
  -- `fibonacci_number` is equal to `n1` plus `n2`
  -- `n1` is reassigned to `n2`
  -- `n2` is reassigned to `fibonacci_number`
  -- decrease `number` by 1

Return fibonacci_number

**Code
=end

def fibonacci(number)
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
  fibonacci_number
end



p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501