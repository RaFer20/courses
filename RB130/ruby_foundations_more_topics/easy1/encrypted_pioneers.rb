=begin
The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant
influence on the field.
The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Write a program that deciphers and prints each of these names .
=end

pioneers = ["Nqn Ybirynpr",
"Tenpr Ubccre",
"Nqryr Tbyqfgvar",
"Nyna Ghevat",
"Puneyrf Onoontr",
"Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
"Wbua Ngnanfbss",
"Ybvf Unvog",
"Pynhqr Funaaba",
"Fgrir Wbof",
"Ovyy Tngrf",
"Gvz Orearef-Yrr",
"Fgrir Jbmavnx",
"Xbaenq Mhfr",
"Fve Nagbal Ubner",
"Zneiva Zvafxl",
"Lhxvuveb Zngfhzbgb",
"Unllvz Fybavzfxv",
"Tregehqr Oynapu"].freeze

ABC = ("a".."z").to_a
def deciphers_rot13(array)
  deciphered = []
  hash = {}
  counter = 0
  ABC.each_with_index{|letter, idx| hash[letter] = idx < 13 ? ABC[idx+13] : ABC[idx-13]}

  array.each do |name|
    name = name.downcase
    decoded_name = ''
    name.each_char do |char|
      if !hash[char]
        decoded_name += char 
      else
        decoded_name << hash[char]
      end
    end
    deciphered << decoded_name.split.map(&:capitalize).join(' ')
  end
  deciphered
end

puts deciphers_rot13(pioneers)


# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end