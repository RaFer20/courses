=begin
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing
integers (in order) between the first and last elements of the argument.

Examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
=end

def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Further Exploration
# Can you find other ways to solve this problem? What methods might prove useful?
# Can you find a way to solve this without using a method that requires a block?

def missing(arr)
  result = []

  arr.each_cons(2) do |num1, num2|
    result += ((num1 + 1)..(num2 - 1)).to_a
  end
  
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []