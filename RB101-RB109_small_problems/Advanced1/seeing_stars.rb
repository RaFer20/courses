=begin
Write a method that displays an 8-pointed star in an nxn grid, 
where n is an odd integer that is supplied as an argument to the method.
The smallest such star you need to handle is a 7x7 grid.

Examples:
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

Input: Integer
Output: an 8-pointed star in a `n x n` grid

Explicit Rules:
The smallest such star you need to handle is a 7x7 grid.

Implicit Rules:
The middle string will always contain only stars
The middle index in every string will always contain a star
Every consecutive string up and down will have the outer stars move one index out

Algorithm

Initialize an array of strings, containing a string with an `n` amount of stars. (This will be the middle string)
Initialize a `mid_index` to n/2
Half the input number and loop that amount of times to create strings
-Initialize a string to (n/3) spaces at the start and end of the string, 
-- if n-1 is divisible by 6 have (n/3)+1 stars in the middle
-- if n-3 is divisible by 6 have (n/3) stars in the middle
-- if n-5 is divisible by 6 have (n/3)+2 stars in the middle
-Insert this string into the stars array at the start and at the end
Output stars
=end

def star(n)
  stars = ["*" * n]
  mid_index = n/2

  (n/2).times do |idx|
    if n % 6 == 1
      string = " " * (n/3) + "*" * ((n/3)+1) + " " * (n/3)
    elsif n % 6 == 3
      string = " " * (n/3) + "*" * ((n/3)) + " " * (n/3)
    else
      string = " " * (n/3) + "*" * ((n/3)+2) + " " * (n/3)
    end
    string[mid_index-1], string[(mid_index-1)-idx] = string[(mid_index-1)-idx], string[(mid_index-1)]
    string[mid_index+1], string[(mid_index+1)+idx] = string[(mid_index+1)+idx], string[mid_index+1]
    stars.prepend(string)
    stars.append(string)
  end
  puts stars
end

p star(7)
p star(9)
p star(13)
p star(15)
p star(17)
p star(19)
p star(21)
p star(99)