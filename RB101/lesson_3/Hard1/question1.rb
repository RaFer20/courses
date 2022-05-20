# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# greeting is nil, no exception will be thrown since the 'if' block isn't getting executed.