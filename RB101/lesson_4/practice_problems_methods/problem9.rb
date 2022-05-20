# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# [nil, "bear"], When none of the conditions in an if statement
# evaluates as true, the if statement itself returns nil. 
# That's why we see nil as the first element 
# in the returned array.