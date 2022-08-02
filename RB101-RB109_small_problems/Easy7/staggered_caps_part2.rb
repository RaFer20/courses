=begin
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining
whether it should uppercase or lowercase each letter. 
The non-alphabetic characters should still be included in the return value; 
they just don't count when toggling the desired case.
=end

ALPHABETICAL = ('A'..'Z').to_a + ('a'..'z').to_a

def staggered_case(str)
  new_str = ''
  str.chars.each_with_index do |char, index|
    if ALPHABETICAL.include?(char) && index.even?
      new_str << char.upcase
    elsif ALPHABETICAL.include?(char)
      new_str << char.downcase
    else
      new_str << char
    end
  end
  new_str
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'