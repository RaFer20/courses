=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. 
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
and that it will remain in use for the foreseeable future.

**Problem
Write a method that takes an integer representing a year as an argument and returns the amount of firdays the 13ths in that year.
-Assum the year is greater than 1752.

**Examples/Test Cases
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

**Data Structures
Input: integer (year)
Output: integer

**Algorithm
Initialize two variables for the first and last day of the year
Iterate over every day and return an array containing every friday in the year
Iterate over the friday array and select every friday the 13th and call the size method to find out how many elements are in the array
return the size of the array

**Code
=end
require 'date'


def friday_13th(year)
  start = Date.new(year)
  last = Date.new(year, -1, -1)
  fridays = start.step(last).select{|day| day.friday?}
  unlucky = fridays.select{|date| date.mday == 13}.size
  unlucky
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2