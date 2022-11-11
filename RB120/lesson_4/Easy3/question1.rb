# If we have this code:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi
# The `hi` method in `Hello` would be called, which would call the `greet` method in `Greeting` with the string "Hello" as an argument
# "Hello" would be output

# case 2:
hello = Hello.new
hello.bye
# `NoMethodError` would be raised, the `Hello` class and `Greeting` superclass dont have a `bye` method

# case 3:
hello = Hello.new
hello.greet
# An exception (ArgumentError) would be raised, the `greet` method in `Greeting` expects one argument and we are passing it none.

# case 4:
hello = Hello.new
hello.greet("Goodbye")
# "Goodbye" would be output, the greet method will output any string passed to it.

# case 5:
Hello.hi
# An exception (NoMethodError) would be raised, we are calling an instance method on a class, not an instance of that class