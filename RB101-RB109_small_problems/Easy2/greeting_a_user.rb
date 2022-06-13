# Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

puts "What is your name?"
name = gets.chomp

if name.end_with?("!")
  puts "HELLO #{name.delete_suffix('!').upcase}. WHY ARE WE SCREAMING?" #could have also used `.chop`
else
  puts "Hello #{name}."
end
