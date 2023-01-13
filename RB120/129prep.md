# **Specific Topics of Interest**  6, 9, 20, 31, 37
-Classes and objects *
-Use attr_* to create setter and getter methods *
-How to call setters and getters *
-Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope *
-Instance methods vs. class methods *
-Method Access Control *
-Referencing and setting instance variables vs. using getters and setters *
-Class inheritance, encapsulation, and polymorphism *
-Modules *
-Method lookup path *
-self *
  -Calling methods with self
  -More about self
-Reading OO code -
-Fake operators and equality *
-Working with collaborator objects *
-Exceptions


# puts has a 2 step Process:
  # - it invokes `to_s` on the argument passed to it
  # - then it prints the result of step to the console.

## **Pillars of OOP**
# *Classes and objects*

*Classes*
Ruby defines the attributes and behaviors of its objects in classes. **We can think of classes as basic outlines of what an object should be made of and what it should be able to do.** To define a class, we use syntax similar to defining a method. We replace the def with class and use the CamelCase naming convention to create the name.

We then use the reserved word end to finish the definition. Ruby file names should be in snake_case, and reflect the class name

*Objects*
Objects are created from classes. Individual objects will contain different information(state) from other objects, yet they are instances of the same class. **We can think of an object as a single unit of code that encapsulates state and has behaviors; this allows us to write code that doesn't interfere with the rest of our codebase and any changes in the state(attributes) or behavior(methods) of the same objects wouldn't have any repercussions the rest of our codebase.**

# *Class inheritance, encapsulation, and polymorphism*

# *Encapsulation*
Encapsulation is a form of data protection that allows us to encapsulate behaviours(instance methods in classes) along with state(sum of single/multiple collaborator objects(s) assigned to instance variables(attributes)) in a single unit(object/instance) without being exposed, connected to or interdependent on a function or part of the public/private codebase.

**a form of data protection that allows us to encapsulate behaviours(instance methods in classes) along with state(sum of single/multiple collaborator objects(s) assigned to instance variables(attributes)) in a single unit(object/instance) making it unavailable to the rest of the code base.**

benefits:
- mantainability
- reducing complexity
- increase usability

################################################################################################################################################
# *Inheritance*
Inheritance: When a class inherits behaviors from a superclass # not indepth enough

Inheritance allows us to write less code by encapsulating common behaviours that are used frequently into a super class and make other classes inherit those functionalites (instance methods) through inheritance.
This effectively allows us to write less repetitive (DRY) code

This gives Ruby programmers the power to define basic classes with large reusability and smaller subclasses for more fine-grained, detailed behaviors.
################################################################################################################################################
# *Polymorphism*
polymorphism: the ability of different object types to respond to the same method invocation.
It is the ability for different types of data to respond to a common interface.

polymorphism can be achieved through 3 different approaches:
- class inheritance
- mixin or interface inheritance *
- duck typing

(to_s is an example of polymorphism)
---------------------------------------------------------
## *Polymorphism through inheritance:*
```ruby
class Animal
  def speak
  end
end

class Dog < Animal
  def speak
    "bark!"
  end
end

class Cat < Animal
  def speak
    "meow!"
  end
end

class Spider < Animal; end
```
---------------------------------------------------------
## *Polymorphism through mixin module*
```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class Dog
  include Speak
end

class Person
  include Speak
end

spike = Dog.new
spike.speak("Woof!")        # => "Woof!"
bob = Person.new
bob.speak("I am a person and I can speak")         # "I am a person and I can speak"
```
---------------------------------------------------------
## *Polymorphism through Ducktyping*
```ruby
class Person
  def walk
    "walks on two legs"
  end

  def say_something
    "Hello"
  end
end

class Dog
  def walk
    "walks on four legs"
  end

  def say_something
    "Bark"
  end
end

class Cat
  def walk
    "walks on four legs"
  end

  def say_something
    "Meow"
  end
end

class Insect
  def walk
    "walks on six legs"
  end

  def say_something
    "tick tack"
  end
end
```
################################################################################################################################################
# *The instance method look up path:*
  - class from which the object is instantiated
  - if there are one or more modules included
   - suppose we have a class that includes 3 modules
    - the last included module will be looked up/checked first
    - the second to last module is checked second
    - the first included module will be checked last
  - super class will be checked after that
  - the super class of the super class
  - all the way up to BasicObject

################################################################################################################################################
# *Use `attr_*` to create setter and getter methods*/*How to call setters and getters*

The `attr_accessor` method creates setter and getter methods for us.
We can use `attr_reader` if we only want the getter method.
We can use `attr_writer` if we only want the setter method.

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    "My name is #{name}"  # we're calling our getter method
  end

  def change_info(n, a)
    self.name = n         # we're calling our setter method.
    self.age = a
  end
end
```
A `setter` method can help validate or format the argument passed to it before setting the instance variable:
For example if we're setting a name and we want it to always be capitalized:

```ruby
def name=(name)
  @name  = name.capitalize
end
```

If I want to display to the user the last four digits of a credit card number without displaying the whole thing we 
could define a `getter` method that splits the numbers on every `-` and display only the last element of the array returned
For example:

```ruby
def cc_last_4
 "****-****-****-" + @ccn.split("-").last
end
```

################################################################################################################################################
# *Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope*

## *Instance Variables:*
It is a variable that exists as long as the object instance exists and it is one of the ways we tie data to objects. It does not "die" after the initialize method is run. It "lives on", to be referenced, until the object instance is destroyed.
*Instance variables are responsible for keeping track of information about the state of an object.*
Every object's state is distinct, and instance variables are how we keep track.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

Instance variables are scoped at the object level. They do not cross over between objects.
This means that the instance variable is accessible in an object's instance methods, even if it's initialized outside of that instance method.

If you try to reference an uninitialized instance variable, you get `nil`, unlike local variables which would raise a `NameError`

Initializing an instance variable at the class level will give us a class instance variable.

## *Class Variables*
Just as instance variables capture information related to specific instances of classes, we can create variables for an entire class that are named class variables. Class variables are created using two @ symbols.

```ruby
class Person
  @@number_of_people = 0

  def initialize
    @@number_of_people += 1
  end

  def self.total_number_of_people
    @@number_of_people
  end
end

puts Person.total_number_of_people  #=> 0
steve = Person.new
puts Person.total_number_of_people  #=> 1
```

Class variables are scoped at the class level. They exhibit two main behaviors:
- All objects share 1 copy of the class variable. (This also implies objects can access class variables by way of instance methods.)
- Class methods can access a class variable provided the class variable has been initialized prior to calling the method.

Class variables allow sub-classes to override a super-class class variables, which will affect all other sub-classes of the superclass.
Because of this, we should avoid using class variables when working with inheritance.

## *Constants*

Constants are variables we don't want to change. Ruby will give us a warning for trying to re-assign the value of a constant.(but it will not generate an error)

You define a constant by using an upper case letter at the beginning of the variable name. While technically constants just need to begin with a capital letter, most Rubyists will make the entire variable uppercase.

Constants have lexical scope.
Lexical scope means that where the constant is defined in the source code determines where it is available. When Ruby tries to resolve a constant, it searches lexically — that is, it searches the surrounding structure (ie, lexical scope) of the constant reference.

Ruby attempts to resolve a constant by searching lexically of the reference, then by inheritance of the enclosing class/module, and finally the top level.

```ruby
module EncapsulatingScope
  DOG_YEARS = 7
  
  class GoodDog
    attr_accessor :name, :age

    def initialize(n, a)
      self.name = n
      self.age  = a * DOG_YEARS
    end
  end
end

sparky = EncapsulatingScope::GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
```

```ruby
class Dog
  DOG_YEARS = 5
end

module EncapsulatingScope  
  class GoodDog < Dog
    attr_accessor :name, :age

    def initialize(n, a)
      self.name = n
      self.age  = a * DOG_YEARS
    end
  end
end

sparky = EncapsulatingScope::GoodDog.new("Sparky", 4)
puts sparky.age             # => 20
```
################################################################################################################################################
# *Instance methods vs. class methods*

A class method uses `self` on the class definition to let ruby know the method is meant to be called on the class.
Class methods can be called without the need to instantiate an object since they're called directly on the class.
Class methods are where we put functionality that does not pertain to individual objects.

```ruby
class FileSystem
  def self.size
    # some code here
  end
end
```

An instance method on the other hand is called on an object instead. (an instance of the class)

```ruby
class Person

  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end

  def profession
    @profession
  end

  def name
    @name
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end
end
```

################################################################################################################################################
# *Method Access Control*

Access Control is a concept that exists in a number of programming languages, including Ruby. It is generally implemented through the use of `access modifiers`. *The purpose of access modifiers is to allow or restrict access to a particular thing.* In Ruby, the things that we are concerned with restricting access to are the methods defined in a class.

Access modifiers:
## *Public*
A public method is a method that is available to anyone who knows either the class name or the object's name. These methods are readily available for the rest of the program to use and comprise the class's interface.

## *Private*
private methods are only accessible from other methods in the class.

## *Protected*
Protected methods are similar to private methods in that they cannot be invoked outside the class. The main difference between them is that protected methods allow access between class instances, while private methods do not.

```ruby
class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age     # `age` is accessible by another `Person` object
  end

  protected

  attr_reader :age
end
```

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)         # public method, can be accessed outside the class
    age > other_person.age    # is allowed access to another instance's `age` trough the `protected` access modifier.
  end

  def update_age(new_number)  # public method, can be accessed outside the class
    self.age = new_number
  end

  private

  attr_writer :age            # only accessible to the current object within the class definition.
  
  protected

  attr_reader :age            # `age` cannot be called outside the class but other instances of `Person` can invoke it.
end

bob = Person.new("Bob", 18)
george = Person.new("George", 21)

puts bob > george # False
puts bob.update_age(25)
puts bob > george # True
```
################################################################################################################################################
# *Referencing and setting instance variables vs. using getters and setters*

Technically, you could just reference the instance variable, but it's generally a good idea to call the getter method instead. 
If we define a getter or setter method that adds any extra functionality to the method(for example: validate the data being set, or hide part of the state we're referencing.) we should call the getter/setter method.

*Setter methods always return the value that is passed in as an argument, regardless of what happens inside the method. If the setter tries to return something other than the argument's value, it just ignores that attempt.*

```ruby
class Person
  def name=(n)
    @name = n
    "Bob"              # value will be ignored
  end
end

john = Person.new()
puts(john.name = "John")  # returns "John"
```
################################################################################################################################################
# *Modules*

**Modules are a way of grouping together methods, classes, and constants. Modules give you two major benefits.**
- **Modules provide a namespace and prevent name clashes.**
- **Modules implement the mixin facility.**

Modules define a namespace, a sandbox in which your methods and constants can play without having to worry about being stepped on by other methods and constants.


*A module is a collection of behaviors that is usable in other classes via mixins.* A module is "mixed in" to a class using the include method invocation.
A Module is a collection of methods and constants. The methods in a module may be instance methods or module methods. Instance methods appear as methods in a class when the module is included, module methods do not. Conversely, module methods may be called without creating an encapsulating object, while instance methods may not. 
Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design.


## The next use case is using modules for namespacing. In this context, namespacing means organizing similar classes under a module. In other words, we'll use modules to group related classes.
```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```
We call classes in a module by appending the class name to the module name with two colons(::) (namespace resolution operator)
example: Module::Class.new
```ruby
# an example of namespacing
module Vehicles
  class Car; end
  class Truck; end
end

module Toys
  class Car; end
  class Truck; end
end
```
```ruby
module ElementarySchool
  class Teacher
    def teach
      puts "A B C D"
    end
  end

  class Principal; end

  class Student; end
end

module MiddleSchool
  class Teacher
   def teach
     puts "Long division"
   end
  end

  class Principal; end

  class Student; end
end

module HighSchool
  class Teacher
    def teach
      puts "Advanced Chem"
    end
  end

  class Principal; end

  class Student; end
end

ElementarySchool::Teacher.new.teach
```

## Another use case for modules is using modules as a container for methods, called module methods. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code.

```ruby
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)
# OR (both work but the former is the preferred way.)
value = Mammal::some_out_of_place_method(4)
```
################################################################################################################################################
# *Self*
`self` is a reserved Ruby keyword.
`self` is a way of being explicit about what our program is referencing and what our intentions are as far as behavior. `self` changes depending on the scope it is used in.
the general rule from the Ruby style guide is to "Avoid `self` where not required."

## *Calling methods with self*
`self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`, in our example.

`self`, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a name class method, def `self.name=(n)` is the same as def `GoodDog.name=(n)`

## *More about self*
`self` refers to the calling object or class.
- If called inside an instance method it refers to an instance of the class.
- If called inside the class but outside of an instance method it refers to the class.
- If we prepend a method name with `self` we define a class method.

################################################################################################################################################
# *Fake operators and equality*

*==*
`==` is not an operator in Ruby, like the = assignment operator. Instead, it's actually an instance method available on all objects. Ruby gives the `==` method a special syntax to make it look like a normal operator.

The original `==` method is defined in the `BasicObject` class, which is the parent class for all classes in Ruby. This implies every object in Ruby has a `==` method. However, each class should define the `==` method to specify the value to compare.

the default implementation for `==` is the same as `equal?` (which is also in the BasicObject class). It's not very useful, because when we use `==`, we don't actually want to ask "are the two variables pointing to the same object?", and instead, we want to ask "are the values in the two variables the same?". 

By defining a `==` method  we're overriding the default `BasicObject#==` behavior, and providing a much more meaningful way to compare two objects. Incidentally, you can do this with `<` and `>` as well, as those are also instance methods, and not built-in Ruby operators.

Almost every Ruby core library class will come with its own `==` method. Therefore, you can safely use `==` to compare Array, Hash, Integer, String and many other objects. But just remember there's a method somewhere backing that equality comparison, and so it can be modified.

When you define a `==` method, you also get the `!=` for free.

*===*
When `===` compares two objects, such as `(1..50)` and `25`, it's essentially asking "if `(1..50)` is a group, would `25` belong in that group?" In this case, the answer is "yes".

-----------------------------------------------------------------------------------------------------------------------------------------------
*Important*
- for most objects, the `==` operator compares the values of the objects, and is frequently used.

- the `==` operator is actually a method. Most built-in Ruby classes, like Array, String, Integer, etc. provide their own == method to specify how to compare objects of those classes.

- by default, `BasicObject#==` does not perform an equality check; instead, it returns true if two objects are the same object. This is why other classes often provide their own behavior for `#==`.

- if you need to compare custom objects, you should define the `==` method.



-----------------------------------------------------------------------------------------------------------------------------------------------
*Equality Methods*
```ruby
class Foo
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    value == other.value
  end

  def !=(other)
    value == other.value
  end
end
```

*Comparison Methods*
```ruby
class Person
  # ... rest of code omitted for brevity

  def >(other_person)
    age > other_person.age
  end
end
```

*Shift Methods*
```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end
```

*Plus Method*  ### **we should try to match the general pattern from the standard library and return an object of the same class**
```ruby
class Team
  # ... rest of class omitted for brevity

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team   ### Here we are returning a `Team` object
  end
end
```

```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    temp = AnimalClass.new
    temp.animals = animals + other_class.animals
    temp
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end
```

*Setter and Getter Methods*
```ruby
class Team
  # ... rest of code omitted for brevity

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end
```


**We can add the `Comparable` module and define a `<=>` method(to specify what to compare) to include most of these methods.**


################################################################################################################################################
# *Working with collaborator objects*

Instance variables can hold any object, not only strings and integers. It can hold data structures, like arrays or hashes. Instance variables can be set to any object, even an object of a custom class we've created.

Collaborator objects are objects that are stored as state within another object. Collaborator objects allow you to chop up and modularize the problem domain into cohesive pieces; they are at the core of OO programming and play an important role in modeling complicated problem domains.

```ruby
class Person
  def initialize(name)
    @name = name # whatever value we assign to `@name` is considered a collobarator obj
  end
end
```

################################################################################################################################################
```ruby
p self # main
p self.class # Object


class Object
end


environment = Object.new

environment // all code in this pad is handled by the environment variable
```
################################################################################################################################################
**Exceptions**
```ruby
begin
  # some code at risk of failing
rescue TypeError
  # take action
rescue ArgumentError
  # take a different action
end
```

```ruby
begin
  # code at risk of failing here
rescue StandardError => e   # storing the exception object in e
  puts e.message            # output error message
end
```

```ruby
file = open(file_name, 'w')
begin
  # do something with file
rescue
  # handle exception
rescue
  # handle a different exception
ensure
  file.close
  # executes every time
end
```

In addition to providing many built-in exception classes, Ruby allows us the flexibility to create our own custom exception classes.

class ValidateAgeError < StandardError; end

This means that ValidateAgeError has access to all of the built-in exception object behaviors Ruby provides, including Exception#message and Exception#backtrace.

When using a custom exception class, you can be specific about the error your program encountered by giving the class a very descriptive name. Doing so may aid in debugging. 

```ruby
def validate_age(age)
  raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
end
begin
  validate_age(age)
rescue ValidateAgeError => e
  # take action
end
```
################################################################################################################################################
