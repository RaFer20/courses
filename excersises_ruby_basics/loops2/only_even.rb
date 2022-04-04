number = 0

until number == 10
  number += 1
  next if number.odd? 
  puts number
end

#next is placed after the counter and before puts so that
# the next can skip to the next iteration after checking if 
# the number is even or odd, and print it if it is even.