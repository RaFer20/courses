# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

puts flintstones.bsearch_index{|name| name.start_with?('Be')}

puts flintstones.index { |name| name[0, 2] == "Be" } 
#name[0, 2] searches 2 elements from index 0, in this case index 0 and 1 from each name
