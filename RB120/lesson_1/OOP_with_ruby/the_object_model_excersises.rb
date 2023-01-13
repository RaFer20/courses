# 1.How do we create an object in Ruby? Give an example of the creation of an object.

# 2.What is a module? What is its purpose?
#   How do we use them with our classes?
#   Create a module for the class you created in exercise 1 and include it properly.

# A module is a collection of behaviors that is usable in other classes via mixins.
# It can be included or "mixed in" a class using the `include` method invocation.

# Extend Functionality
module Learn
  def learn(lesson)
    puts "Learning: #{lesson}"
  end
end

class Student
  include Learn
end

Bob = Student.new

Bob.learn("Math")


# Namespacing
module Food
  class Meat
  end
  class Fruit
  end
  class Vegetable
  end
end

apple = Food::Fruit.new
carrot = Food::Vegetable.new