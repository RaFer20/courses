colors = 'blue pink yellow orange'

if colors.include?('yellow')
  puts 'true'
else
  puts 'false'
end

if colors.include?('purple')
  puts 'true'
else
  puts 'false'
end

#can be simplified to puts colors.include?('yellow')
#                     puts colors.include?('purple')

colors = 'blue boredom yellow'
puts colors.include?('red') 
# true because 'boredom' includes red