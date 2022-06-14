name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

# It prints out `BOB` twice, `name` and `save_name` are both pointing to the same object in memory,
# since `upcase!` is a mutating method both `name` and `save_name` would be affected by it.