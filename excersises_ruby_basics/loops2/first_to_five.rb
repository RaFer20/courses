number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  #if number_a == 5 || number_b == 5
    puts '5 was reached!'
    break
  #else
   # next
  #end
end

#the comments using if/else give the same results