# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

puts "Please enter an integer greater than 0:"
answer = gets.chomp.to_i


loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  compute = gets.chomp.downcase
  if compute == 's'
    sum = 1.upto(answer).inject(:+)
    puts "The sum of the integers between 1 and #{answer} is #{sum}."
    break
  elsif compute == 'p'
    product = 1.upto(answer).inject(:*)
    puts "The product of the integers between one and #{answer} is #{product}."
    break
  else
    puts "Please enter 's' or 'p'"
  end
end