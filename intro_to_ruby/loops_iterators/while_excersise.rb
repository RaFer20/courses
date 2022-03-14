# while_excersise.rb

x = ""
while x != "STOP" do
  puts "Hey, how's your day?"
  answer = gets.chomp
  puts "Do you want me to STOP?"
  x = gets.chomp
end