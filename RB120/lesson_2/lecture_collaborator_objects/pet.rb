class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end
class Bulldog;
  def speak
    puts 'bark!'
  end
  def fetch
    puts 'fetching!'
  end
end

bob = Person.new("Robert")
bud = Bulldog.new            

bob.pet = bud

# We've essentially set bob's @pet instance variable to bud, which is a Bulldog object.
# This means that when we call bob.pet, it is returning a Bulldog object.
p bob.pet                       # => #<Bulldog:0x007fd8399eb920>
p bob.pet.class                 # => Bulldog

# Because bob.pet returns a Bulldog object, we can then chain any Bulldog methods at the end as well:
bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"

=begin
Objects that are stored as state within another object are also called "collaborator objects".
We call such objects collaborators because they work in conjunction (or in collaboration) with the class they are associated with.
For instance, bob has a collaborator object stored in the @pet variable. When we need that Bulldog 
object to perform some action (i.e. we want to access some behavior of @pet), 
then we can go through bob and call the method on the object stored in @pet, such as speak or fetch.
=end


###################################################################################################################################

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]
=begin
Notice the opening and closing square brackets -- that means this is an array.
You can see that the first element in the array is a Cat object while the second element is a Bulldog object.
Because it's an array, you cannot just call Pet methods on pets

There is no jump method in the Array class, so we get an error. If we want to make each individual pet jump,
we'll have to parse out the elements in the array and operate on the individual Pet object.
=end
bob.pets.each do |pet|
  pet.jump
end