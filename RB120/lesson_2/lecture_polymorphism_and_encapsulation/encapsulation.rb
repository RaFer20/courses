class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!

=begin
In this example, we can change the nickname of a dog by calling the change_nickname method without needing to know
 how the Dog class and this method are implemented.

The same thing happens when we call the method greeting on a Dog object. The output is Barny says Woof Woof!, 
with the dog's nickname capitalized. Again, we don't need to know how the method is implemented. 
The main point is that we expect a greeting message from the dog and that's what we get.

Note that the setter method for nickname is private: it is not available outside of 
the class and dog.nickname = "barny" would raise an error.

=end