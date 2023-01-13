## Instance Variable Scope
Instance variables are variables that start with @ and are scoped at the object level. They are used to track individual object state, and do not cross over between objects. For example, we can use a @name variable to separate the state of Person objects.

class Person
  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect              # => #<Person:0x007f9c830e5f70 @name="bob">
puts joe.inspect              # => #<Person:0x007f9c830e5f20 @name="joe">

Because the scope of instance variables is at the object level, this means that the instance variable is accessible in an object's instance methods, even if it's initialized outside of that instance method.

Unlike local variables, instance variables are accessible within an instance method even if they are not initialized or passed in to the method. Remember, their scope is at the object level.
###################
class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => nil

This shows another distinction from local variables. If you try to reference an uninitialized local variable, you'd get a NameError. But if you try to reference an uninitialized instance variable, you get nil.


## Class Variable Scope

Class variables start with @@ and are scoped at the class level. They exhibit two main behaviors:

- all objects share 1 copy of the class variable. (This also implies objects can access class variables by way of instance methods.)
- class methods can access class variables, regardless of where they're initialized.

class Person
  @@total_people = 0            # initialized at the class level

  def self.total_people
    @@total_people              # accessible from class method
  end

  def initialize
    @@total_people += 1         # mutable from instance method
  end

  def total_people
    @@total_people              # accessible from instance method
  end
end

Person.total_people             # => 0
Person.new
Person.new
Person.total_people             # => 2

bob = Person.new
bob.total_people                # => 3

joe = Person.new
joe.total_people                # => 4

Person.total_people             # => 4


## Constant Variable Scope

Constant variables are usually just called constants, because you're not supposed to re-assign them to a different value. If you do re-assign a constant, Ruby will warn you (but won't generate an error). Constants begin with a capital letter and have lexical scope. Lexical scope means that where the constant is defined in the source code determines where it is available. When Ruby tries to resolve a constant, it searches lexically — that is, it searches the surrounding structure (ie, lexical scope) of the constant reference.

class Person
  GREETINGS = ['Hello', 'Hi', 'Hey']

  def self.greetings
    GREETINGS.join(', ')
  end

  def greet
    GREETINGS.sample
  end
end

puts Person.greetings          # => "Hello, Hi, Hey"
puts Person.new.greet          # => "Hi" (output may vary)

Let's modify this example. This time, let's have the Person class exist in an ElizabethanEra module for namespacing purposes.

module ElizabethanEra
  GREETINGS = ['How dost thou', 'Bless thee', 'Good morrow']

  class Person
    def self.greetings
      GREETINGS.join(', ')
    end

    def greet
      GREETINGS.sample
    end
  end
end

puts ElizabethanEra::Person.greetings # => "How dost thou, Bless thee, Good morrow"
puts ElizabethanEra::Person.new.greet # => "Bless thee" (output may vary)

GREETINGS can still be resolved in both methods because it's available lexically.


When trying to reference a constant from an unconnected class though, a NameError is thrown as the class is not part of the lexical search, and consequently, not included in the constant lookup path.

class Computer
  GREETINGS = ["Beep", "Boop"]
end

class Person
  def self.greetings
    GREETINGS.join(', ')
  end

  def greet
    GREETINGS.sample
  end
end

puts Person.greetings # => NameError
puts Person.new.greet # => NameError

Unlike class or instance variables, we can actually reach into the Computer class and reference the GREETINGS constant. 

class Person
  def self.greetings
    Computer::GREETINGS.join(', ')
  end

  def greet
    Computer::GREETINGS.sample
  end
end

