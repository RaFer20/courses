# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.reject!{|name, value| value >= 100}
ages.delete_if {|name, value| value >= 100}
# ages.keep_if { |name, age| age < 100 }
# ages.select! {|name, age| age < 100}

puts ages