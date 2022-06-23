# Further Exploration from "convert_string_to_number.rb"

# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

def hexadecimal_to_integer(str)
  str.hex
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('-1234') == -4660