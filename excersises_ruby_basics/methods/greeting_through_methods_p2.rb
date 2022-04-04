def hello
  'Hello'
end

def world
  'World'
end

def greet
  "#{hello} #{world}" #or hello + ' ' + world # => Hello World
end

puts greet