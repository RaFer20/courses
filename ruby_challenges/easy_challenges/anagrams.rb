class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    result = []
    array.each do |string|
      str = string.downcase
      next if @word == str
      result << string if anagram?(@word, str)
    end
    result
  end

  def anagram?(word_a, word_b)
    word_a.split('').sort.join == word_b.split('').sort.join
  end
end