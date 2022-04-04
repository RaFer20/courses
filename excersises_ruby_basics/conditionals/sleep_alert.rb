status = ['awake', 'tired'].sample

variable = if status == 'awake'
  "Be productive!"
else 
  "Go to sleep!"
end

puts variable