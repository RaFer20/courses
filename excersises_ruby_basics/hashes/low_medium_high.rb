numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select do |x, y|
  y < 25
end

p low_numbers