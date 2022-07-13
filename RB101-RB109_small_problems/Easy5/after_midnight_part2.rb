=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes
before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def before_midnight(time)
  time_array = time.split(':')
  hours = time_array.first.to_i
  minutes = time_array.last.to_i
  minutes_before = MINUTES_PER_DAY - ((hours * MINUTES_PER_HOUR) + minutes)

  while minutes_before >= MINUTES_PER_DAY
    minutes_before -= MINUTES_PER_DAY
  end

  minutes_before
end

def after_midnight(time) 
  time_array = time.split(':')
  hours = time_array.first.to_i
  minutes = time_array.last.to_i
  
  minutes_after = (hours * MINUTES_PER_HOUR) + minutes

  while minutes_after >= MINUTES_PER_DAY
    minutes_after -= MINUTES_PER_DAY
  end

  minutes_after
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0