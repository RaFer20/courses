# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.

puts ages.include?("spot")

puts ages.has_key?("spot")

puts ages.key?("spot")

puts ages.member?("spot")