
## Instance Variables
 behave the way we'd expect. The only thing to watch out for is to make sure the instance variable is initialized before referencing it.

module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  # => nil

teddy = Dog.new
teddy.enable_swimming
teddy.swim                                  # => swimming!


##############################################################
## Class Variables
 have a very insidious behavior of allowing sub-classes to override super-class class variables. Further, the change will affect all other sub-classes of the super-class. This is extremely unintuitive behavior, forcing some Rubyists to eschew using class variables altogether.

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => 2
Vehicle.wheels                              # => 2  Yikes!


############################################################
## Constants
 have lexical scope, meaning the position of the code determines where it is available. Ruby attempts to resolve a constant by searching lexically of the reference, then by inheritance of the enclosing class/module, and finally the top level.

class Vehicle
  WHEELS = 4
end

WHEELS = 6

class Car < Vehicle
  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4