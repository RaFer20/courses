# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.



def whats_your_name?
  age = rand(20..200)
  name = gets.chomp
  if name == '' then name = 'Teddy'
  end
 puts "#{name} is #{age} years old!"
  
end

whats_your_name?