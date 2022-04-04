password = "Drowssap"

loop do
  puts "Please enter your password:"
  password_attempt = gets.chomp
  break if password_attempt == password
  puts "Invalid password!"
end


puts "Welcome Back!"
