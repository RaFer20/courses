=begin
Write a method that displays a 4-pointed diamond in an n x n grid, 
where n is an odd integer that is supplied as an argument to the method. 
You may assume that the argument will always be an odd integer.

**Problem
Write a method that takes an odd integer as an argument and displays a 4-pointed diamond in an n x n grid.
- n is the odd integer passed as an argument to the method
- The argument will always be odd

**Examples/Test Cases
diamond(1)
*

diamond(3)
 *
***
 *

 diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

**Data Structures
Input: Odd Integer
Output: 4-pointed diamond, its size depends on the input integer
       *
3 =>  ***
       *

**Algorithm
Initialize a `star` variable to `*` 
Initialize a `spaces` variable to the amount of ` ` 
Initialize a `space_amount` to the amount of spaces required for the first line
- input number/2 spaces

Start a loop and output an increasing number of `*` over every iteration until it reaches the amount specified by the argument
Start a similar loop but outputs a decreasing number of `*` starting from the input integer - 1

**Code
=end


def diamond(num)
  star = '*'
  star_amount = 1
  space = ' '
  space_amount = (num-1)/2 
  arr = []

  loop do
    arr << (space * space_amount) + (star * star_amount)
    star_amount += 2
    space_amount -= 1 unless space_amount == 0
    break if star_amount > num
  end

  unless num == 1 then loop do
      star_amount -= 2 
      space_amount += 1 unless star_amount == num
      arr << (space * space_amount) + (star * star_amount) unless star_amount == num
      break if star_amount == 1
    end
  end 
  
  puts arr
end

p diamond(1)
p diamond(3)
p diamond(9)
p diamond(15)