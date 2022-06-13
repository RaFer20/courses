# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.


# (1..99).each {|n| if n.odd? then puts n end}

# array = (1..99).to_a.select do |n|
#          n.odd?
#         end
# puts array

a = []
1.upto(99) {|n| a << n if n.odd? }
puts a