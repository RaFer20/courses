count = 1

loop do
  if count.odd?
    puts "#{count} is an odd number"
  else
    puts "#{count} is an even number"
  end
  
  break if count == 5
  count +=1
end