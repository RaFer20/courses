# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end


fruit_basket = Fruit.new("Apple")
pizza_order = Pizza.new("Pepperoni")

p fruit_basket.instance_variables
p pizza_order.instance_variables
=begin
Pizza has an instance variable. 
We know this because one is initialized inside the `initialize` method, on `Fruit` on the other hand we are
initializing a local variable inside the `initialize` method
=end