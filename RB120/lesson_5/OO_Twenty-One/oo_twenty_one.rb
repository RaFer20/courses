module Displayable
  WELCOME = <<~WELCOME
    Welcome to 21!

    The aim of the 21 Card Game is to get 21 or as close to as possible 
    without going over 21.

    Number cards have their face value, jacks, kings and queens are worth 10. 
    Ace can be either 1 or 11.

    <Press 'Enter' to continue.>
  WELCOME
  GOODBYE = <<~GOODBYE

    Thank you for playing 21! 

    Goodbye, have a great day!
  GOODBYE

  def display_welcome_message
    clear
    puts WELCOME
    gets
  end

  def display_winner
    puts Banner.new("#{winner} is the winner!")
  end

  def display_tie
    puts Banner.new("It's a tie! Both players had a total of #{player.total}")
  end

  def display_goodbye_message
    clear
    puts GOODBYE
    puts ""
  end

  def update_card_display
    clear
    show_cards
  end

  def display_hit(participant)
  prompt "#{participant.name} hits!"
  end

  def display_stay(participant)
    prompt "#{participant.name} stays!"
  end

  def display_bust(participant, opponent)
    puts Banner.new("#{participant.name} busted! #{opponent.name} wins!")
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def clear
    system 'clear'
  end
end

class Banner
  attr_reader :width, :message

  def initialize(message, width = (message.length + 4), height = 5)
    @message = message
    @width = width
    @height = height # must be an odd number to be centered vertically
  end

  def to_s
    return error_message if width < (@message.length + 4)
    create_banner
  end

  private

  def create_banner
    banner_array = []
    (@height - 3).times { banner_array << empty_line }
    banner_array.prepend(horizontal_rule)
    banner_array.append(horizontal_rule)
    banner_array.insert(banner_array.length / 2, message_line)
    banner_array.join("\n")
  end

  def horizontal_rule
    "+-" + '-' * (message_line.length - 4) + "-+"
  end

  def empty_line
    "| " + " " * (message_line.length - 4) + " |"
  end

  def message_line
    spaces_to_insert = ((@width - @message.length) - 4) / 2
    "| " + " " * spaces_to_insert + message + " " * spaces_to_insert + " |"
  end

  def error_message
    puts "Width must be at least 4 spaces longer than the length of the message"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end

    @cards.shuffle!
  end

  def deal_card
    cards.pop
  end
end

class Card
  SUITS = ['♥', '♦', '♠', '♣']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    puts display_card
  end

  # rubocop:disable Layout/ArrayAlignment
  def display_card # 9 height x 8 width area
    ["  _________  ",
    " |       #{rank.rjust(2)}| ",
    " |         | ",
    " |         | ",
    " |    #{suit}    | ",
    " |         | ",
    " |         | ",
    " |#{rank.rjust(2)}       | ",
    " |_________| "]
  end
  # rubocop:enable Layout/ArrayAlignment

  def [](idx) # used in show_hand
    display_card[idx]
  end
end

class Participant
  include Displayable

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end

  def show_hand
    puts Banner.new("#{name}'s hand")
    0.upto(8) do |slice|
      0.upto(cards.size - 1) do |card|
        print cards[card][slice]
      end
      puts ''
    end
    prompt "total: #{total}"
    puts ''
  end

  def card_values
    cards.map do |card|
      if card.rank == 'Ace'
        11
      elsif card.rank.to_i == 0
        10
      else
        card.rank.to_i
      end
    end
  end

  def total
    values = card_values
    total = values.sum
    total -= 10 if total > TwentyOne::GOAL && values.include?(11)
    total
  end

  def busted?
    total > TwentyOne::GOAL
  end
end

class Player < Participant
  def set_name
    clear
    n = ""
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value."
    end
    self.name = n
  end
end

class Dealer < Participant
  def set_name
    self.name = ['21Bot', 'SirAcealot', 'AceBot',
                 'Macro', 'Micro', 'Screwie'].sample
  end
end

# Game orchestration engine
class TwentyOne
  include Displayable

  def start
    display_welcome_message
    loop do
      deal_cards
      gameplay
      show_result if no_busts
      play_again? ? reset : break
    end
    display_goodbye_message
  end

  private

  GOAL = 21
  MAX_HIT = 17

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    2.times do
      player.cards << deck.deal_card
      update_card_display
      sleep 0.3
      dealer.cards << deck.deal_card
      update_card_display
      sleep 0.3
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
    puts ""
  end

  def player_choice
    input = nil
    loop do
      prompt "Do you want to (h)it or (s)tay?"
      input = gets.chomp.downcase
      break if %w(h s).include?(input)
      prompt "please enter 'h' to hit or 's' to stay."
    end
    input
  end

  def draw_card(participant)
    participant.cards << deck.deal_card
  end

  def player_hit_loop
    loop do
      break if player_choice == 's'
      draw_card(player)
      update_card_display
      prompt "#{player.name}'s turn..."
      puts ""
      display_hit(player)
      puts ""
      break if player.busted?
    end
  end

  def dealer_hit_loop
    loop do
      draw_card(dealer)
      update_card_display
      prompt "#{dealer.name}'s turn..."
      puts ""
      display_hit(dealer)
      puts ""
      sleep 1
      break if dealer.busted? || dealer.total >= MAX_HIT
    end
  end

  def player_turn
    prompt "#{player.name}'s turn..."
    puts ""
    player_hit_loop
    display_stay(player) if !player.busted?
    display_bust(player, dealer) if player.busted?
  end

  def dealer_turn
    update_card_display
    prompt "#{dealer.name}'s turn..."
    puts ""
    dealer_hit_loop if dealer.total < MAX_HIT
    display_stay(dealer) if !dealer.busted?
    puts ""
    display_bust(dealer, player) if dealer.busted?
  end

  def gameplay
    player_turn
    dealer_turn if !player.busted?
    sleep 1.5
  end

  def no_busts
    player.busted? == false && dealer.busted? == false
  end

  def winner
    if player.total > dealer.total
      player.name
    elsif player.total < dealer.total
      dealer.name
    else
      false
    end
  end

  def show_result
    update_card_display
    winner ? display_winner : display_tie
  end

  def play_again?
    input = nil
    loop do
      puts ""
      prompt "Would you like to play again?(y/n)"
      input = gets.chomp.downcase
      break if %w(y n).include?(input)
      prompt "Sorry, must enter 'y' or 'n'"
    end
    input == 'y'
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end

game = TwentyOne.new
game.start
