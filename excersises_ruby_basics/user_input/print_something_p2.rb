answer = nil
loop do 
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  break if %w(y n).include?(answer)
  puts "invalid input, Try Again!"
end
puts 'something' if answer == 'y'