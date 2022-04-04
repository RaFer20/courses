user_name = "Resu"
password = "Drowssap"

loop do
  puts "Please enter your user"
  user_attempt = gets.chomp
  
  puts "Please enter your password:"
  password_attempt = gets.chomp
  break if password_attempt == password && user_name == user_attempt
  puts "Authorization failed!"
end

puts "Welcome Back"