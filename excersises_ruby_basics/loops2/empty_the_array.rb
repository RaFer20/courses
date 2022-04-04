names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift #removes and returns the first element
  break if names.size == 0 #could also use .empty?
end

#to do it backwards
#loop do
#  puts names.pop
#  break if names.size == 0
#end