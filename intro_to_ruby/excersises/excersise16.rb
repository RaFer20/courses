# excersise16.rb (challenge)

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
keys = [:email, :address, :phone]

contacts.each do |name, info|
  keys.each do |key|
  info[key] = contact_data.shift
  end
end

puts contacts

# rewrote this with my words after seeing the solution in the book
#I'll revisit this in the future