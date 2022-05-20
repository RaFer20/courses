# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# take will return the first 'n' elements, in this case [1, 2]
# by testing it in irb we can test if take is destructive or not
# it is not destructive