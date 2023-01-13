=begin
Consider the following classes:
class Car
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    2
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    "#{make} #{model}"
  end
end

Refactor these classes so they all use a common superclass, and inherit behavior as needed.
=end
class Vehicles
  attr_reader :make, :model
  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
  end
end

class Car < Vehicles
  def wheels
    4
  end
end

class Motorcycle < Vehicles
  def wheels
    2
  end
end

class Truck < Vehicles
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end
class Boat < Vehicles
end

car_obj = Car.new("sickmake", "dopemodel")
motorcycle_obj = Motorcycle.new("motomake", "motomode")
truck_obj = Truck.new("this", "that", "alot")
puts car_obj
puts motorcycle_obj
puts truck_obj

boat_obj = Boat.new("1", "2")
p boat_obj.wheels
=begin
Further Exploration

Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it?
Why or why not? If you think it does make sense, what method body would you write?

It would make sense to add a `wheels` method with an empty body in Vehicle
if we were to add an airplane class or a boat class to vehicles and make a method to output wheels on every vehicle, those with
no wheel method would raise "nomethod" errors, by adding an empty wheels method to the superclass we can prevent this issue by having
a wheels method to call
=end