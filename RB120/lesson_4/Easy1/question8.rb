# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# It refers to the object the method is called on. for example:

snowball = Cat.new("Maine Coon")

snowball.make_one_year_older
p snowball.age

# In this case the self refers to the `Cat` object stored in `snowball`