# Excersise1

arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |x|
  if x == number
    puts " #{number} is included in the array"
  end
end

# added solution as an example in case i look back at this
if arr.include?(number)
  puts "#{number} is indeed in the array."
end