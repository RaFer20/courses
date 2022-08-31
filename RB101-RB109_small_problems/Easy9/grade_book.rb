=begin
Write a method that determines the mean (average) of the three scores passed to it, 
and returns the letter value associated with that grade.

Numerical Score      Letter	Grade
90 <= score <= 100	     'A'
80 <= score < 90	       'B'
70 <= score < 80	       'C'
60 <= score < 70	       'D'
0 <= score < 60	         'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

**Problem
Write a method that takes three integers as arguments and determines their average,
then returns a letter value associated with that average.

**Examples/Test Cases
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

**Data Structures
Input: three integers
Output: string, letter value associated with the average of the three input values.

(90, 95, 100) => "A"
(70, 75, 77) => "C"

**Algorithm
Initialize a `score` variable to the average of the three input numbers (add the three numbers then divide by three)
Start a case statement
-Return a letter from "A" to "F" depending on the number represented by `score`

**Code
=end

def get_grade(n1, n2, n3)
  score = (n1 + n2 + n3)/3

  case score
  when 90..100
    'A'
  when 80...90
    'B'
  when 70...80
    'C'
  when 60...70
    'D'
  when 0...60
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(42, 70, 35) == "F"