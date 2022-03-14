# hashvk_ex3.rb

hash = {one: "1", two: "2", three:"3", four: "4"}

hash.each_key {|k| puts k}
hash.each_value {|v| puts v}
hash.each {|k, v| puts "#{k} and #{v}" }