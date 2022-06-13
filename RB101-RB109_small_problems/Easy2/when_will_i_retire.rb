# Build a program that displays when the user will retire and how many years she has to work till retirement.

puts "What is your age?"
age = gets.chomp

puts "At what age would you like to retire?"
retirement_age = gets.chomp

current_time = Time.now
current_year = current_time.year
retirement_year = current_year.to_i + (retirement_age.to_i - age.to_i)
time_left = retirement_year.to_i - current_year.to_i

puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You have #{time_left} years left to go!"