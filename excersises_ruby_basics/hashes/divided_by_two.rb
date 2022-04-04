numbers = {
  high:   100,
  medium: 50,
  low:    10
}

half_numbers = numbers.map do |x, y|
  y / 2
end

p half_numbers