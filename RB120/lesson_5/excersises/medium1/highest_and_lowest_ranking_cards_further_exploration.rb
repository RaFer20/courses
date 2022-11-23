=begin
Assume you're playing a game in which cards of the same rank are unequal.
In such a game, each suit also has a ranking.
Suppose that, in this game, a 4 of Spades outranks a 4 of Hearts which outranks a 4 of Clubs which outranks a 4 of Diamonds.
A 5 of Diamonds, though, outranks a 4 of Spades since we compare ranks first.
Update the Card class so that #min and #max pick the card of the appropriate suit
if two or more cards of the same rank are present in the Array.
=end
class Card
  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_VALUES = { 'Spades' => 4, 'Hearts' => 3, "Clubs" => 2, 'Diamonds' => 1 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    if self.ranking == other.ranking
      self.ranking <=> other.sranking
    else
      self.ranking <=> other.ranking
    end
  end

  def ==(other)
    self.ranking == other.ranking
  end

  def ranking
    VALUES.fetch(rank, rank)
  end

  def sranking
    SUIT_VALUES.fetch(suit)
  end

  def to_s
    "The #{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max == Card.new('Jack', 'Spades')

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min == Card.new(8, 'Spades')
puts cards.max == Card.new(8, 'Diamonds')