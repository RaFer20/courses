=begin
Using the following code, determine the lookup path used when invoking cat1.color.
Only list the classes and modules that Ruby will check when searching for the #color method.
=end

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
#cat1.color
p Cat.ancestors

# It will search through all of them and won't find the method
# Cat
# Animal
# Object
# Kernel
# BasicObject