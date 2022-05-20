def digit_list(x)
  x.to_s.chars.map(&:to_i)
end

puts digit_list(12345)    
puts digit_list(7)            
puts digit_list(375290) 
puts digit_list(444)    