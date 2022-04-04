def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# times still returns the initial integer but nothing is done
# with the return value.