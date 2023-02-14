class Diamond
  def self.make_diamond(letter)
    letter = letter.upcase
    letters = ("A"...letter).to_a + ("A"..letter).to_a.reverse
    width = calculate_width(letter)
    letters.map!{|letter| make_row(letter)}
    diamond = []
    letters.each do |letter|
      while letter.size < width
        letter.prepend(' ')
        letter.concat(' ')
      end
      diamond << letter
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return 'A' if letter == 'A'
    return 'B B' if letter == 'B'
    letter + spaces_between(letter) + letter

  end

  def self.spaces_between(letter)
    return '' if letter == 'A'
    return ' ' if letter == 'B'
    spaces_table = {}
    spaces = "   "
    ("C"..letter).to_a.each{|char| spaces_table[char] = spaces; spaces+="  "}
    spaces_table[letter]
  end

  def self.calculate_width(letter)
    width_table = {}
    starting_width = 1
    ("A"..letter).to_a.each{|char| width_table[char] = starting_width; starting_width+=2}
    width_table[letter]
  end
end