=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative,the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

You may not use ruby's Date and Time classes.
=end
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
DAY_OF_WEEK = { # Further Exploration
  0 => 'Sunday', 1 => 'Monday', 2 => 'Tuesday',
  3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday',
  6 => 'Saturday', 7 => 'Sunday'
}

def time_of_day(num)
  hours, minutes = num.divmod(MINUTES_PER_HOUR)
  days, hours = hours.divmod(HOURS_PER_DAY)
  fhours = sprintf("%02d", hours)
  fminutes = sprintf("%02d", minutes)
  "#{fhours}:#{fminutes}"
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


# Further Exporation, Display day of the week

def time_of_day(num)
  hours, minutes = num.divmod(MINUTES_PER_HOUR)
  days, hours = hours.divmod(HOURS_PER_DAY)
  fhours = sprintf("%02d", hours)
  fminutes = sprintf("%02d", minutes)

  while days > 7
    days -= 7
  end
  while days < 0
    days += 7
  end

  weekday = DAY_OF_WEEK[days]

  "#{weekday} #{fhours}:#{fminutes}"
end

p time_of_day(0) 
p time_of_day(-3) 
p time_of_day(35) 
p time_of_day(-1437) 
p time_of_day(3000) 
p time_of_day(800) 
p time_of_day(-4231) 