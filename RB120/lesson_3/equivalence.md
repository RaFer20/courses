A string is equal to another string of the same value. 
An integer is equal to another integer of the same value. 
A symbol is equal to another symbol of the same value.

str1 = "something"
str2 = "something"
str1 == str2            # => true

int1 = 1
int2 = 1
int1 == int2            # => true

sym1 = :something
sym2 = :something
sym1 == sym2            # => true

Consider that a string literal is just an object of the String class.

str1 = "something"
str2 = "something"

str1.class              # => String
str2.class              # => String

This means that if we modify str1, it would have no effect on the str2 object; they are different objects.

str1 = str1 + " else"
str1                    # => "something else"

str1 == str2            # => false

So when we compare str1 with str2 using ==, the string objects somehow know to compare their values, even though they're different objects. What we're asking is "are the values within the two objects the same?" and not "are the two objects the same?".

Suppose we care about whether the two variables actually point to the same object? That's where another method comes in: the equal? method

str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false


## The `==` method
== is not an operator in Ruby, like the = assignment operator. Instead, it's actually an instance method available on all objects. Ruby gives the == method a special syntax to make it look like a normal operator.

The original == method is defined in the BasicObject class, which is the parent class for all classes in Ruby. This implies every object in Ruby has a == method. However, each class should define the == method to specify the value to compare.


class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => false

bob_copy = bob
bob == bob_copy            # => true

This implies that the default implementation for == is the same as equal? (which is also in the BasicObject class). It's not very useful, because when we use ==, we don't actually want to ask "are the two variables pointing to the same object?", and instead, we want to ask "are the values in the two variables the same?". To tell Ruby what "the same" means for a Person object, we need to define the == method.

class Person
  attr_accessor :name

  def ==(other)
    name == other.name     # relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => true


Now that you understand == is just a method, this code makes more sense:
45 == 45.00  # => true
You should also realize that 45 == 45.00 is not the same as 45.00 == 45. The former is calling Integer#== while the latter is calling Float#==. Thankfully, the creator of those methods took time to make the interface consistent.

One final note: when you define a == method, you also get the != for free.


## `object.id`
Every object has a method called object_id, which returns a numerical value that uniquely identifies the object. We can use this method to determine whether two variables are pointing to the same object.

str1 = "something"
str2 = "something"

str1.object_id            # => 70186013144280
str2.object_id            # => 70186013536580
################################################
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => false

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => true

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => true

If two symbols or two integers have the same value, they are also the same object. This is a performance optimization in Ruby, because you can't modify a symbol or integer. This is also why Rubyists prefer symbols over strings to act as hash keys: it's a slight performance optimization and saves on memory.


## `===` method

A good example of seeing === in action is when we have ranges in a when clause.
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end

Behind the scenes, the case statement is using the === method to compare each when clause with num. In this example, the when clauses contain only ranges, so Range#=== is used for each clause. Typically, you do not have to define your own === behavior, as you likely wouldn't use your custom classes in a case statement. It's sometimes useful to remember that === is used for comparison in case statements, though.
##############
num = 25

if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end
##############
In this example, the === method is invoked on a range and passes in the argument num. Now, === doesn't compare two objects the same way that == compares two objects. When === compares two objects, such as (1..50) and 25, it's essentially asking "if (1..50) is a group, would 25 belong in that group?"

Sidenote: the === operator in JavaScript is very different from its method in Ruby.


## `eql?` method
The eql? method determines if two objects contain the same value and if they're of the same class. This method is used most often by Hash to determine equality among its members. It's not used very often.