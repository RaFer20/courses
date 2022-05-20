# def is_odd?(x)
#   if x % 2 != 0
#     true
#   else
#     false
#   end
# end

def is_odd?(x)
  if x.remainder(2) == 1 || x.remainder(2) == -1
    true
  else
    false
  end
end

puts is_odd?(2)   
puts is_odd?(5)
puts is_odd?(-17) 
puts is_odd?(-8) 
puts is_odd?(0)    
puts is_odd?(7)    

