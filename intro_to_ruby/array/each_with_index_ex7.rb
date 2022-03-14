# each_with_index_ex7

arr = ["zero", "one", "two", "three", "four", "five", "six", "seven"]

arr.each_with_index do |x, idx| 
  puts "#{idx}. #{x}"
end