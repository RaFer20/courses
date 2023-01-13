

Method	Operator	                                       Description
no	    ., ::	                                       Method/constant resolution operators
yes	    [], []=	                                     Collection element getter and setter.
yes	    **	                                         Exponential operator
yes	    !, ~, +, -	                                 Not, complement, unary plus and minus (method names for the last two are +@ and -@)
yes	    *, /, %	                                     Multiply, divide, and modulo
yes	    +, -	                                       Plus, minus
yes	    >>, <<	                                     Right and left shift
yes	    &	                                           Bitwise "and"
yes	    ^, |	                                       Bitwise exclusive "or" and regular "or" (inclusive "or")
yes	    <=, <, >, >=	                               Less than/equal to, less than, greater than, greater than/equal to
yes	    <=>, ==, ===, !=, =~, !~	                   Equality and pattern matching (!= and !~ cannot be directly defined)
no	    &&	                                         Logical "and"
no	    ||	                                         Logical "or"
no	    .., ...	                                     Inclusive range, exclusive range
no	    ? :	                                         Ternary if-then-else
no	    =, %=, /=, -=, +=, |=, &=, >>=,              Assignment (and shortcuts) and block delimiter
        <<=, *=, &&=, ||=, **=, {	


The `.` and `::` resolution operators (e.g., dog.bark and Math::PI), are often omitted from Ruby documentation about operators. However, they are, indeed, operators, and have the highest precedence of all operators.


## Equality Methods
See equivalence.md

## Comparison Methods

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)        # Without defining this we would get a `NoMethodError` 
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older" if bob > kim            # => "bob is older"
puts "bob is older" if bob.>(kim)           # => "bob is older"

Note that defining > doesn't automatically give us <. If we were to write bob < kim, we'd get a NoMethodError.


## The << and >> shift methods

my_array = %w(hello world)
my_array << "!!"
puts my_array.inspect                       # => ["hello", "world", "!!"]
##############################

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

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier

cowboys << emmitt                           # will this work?

cowboys.members                             # => [#<Person:0x007fe08c209530>]


## The Plus Method

1 + 1                                       # => 2
1.+(1)                                      # => 2

So when should we write a + method for our own objects? Let's look at the standard library for some inspiration:

Integer#+: increments the value by value of the argument, returning a new integer
String#+: concatenates with argument, returning a new string
Array#+: concatenates with argument, returning a new array
Date#+: increments the date in days by value of the argument, returning a new date

The functionality of the + should be either incrementing or concatenation with the argument.

class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  <!-- def +(other_team)
    members + other_team.members  # this would return a new `Array` object, not a `Team` object
  end -->

    def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

 # we'll use the same Person class from earlier
cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = niners + cowboys
puts dream_team.inspect                     # => #<Team:0x007fac3b9eb878 @name="Temporary Team" ...



## Element setter and getter methods

my_array = %w(first second third fourth)    # ["first", "second", "third", "fourth"]
# element reference
my_array[2]                                 # => "third"
my_array.[](2)                              # => "third"

But Ruby goes even one step farther for Array#[]=.

# element assignment
my_array[4] = "fifth"
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth"]

my_array.[]=(5, "sixth")
puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth", "sixth"]



#########################################

class Team
  # ... rest of code omitted for brevity

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

Here, we're just taking advantage of the fact that @members is an array, so we can push the real work to the Array#[] and Array#[]= methods. After writing these two methods, we can:

# assume set up from earlier
cowboys.members                           # => ... array of 3 Person objects

cowboys[1]                                # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
cowboys[3] = Person.new("JJ", 72)
cowboys[3]                                # => #<Person:0x007fae9220fa88 @name="JJ", @age=72>