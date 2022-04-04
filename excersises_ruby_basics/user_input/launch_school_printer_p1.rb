answer = nil
loop do
puts "How many lines do you want me to print? Enter a number >= 3:"
  answer = gets.chomp.to_i
  break if answer >= 3
  puts "Your answer needs more lines."
end

while answer > 0
  puts "Launch School is the best!"
  answer -= 1
end

