def generate_UUID
  hex_values = (0..9).to_a + ("a".."f").to_a
  sec1 = ''
  sec2 = ''
  sec3 = ''
  sec4 = ''
  sec5 = ''
  uuid = "#{sec1}-#{sec2}-#{sec3}-#{sec4}-#{sec5}"

  until sec1.size == 8
    sec1 << hex_values.sample.to_s
  end
  until sec2.size == 4
    sec2 << hex_values.sample.to_s
  end
  until sec3.size == 4
    sec3 << hex_values.sample.to_s
  end
  until sec4.size == 4
    sec4 << hex_values.sample.to_s
  end
  until sec5.size == 12
    sec5 << hex_values.sample.to_s
  end
  uuid = "#{sec1}-#{sec2}-#{sec3}-#{sec4}-#{sec5}"
  uuid
end

# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end

p generate_UUID