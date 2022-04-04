def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1 # product on line 6 was being multiplied by 0

  digits.each do |digit|
    product *= digit # product = product * digit
  end

  product
end


p digit_product('12345')

# 1*2*3*4*5