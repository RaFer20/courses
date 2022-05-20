# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# p would print 34 since its using the original "answer" variable which is still 42. in other words 42 - 8 = 34