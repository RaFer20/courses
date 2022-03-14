# excersise14.rb

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

arr = a.map {|x| x.split.flatten}
puts arr