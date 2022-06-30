=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns
 a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees,
  a single quote (') to represent minutes, and a double quote (") to represent seconds. 
A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"
=end
 
def dms(num)
  float = num.to_f

  str_flt = if float >= 361
              loop do
                float -= 360
                break if float <= 360
              end
              float
            elsif float.negative?
              loop do
                float += 360
                break if float >= 0
              end
              float 
            else
              float
            end.to_s

  flt_arr = str_flt.partition('.')
  min_decimal = ((flt_arr[1] << flt_arr[2]).to_f * 60).to_s
  min_arr = min_decimal.partition('.')
  minute = min_arr.first
  second = ((min_arr[1] << min_arr[2]).to_f * 60).to_i.to_s

  minute.prepend('0') if minute.chars.length == 1
  second.prepend('0') if second.chars.length == 1

  %(#{flt_arr.first}°#{minute}'#{second}")
end

 # p dms(30) == %(30°00'00")
 # p dms(76.73) == %(76°43'48")
 # p dms(254.6) == %(254°36'00")
 # p dms(93.034773) == %(93°02'05")
 # p dms(0) == %(0°00'00")
 # p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")