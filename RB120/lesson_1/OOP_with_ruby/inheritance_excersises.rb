=begin
1.
Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior 
that isn't specific to the MyCar class to the superclass. 
Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that also has a constant 
defined that separates it from the MyCar class in some way.

2. 
Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass.
Create a method to print out the value of this class variable as well.

3.
Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

4.
Print to the screen your method lookup for the classes that you have created.

5.
Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. 
Make sure that all of your previous method calls are working when you are finished.

6.
Write a method called age that calls a private method to calculate the age of the vehicle. 
Make sure the private method is not available from outside of the class. 
You'll need to use Ruby's built-in Time class to help.
=end

# module Racecar
#   def is_fast?(speed)
#     speed > 150
#   end
# end

# class Vehicle
#   attr_accessor :color 
#   attr_reader :year, :model, :speed, :vehicles

#   @@vehicles = 0


#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#     @@vehicles += 1
#   end

#   def self.amount
#     puts "There are currently #{@@vehicles} vehicles in the streets!"
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

#   def age
#     "Your #{self.model} is #{years_old} years old."
#   end

#   private

#   def years_old
#     Time.now.year - self.year.to_i
#   end
# end

# class MyCar < Vehicle
#   include Racecar
#   CAR_SIZE = 2

#   def to_s
#     "This car is a #{color} #{year} #{model}"
#   end
# end

# class MyTruck < Vehicle

#   TRUCK_SIZE = 5

#   def to_s
#     "This Truck is a #{color} #{year} #{model}"
#   end
# end

# puts "1##########"
# corolla = MyCar.new("1997", "red", "Corolla")
# pickup = MyTruck.new("2002", "blue", "Pickup")
# MyCar.gas_mileage(13, 351)
# MyTruck.gas_mileage(18, 422)

# puts corolla
# puts pickup

# corolla.accelerate(10)
# corolla.current_speed
# puts "2###########"
# Vehicle.amount
# puts "3###########"
# p corolla.is_fast?(corolla.speed)
# corolla.accelerate(200)
# p corolla.is_fast?(corolla.speed)
# puts "4###########"
# puts "MyCar ancestors:"
# puts MyCar.ancestors
# puts " "
# puts "MyTruck ancestors:"
# puts MyTruck.ancestors

# puts "5#####################"
# corolla.accelerate(10)
# corolla.current_speed
# corolla.brake(5)
# corolla.current_speed
# corolla.shut_off
# corolla.current_speed
# p corolla.color
# corolla.spray_paint("black")
# p corolla.color
# p corolla.year

# puts "6####################"
# puts corolla.age


=begin
7.
Create a class 'Student' with attributes name and grade. 
Do NOT make the grade getter public, so joe.grade will raise an error. 
Create a better_grade_than? method, that you can call like so...
=end

# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end
#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   attr_reader :name

#   protected

#   attr_reader :grade

# end

# joe = Student.new("Joe", 100)
# bob = Student.new("Bob", 78)

# puts "Well done!" if joe.better_grade_than?(bob)

=begin
8.
Given the following code...

bob = Person.new
bob.hi

And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?
=end

# 8. By moving the `hi` method above the `private` keyword