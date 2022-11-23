=begin
In the previous two exercises, you developed a Card class and a Deck class.
You are now going to use those classes to create and evaluate poker hands.
Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand.

You should build your class using the following code skeleton:
# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(deck)
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end
The exact cards and the type of hand will vary with each run.

Most variants of Poker allow both Ace-high (A, K, Q, J, 10) and Ace-low (A, 2, 3, 4, 5) straights.
For simplicity, your code only needs to recognize Ace-high straights.

If you are unfamiliar with Poker, please see this description of the various hand types.
Since we won't actually be playing a game of Poker, it isn't necessary to know how to play.
=end
module RanksnSuits
  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end
class Card
  include Comparable
  include RanksnSuits

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    self.ranking <=> other.ranking
  end

  def ranking
    VALUES.fetch(rank, rank)
  end


  def to_s
    "The #{rank} of #{suit}"
  end
end

class Deck
  include RanksnSuits

  def initialize
    reset
  end

  def draw
    card = @cards.pop
    reset if @cards.empty?
    card
  end

  private

  def reset
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  include RanksnSuits

  def initialize(deck)
    @cards = []
    5.times{ @cards << deck.draw }
    @ranks = @cards.map{|card| card.rank}
    @suits = @cards.map{|card| card.suit}
  end

  def print
    puts "This hand consists of:"
    @cards.each{|card| puts "The #{card.rank} of #{card.suit}"}
    puts ""
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_reader :ranks, :suits

  def royal_flush?
    straight_flush? && ranks.map{|rank|VALUES.fetch(rank, rank)}.min == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    fours = 0
    ranks.uniq.each{|rank| fours += 1 if ranks.count(rank) == 4}
    fours == 1
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    r = ranks.map{|rank|VALUES.fetch(rank, rank)}
    r.uniq.size == 5 && r.max - r.min == 4
  end

  def three_of_a_kind?
    trio = 0
    ranks.uniq.each{|rank| trio += 1 if ranks.count(rank) == 3}
    trio == 1
  end

  def two_pair?
    pairs = 0
    ranks.uniq.each{|rank| pairs += 1 if ranks.count(rank) == 2}
    pairs == 2
  end

  def pair?
    pairs = 0
    ranks.uniq.each{|rank| pairs += 1 if ranks.count(rank) == 2}
    pairs == 1
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'