# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys
# and the values are the positions in the array.

# flintstones_hash = {}
# flintstones.each_with_object({}) do |name, hash|
#   flintstones_hash[name] = flintstones.index(name)
# end

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

flintstones.map!.with_index do |name, idx|
  [name, idx]
end.to_h

p flintstones
# puts flintstones_hash