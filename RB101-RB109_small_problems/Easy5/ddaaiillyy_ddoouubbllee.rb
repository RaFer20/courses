# Write a method that takes a string argument and returns a new string that contains the value of the original 
# string with all consecutive duplicate characters collapsed into a single character.
# You may not use String#squeeze or String#squeeze!.

def crunch(str)
  new_str = []
  word_chars = str.split.map{|word| word.chars}
  word_chars.map do |word|
    word << ' '
    word.each do |letter|
      if new_str.last == letter
        next
      else
        new_str.push(letter)
      end
    end
  end
  new_str.join.chop
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''