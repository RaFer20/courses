#What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# reject will return an array of elements for which the
# block returns nil or false. 

# [1, 2, 3] since puts alway returns nil