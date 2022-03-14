# excersise9.rb

#1. Get the value of key `:b`.
#2. Add to this hash the key:value pair `{e:5}`
#3. Remove all key:value pairs whose value is less than 3.5

h = {a:1, b:2, c:3, d:4}

puts h[:b] #1

h[:e] = 5 #2
puts h 

h.delete_if {|k, v| v < 3.5}

puts h