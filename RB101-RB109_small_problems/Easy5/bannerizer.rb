# Write a method that will take a short line of text, and print it within a box.

def prin_in_box(str)
  length = str.length
  spaces = ''
  dashes = ''
  length.times {|_| spaces << ' '}
  length.times {|_| dashes << '-'}
  puts "+-#{dashes}-+"
  puts "| #{spaces} |"
  puts "| #{str} |"
  puts "| #{spaces} |"
  puts "+-#{dashes}-+"
end
 

prin_in_box('Hello World!')
prin_in_box('This message is longer than the previous one!')