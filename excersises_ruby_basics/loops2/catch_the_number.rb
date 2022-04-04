loop do
  number = rand(100)
  puts number
  if number <= 10
    break
  end
end

#can also use .between?(0, 10)