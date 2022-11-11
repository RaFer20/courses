# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1    # we could also `puts` the cats_count after increasing it's value
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

###
# The @@cats_count variable increases by 1 every time a `Cat` object is instantiated.
# We can test it by writing the following:

p Cat.cats_count
Cat.new("Cool Cat")
p Cat.cats_count