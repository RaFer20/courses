class Scrabble
  VALUES = {'AEIOULNRST' => 1,
            'DG'         => 2,
            'BCMP'       => 3,
            'FHVWY'      => 4,
            'K'          => 5,
            'JX'         => 8,
            'QZ'         => 10}

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    score = 0
    
    word.each_char do |char|
      VALUES.each_key do |key|
        score += VALUES[key] if key.downcase.include?(char.downcase)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  attr_reader :word
end

