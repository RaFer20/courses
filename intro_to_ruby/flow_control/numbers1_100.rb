# numbers1_100.rb

puts "Type a number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "that's a negative number"
elsif number <=50 
  puts "#{number} is between 0 and 50"
elsif number <= 100
  puts "#{number} is between 51 and 100"
else 
  puts "number goes beyond 100"
end