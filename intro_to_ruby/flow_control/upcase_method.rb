# upcase_method.rb

def caps(words)
  if words.length > 10
    words.upcase
  else
    words
  end
end

puts caps("Hello")
puts caps("Greetings Traveler!")