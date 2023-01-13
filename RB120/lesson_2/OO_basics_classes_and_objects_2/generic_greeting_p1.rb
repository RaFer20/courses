=begin
Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.
class Cat
end

Cat.generic_greeting

Expected output:
Hello! I'm a cat!
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end


Cat.generic_greeting

###Further Exploration
# What happens if you run kitty.class.generic_greeting? Can you explain this result?
kitty = Cat.new
kitty.class.generic_greeting

# We call the `class` method on kitty, which returns `Cat`. We are calling `generic_greeting` on the class returned.