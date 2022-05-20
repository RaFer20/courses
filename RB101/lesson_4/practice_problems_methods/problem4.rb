# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value # this is making the first character of the string the "key"
end

# => { "a" => "ant", "b" => "bear", "c" => "cat" }