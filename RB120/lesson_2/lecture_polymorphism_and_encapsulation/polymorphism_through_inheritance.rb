class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }

=begin
Every object in the array is a different animal, but the client code -- the code that uses those objects -- 
doesn't care what each object is. 
The only thing it cares about here is that each object in the array has a move method that requires no arguments. 
That is, every generic animal object implements some form of locomotion, though some animals don't move. 
The interface for this class hierarchy lets us work with all of those types in the same way even though
 the implementations may be dramatically different. 
That is polymorphism.



The Sponge and Coral classes don't have a move method -- at least not one of their own. 
Instead, they both inherit it from the Animal class. Thus, when we call move on a Sponge or Coral object, 
the move method in the Animal class gets called. That method does nothing here, so the Sponge or Coral doesn't move. 
This is polymorphism through inheritance -- instead of providing our own behavior for the move method, 
we're using inheritance to acquire the behavior of a superclass. In this case, that behavior does nothing, 
but it could do something else.
=end