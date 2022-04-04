loop do
answer = nil
number_of_lines = nil

loop do
  puts "How many lines do you want me to print? Enter a number >= 3: (Q to quit)"
  answer = gets.chomp.downcase
  break if answer == 'q'

  number_of_lines = answer.to_i
  break if number_of_lines >= 3

  puts "Your answer needs more lines."
  end

  break if answer == 'q'

  while number_of_lines > 0
    puts "Launch School is the best!"
    number_of_lines -= 1
  end
end 