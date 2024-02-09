=begin
Write a method that takes an optional block. If the block is specified, the method should execute it,
and return the value returned by the block.
If no block is specified, the method should simply return the String 'Does not compute.'.

Examples:
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

=end

def compute
  block_given? ? yield : "Does not compute."
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further Exploration
# Modify the compute method so it takes a single argument and yields that argument to the block.
# Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(argument)
  block_given? ? yield(argument) : "Does not compute."
end

p compute(10){|num| num + 10} == 20
p compute('String'){|str| str} == 'String'
p compute(20) == 'Does not compute.'