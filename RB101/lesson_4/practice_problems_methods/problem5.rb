# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# returns [a, 'ant'], a 2 elements array removed from the original hash
# now the hash contains only {b: 'bear'}

# this can be checked in the ruby docs for Hash#shift