# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes
# the square of its argument (the square is the result of multiplying a number by itself).

def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end

# def power_of(n, p)
#   n ** p
# end
  
  p square(5) == 25
  p square(-8) == 64

