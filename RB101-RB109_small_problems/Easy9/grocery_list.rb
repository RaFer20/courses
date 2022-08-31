=begin
Write a method which takes a grocery list (array) of fruits with quantities 
and converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]


**Problem
Write a method that takes an array of arrays as an argument, each sub array contains a string and an integer.
Return an array containing the amount of fruit specified by the integer in it's sub array.

**Examples/Test Cases
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

**Data Structures
Input: Array of arrays
Output: Array

**Algorithm
Initialize a new array `fruits` to push values into
Iterate through the array to push the `arr[0]` value into the `fruits` array an `arr[1]` amount of times.
Return the `fruits` array

**Code
=end
def buy_fruit(arr)
  fruits = []
  arr.each do |subarr|
    subarr[1].times { fruits << subarr[0]}
  end
  fruits
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]