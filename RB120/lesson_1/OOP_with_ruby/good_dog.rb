# module Speak
#     def speak(sound)
#       puts "#{sound}"
#     end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end

# sparky = GoodDog.new
# sparky.speak("Arf!")  #=> Arf!
# bob = HumanBeing.new
# bob.speak("Hello!")  #=> Hello!

# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ''
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name                  # This was renamed from "get_name"
#     @name
#   end

#   def name=(n)              # This was renamed from "set_name="
#     @name = n
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.name            # => "Sparky"
# sparky.name = "Spartacus"
# puts sparky.name            # => "Spartacus"

=begin
Setter methods always return the value that is passed in as an argument, regardless of what happens inside the method.
If the setter tries to return something other than the argument's value, it just ignores that attempt.
=end

# class GoodDog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} says arf!" # now calling the getter method
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.name            # => "Sparky"
# sparky.name = "Spartacus"
# puts sparky.name            # => "Spartacus"


#attr_accessor for both getter and setter
#attr_reader for only getter
#attr_writer for only setter

# to track more states we can use:
# attr_accessor :name, :height, :weight 

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
#   # def some_method
#   #   self.info
#   # end
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

################################################################################
#Classes and objects - Part 2

## Class Methods

# class GoodDog
#   def self.what_am_i         # Class method definition
#     "I'm a GoodDog class!"
#   end
# end

# p GoodDog.what_am_i          # => I'm a GoodDog class!


## Class Variables

# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs   # => 0

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs   # => 2



## Constants

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age             # => 28



## Overwriting to_s (which is built in to every class in Ruby)
# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age  = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end
# sparky = GoodDog.new("Sparky", 4)
# puts sparky      # => This dog's name is Sparky and is 28 in dog years.
# p sparky         # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>


## More about self
# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name   = n
#     self.height = h
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name   = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end

#   def what_is_self
#     self      # The calling object, sparky in this case
#   end
#   puts self   # GoodDog class
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# p sparky.what_is_self
# # => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">


# class MyAwesomeClass  # def self.a_method is equivalent to def MyAwesomeClass.a_method
#   def self.this_is_a_class_method  ## Class method definition
#   end
# end

=begin
1. self, inside of an instance method, references the instance (object) that called the method - the calling object. 
Therefore, self.weight= is the same as sparky.weight=, in our example.

2. self, outside of an instance method, references the class and can be used to define class methods. 
Therefore if we were to define a name class method, def self.name=(n) is the same as def GoodDog.name=(n).

Thus, we can see that self is a way of being explicit about what our program is referencing and what our intentions are as far as behavior. 
self changes depending on the scope it is used in, so pay attention to see if you're inside an instance method or not.
=end

#################################################################################
#  Inheritance

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
# end

# class Cat < Animal
# end

# sparky = GoodDog.new
# paws = Cat.new
# puts sparky.speak           # => Hello!
# puts paws.speak             # => Hello!

#####

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n
#   end

#   def speak
#     "#{self.name} says arf!"   # In this case we're overwriting the `speak` metho from `Animal`
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new

# puts sparky.speak           # => Sparky says arf!
# puts paws.speak             # => Hello!

######
# `super` keyword
#  in the subclass' speak method we use super to invoke the speak method from the superclass, Animal,
#  and then we extend the functionality by appending some text to the return value.

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   def speak
#     super + " from GoodDog class"
#   end
# end

# sparky = GoodDog.new
# sparky.speak        # => "Hello! from GoodDog class"


######
# `super` with initialize

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end
# bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

# # When called with specific arguments, eg. super(a, b), the specified arguments will be sent up the method lookup chain.
# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">

################################
=begin
There's one last twist. If you call super() exactly as shown
-- with parentheses -- it calls the method in the superclass with no arguments at all. 
If you have a method in your superclass that takes no arguments, 
this is the safest -- and sometimes the only -- way to call it
=end

# class Animal
#   def initialize
#   end
# end

# class Bear < Animal
#   def initialize(color)
#     super() # If you forget to use the parentheses here, Ruby will raise an ArgumentError exception since the number of arguments is incorrect.
#     @color = color
#   end
# end

# bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">

#########
#Mixing in modules

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable         # mixing in Swimmable module
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable         # mixing in Swimmable module
# end

# sparky = Dog.new
# neemo  = Fish.new
# paws   = Cat.new

# sparky.swim                 # => I'm swimming!
# neemo.swim                  # => I'm swimming!
# paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
=begin
Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling.
You can see this convention with our Swimmable module. Likewise, we could name a module that describes "walking" as Walkable.
Not all modules are named in this manner, however, it is quite common.
=end

##############################
#Inheritance vs Modules

# You may wonder when to use class inheritance vs mixins. Here are a couple of things to consider when evaluating these choices.
=begin
You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.

If there's an "is-a" relationship, class inheritance is usually the correct choice. 
If there's a "has-a" relationship, interface inheritance is generally a better choice. 
For example, a dog "is an" animal and it "has an" ability to swim.

You cannot instantiate modules (i.e., no object can be created from a module). 
Modules are used only for namespacing and grouping common methods together.
=end

##########################
# Method lookup path

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end
# puts "---Animal method lookup---"
# puts Animal.ancestors
# fido = Animal.new
# fido.speak                  # => I'm an animal, and I speak!
# # Ruby found the speak method in the Animal class and looked no further.

# fido.walk                   # => I'm walking.
# # Ruby first looked for the walk instance method in Animal, and not finding it there, 
# # kept looking in the next place according to our list, which is the Walkable module. 
# # It saw a walk method there, executed it, and stopped looking further.

# fido.swim                   # => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>
# # Ruby traversed all the classes and modules in the list, and didn't find a swim method, so it threw an error.

# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors


########################################################################
# More Modules

# Namespacing
# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')           # => "Arf!"
# kitty.say_name('kitty')       # => "kitty"


# Module Methods
# module Mammal
#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
# end
# value = Mammal.some_out_of_place_method(4) # preferred way
# # or
# value = Mammal::some_out_of_place_method(4)

#################################################################
# Private, Protected, and Public
=begin
A public method is a method that is available to anyone who knows either the class name or the object's name. 
These methods are readily available for the rest of the program to use and comprise the class's interface
(that's how other classes and objects will interact with this class and its objects
Right now, all the methods in our GoodDog class are public methods.

Sometimes you'll have methods that are doing work in the class but don't need to be available to the rest of the program. 
These methods can be defined as private. How do we define private methods? 
We use the private method call in our program and anything below it is private 
(unless another method, like protected, is called after it to negate it).
=end

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end
#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end
#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# sparky.human_years # => NoMethodError: private method `human_years' called for #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>

=begin
As of Ruby 2.7, it is now legal to call private methods with a literal self as the caller.
Note that this does not mean that we can call a private method with any other object, not even one of the same type.
We can only call a private method with the current object.
=end


=begin
Public and private methods are most common, but in some less common situations, we'll want an in-between approach. 
For this, we can use the protected method to create protected methods. 
Protected methods are similar to private methods in that they cannot be invoked outside the class. 
The main difference between them is that protected methods allow access between class instances, while private methods do not.
=end

# class Person
#   def initialize(age)
#     @age = age
#   end

#   def older?(other_person)
#     age > other_person.age
#   end

#   protected

#   attr_reader :age
# end

# malory = Person.new(64)
# sterling = Person.new(42)

# malory.older?(sterling)  # => true
# sterling.older?(malory)  # => false

# malory.age # => NoMethodError: protected method `age' called for #<Person: @age=64>


##############################################################################################
# Accidental method overwriting

# It’s important to remember that every class you create inherently subclasses from class Object. 
# The Object class is built into Ruby and comes with many critical methods.

class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass       # => Object

# This means that methods defined in the Object class are available in all classes.

# Further, recall that through the magic of inheritance, a subclass can override a superclass’s method.

class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi         # => "Hi from Child."


# This means that, if you accidentally override a method that was originally defined in the Object class, 
# it can have far-reaching effects on your code.



# Let's see how send normally works by making use of our Child class:
son = Child.new
son.send :say_hi       # => "Hi from Child."

# Let's see what happens when we define a send method in our Child class and then try to invoke Object's send method:

class Child
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end
end

lad = Child.new
lad.send :say_hi# => ArgumentError: wrong number of arguments (1 for 0) from (pry):12:in `send'
########
c = Child.new
c.instance_of? Child      # => true
c.instance_of? Parent     # => false
# Now let's override instance_of? within Child:
class Child
  # other methods omitted

  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child # => ArgumentError: wrong number of arguments (1 for 0) from (pry):22:in `instance_of?'
