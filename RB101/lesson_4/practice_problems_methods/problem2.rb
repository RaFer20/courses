# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# With a block given, calls the block with each element
# and returns the number of elements for 
# which the block returns a truthy value.