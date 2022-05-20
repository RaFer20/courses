=begin Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
put ! before something, like !user_name
put ! after something, like words.uniq!
put ? before something
put ? after something
put !! before something, like !!user_name =end

=begin 
'!' usually mutates the caller and '?' is often used in methods that
return a boolean but that's not always the case. Any method could be defined
with a '!' or a '?' in its name.

1. =! means "not equal to" and its used when comparing two values

2. '!' before an object will return the opposite of its boolean value

3. '!' after some methods will make them mutate the original value insted
of creating a new one. it's also just part of a method's name.

4. '?' can be used as the ternary operator for if/else.
example  a ? b : c

5. '?' is often used in method names that return a boolean value

6. '!!' is used to turn an object into its boolean value

=end