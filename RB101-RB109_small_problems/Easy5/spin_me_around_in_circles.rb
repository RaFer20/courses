# You are given a method named spin_me that takes a string as an argument and returns 
# a string that contains the same words, but with each word's characters reversed.
# Given the method's implementation, will the returned string be the same
# object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"

str = "hello world"
puts str.object_id 
puts spin_me(str).object_id 


# It returns a different object than the one passed because we split the string into an array and back into a new string.