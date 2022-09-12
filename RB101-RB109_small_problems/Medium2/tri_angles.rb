=begin
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
and all angles must be greater than 0: if either of these conditions is not satisfied, 
the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol
 :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. 
You may also assume that the arguments are specified in degrees.

**Problem
Write a method that returns the classification of a triangle based on it's angles.
-The classification is returned as a symbol
-To be valid the total sum of the three values must be 180 and all angles must be greater than 0
-You may assume the integer values are specified in degrees

**Examples/Test Cases
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

**Data Structures
Input: three integers
Output: symbol

30, 30, 30 => :invalid
30, 60, 90 => :right
30, 50, 100 => :obtuse
60, 60, 60 => :acute

**Algorithm
Initialize an array with the three values provided in the input
Return `:invalid` if the sum of the degrees isn't 180 or if any value isn't greater than 0
Start an if statement
-if any value is equal to 90 return `:right`
-if any value is more than 90 return `:obtuse`
-otherwise return `:acute`

**Code
=end

def triangle(d1, d2, d3)
  degrees = [d1, d2, d3]
  return :invalid if degrees.inject(:+) != 180 || degrees.any? {|value| value <= 0}

  if degrees.any?{|value| value == 90}
    return :right
  elsif degrees.any?{|value| value > 90}
    return :obtuse
  else
    return :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid