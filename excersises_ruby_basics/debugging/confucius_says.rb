def get_quote(person)
  if person == 'Yoda'
   return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
   return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
   return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Yoda') + '"'

# Adding explicit return values fixes the problem

# the solution (taken from the excersise) below uses an elsif statement instead
=begin
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
=end