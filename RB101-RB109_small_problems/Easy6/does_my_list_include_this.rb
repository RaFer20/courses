# def include?(arr, srch)
#   arr.any?(srch)
# end

#or

def include?(arr, srch)
  result = arr.select do |v|
            v == srch
  end
 if result == []
  return false
 else
  result.pop == srch
 end
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
