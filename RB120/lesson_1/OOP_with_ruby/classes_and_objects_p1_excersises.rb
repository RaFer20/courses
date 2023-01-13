=begin
1.
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model of the car.
Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
Create instance methods that allow the car to speed up, brake, and shut the car off.

2.
Add an accessor method to your MyCar class to change and view the color of your car.
Then add an accessor method that allows you to view, but not modify, the year of your car.

3.
You want to create a nice interface that allows you to accurately describe the action you want your program to perform. 
Create a method called spray_paint that can be called on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def accelerate(num)
    @speed += num
    puts "You push the gas and accelerate #{num} mph."
  end

  def brake(num)
    @speed -= num
    puts "You push the brake and decelerate #{num} mph."
  end

  def current_speed
    if @speed > 0
      puts "You are now going #{@speed} mph."
    else
      puts "The car is parked."
    end
  end

  def shut_off
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color =  color
    puts "Your new #{color} paint job looks great!"
  end
end

corolla = MyCar.new("1997", "red", "Corolla")

corolla.accelerate(10)
corolla.current_speed
corolla.brake(5)
corolla.current_speed
corolla.shut_off
corolla.current_speed
p corolla.color
corolla.spray_paint("black")
p corolla.color
p corolla.year

