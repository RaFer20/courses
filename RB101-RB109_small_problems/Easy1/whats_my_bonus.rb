=begin
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

Problem
Write a method that calculates the bonus for a salary and takes two arguments, a positive integer and a boolean. 
If the boolean is true, bonus is half the salary, if false the bonus is 0

Examples/Test Cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

Data Structures
input: Positive Integer and a boolean
output: Positive Integer or 0


Algorithm
- Define a method called `calculate_bonus` that takes two parameters, an integer and a boolean
- make a conditional `If statement`, if the boolean is true, bonus should be half the input integer, else it should be 0


Code
=end

def calculate_bonus(num, boolean)
bonus = if boolean == true
          num/2
        else
          0
        end
bonus
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000