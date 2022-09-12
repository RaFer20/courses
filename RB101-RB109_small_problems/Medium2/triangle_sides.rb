=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, 
and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol 
:equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

**Problem

**Examples/Test Cases
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

**Data Structures
Input: three integers
Output: symbol

3, 3, 3 => :equilateral
0, 0, 5 => :invalid
4, 4, 9 => :invalid

**Algorithm
Initialize an array to the three values provided by the argument
return `:invalid` if the array contains any zeros or the value of the sum of two smallest numbers is smaller than the largest number
return `:equilateral` if all values are the same
return `:isoceles` if the two smallest or largest values are the same
return `:scalene` if none of the previous conditions are met


**Code
=end

def triangle(l1, l2, l3)
  arr = [l1, l2, l3]
  return :invalid if arr.any?(0) || arr.min(2).inject(:+) < arr.max 
  return :equilateral if l1 == l2 && l1 == l3
  return :isosceles if arr.min(2).uniq.length == 1 || arr.max(2).uniq.length == 1
  return :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid