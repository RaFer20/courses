# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo] would be printed out since `array1` and `array2` point to the same
# objects in memory, so mutating the values on either one would affect the other.

# Further exploration
# How can this feature of ruby get you in trouble? How can you avoid it?

# If you're not sure exactly what it is you are mutating you could end up mutating unexpected things.
# this can be avoided by understanding exactly what it is we are mutating, in this example whether it is the array itself
# or the elements within the array.