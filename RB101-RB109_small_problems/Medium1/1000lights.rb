=begin
You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. 
You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. 
On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, 
and returns an Array that identifies which lights are on after n repetitions.



**Problem
Write a method that takes an integer as an argument and returns an array that identifies which lights
are on after `n` repetitions of toggling every switch that is a multiple of the repetition we are in.

**Examples/Test Cases
Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

**Data Structures
Input: Integer
Output: Array of integers


3  => [1]
5  => [1, 4]
10 => [1, 4, 9]

**Algorithm
Identify lights from 1 to `n` and initialize them as an array
initialize a new empty array to add the lights that are `on` at any given time

Iterate through the `lights_off` array
-every iteration move the desired values to `lights_on`
--The desired values are the numbers that are multiples of the number representing the current iteration
-If the number is already included in lights_on, remove it instead

Return `lights_on`


**Code
=end

def light_switch(n)
  lights_off = (1..n).to_a
  lights_on = []

  lights_off.each do |multiple|
    1.upto(n) do |number|
      if number % multiple == 0 && lights_on.include?(number)
        lights_on.delete(number)
      elsif number % multiple == 0
        lights_on << number
      else
        next
      end
    end
  end

  lights_on
end

p light_switch(5) == [1, 4]
p light_switch(10) == [1, 4, 9]
p light_switch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]