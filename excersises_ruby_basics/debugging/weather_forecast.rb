def predict_weather
  sunshine = [true, false].sample

  if sunshine 
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather

=begin 
changed 'true' and 'false' from a string value to a 
boolean value
=end