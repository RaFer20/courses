def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |x|
    x.downcase!
    occurrences[x] = array.count(x)
  end

  occurrences.each {|x, count| puts "#{x}: #{count}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)