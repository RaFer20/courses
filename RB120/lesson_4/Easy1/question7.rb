# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# The default to_s prints the object's class and an encoding of the object id.
# We can find out about this in the documentation for the class `Object`