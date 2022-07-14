# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the number of characters in the string that are lowercase letters, 
# one the number of characters that are uppercase letters, 
# and one the number of characters that are neither.

UPPERCASE = ("A".."Z").to_a
LOWERCASE = ("a".."z").to_a

def lowercase?(str)
  LOWERCASE.include?(str)
end

def uppercase?(str)
  UPPERCASE.include?(str)
end

def letter_case_count(str)
  chars_array = str.chars
  letter_count = {lowercase: 0, uppercase: 0, neither: 0}

  chars_array.each do |char|
    if lowercase?(char)
       letter_count[:lowercase] +=1
    elsif uppercase?(char)
      letter_count[:uppercase] += 1
    else
      letter_count[:neither] += 1
    end
  end

  letter_count
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }