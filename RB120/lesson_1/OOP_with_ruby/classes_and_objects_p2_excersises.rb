=begin
1.
Add a class method to your MyCar class that calculates the gas mileage of any car.

2.
Override the to_s method to create a user friendly print out of your object.

3.
When running the following code...
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
We get the following error...
test.rb:9:in `<main>': undefined method `name=' for #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?
=end

# class MyCar
#   attr_accessor :color 
#   attr_reader :year, :model
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#   end

#   def accelerate(num)
#     @speed += num
#     puts "You push the gas and accelerate #{num} mph."
#   end

#   def brake(num)
#     @speed -= num
#     puts "You push the brake and decelerate #{num} mph."
#   end

#   def current_speed
#     if @speed > 0
#       puts "You are now going #{@speed} mph."
#     else
#       puts "The car is parked."
#     end
#   end

#   def shut_off
#     @speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def spray_paint(color)
#     self.color =  color
#     puts "Your new #{color} paint job looks great!"
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def to_s
#     "This car is a #{color} #{year} #{model}"
#   end
# end

# corolla = MyCar.new("1997", "red", "Corolla")
# MyCar.gas_mileage(13, 351)

# puts corolla

### excersise 3
# attr_reader doesn't create a setter method, only a getter method. 
# When trying to reassign the name we were calling a method that didn't exist
# Changing it to `attr_accessor` will fix it (attr_writer works too if we only care about the setter method)
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
p bob.name
bob.name = "Bob"
p bob.name