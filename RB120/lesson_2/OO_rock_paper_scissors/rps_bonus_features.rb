module Displayable
  WIN_CON = 3

  WELCOME_MESSAGE = <<~MSG
  Welcome to Rock, Paper, Scissors, Lizard, Spock!

  First player to reach #{WIN_CON} points is the grand champion!

  Watch out though, I heard one of your possible opponents has been known to play dirty.
  MSG

  RULES = <<~MSG
  The rules are simple:
    1. Rock crushes Scissors and Lizard
    2. Paper covers Rock and disproves Spock
    3. Scissors cut Paper and decapitate Lizard
    4. Lizard eats Paper and poisons Spock
    5. Spock vaporizes Rock and smashes Scissors
    MSG

  def display_continue
    puts ""
    puts "Press `Enter` to continue"
    gets
    system 'clear'
  end

  def display_welcome_message
    system 'clear'
    puts WELCOME_MESSAGE
    display_continue
  end

  def display_rules
    puts RULES
    display_continue
  end

  def display_opponent
    puts "Your opponent is #{computer.name}!"
  end

  def display_scoreboard
    puts ""
    puts "#{human.name}'s past moves: #{human.history}"
    puts "Score: #{human.score}.
      "
    puts "#{computer.name}'s past moves: #{computer.history}"
    puts "Score: #{computer.score}.
      "
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts ''
    puts "#{human.name} chose #{human.move}."
    puts ''
    puts "#{computer.name} chose #{computer.move}."
    puts ''
  end

  def display_winner
    if human_wins?
      human.score_point
      puts "#{human.name} won!"
    elsif computer_wins?
      computer.score_point
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_grand_champion
    system 'clear'
    if human.score == WIN_CON
      puts "#{human.name} has reached #{WIN_CON} points!"
      puts "#{human.name} is the grand champion!"
    elsif computer.score == WIN_CON
      puts "#{computer.name} has reached #{WIN_CON} points!"
      puts "#{computer.name} is the grand champion!"
    end
  end
end

class Move
  VALUES = ["rock", "paper", "scissors", "lizard", "spock"]

  def initialize(value)
    @value = value
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def scissors?
    @value == "scissors"
  end

  def lizard?
    @value == "lizard"
  end

  def spock?
    @value == "spock"
  end

  def rock_wins?(other_move)
    rock? && (other_move.scissors? || other_move.lizard?)
  end

  def paper_wins?(other_move)
    paper? && (other_move.rock? || other_move.spock?)
  end

  def scissors_wins?(other_move)
    scissors? && (other_move.paper? || other_move.lizard?)
  end

  def lizard_wins?(other_move)
    lizard? && (other_move.spock? || other_move.paper?)
  end

  def spock_wins?(other_move)
    spock? && (other_move.scissors? || other_move.rock?)
  end

  def >(other_move)
    rock_wins?(other_move) ||
      paper_wins?(other_move) ||
      scissors_wins?(other_move) ||
      lizard_wins?(other_move) ||
      spock_wins?(other_move)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score
  attr_reader :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def score_point
    @score += 1
  end

  def reset_score
    @score = 0
  end

  def to_s
    @value
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    @history << @move.to_s
  end
end

class Computer < Player
  attr_reader :opponent

  def initialize(opponent)
    super()
    @opponent = opponent
  end

  def set_name
    self.name = ['Rocky', 'Lizzy', 'Chappie',
                 'Sonny', 'Number 5', 'CheatBot9000'].sample
  end

  def rocky?
    @name == 'Rocky' # Only picks rock every time.
  end

  def lizzy?
    @name == 'Lizzy' # Picks mostly lizard, never paper though.
  end

  def cheater?
    @name == 'CheatBot9000' # Literally cheats, will win every time.
  end

  def only_rock
    Move.new(Move::VALUES[0])
  end

  def mostly_lizard
    case (1..120).to_a.sample
    when 1..60
      Move.new(Move::VALUES[3])
    when 61..90
      Move.new(Move::VALUES[2])
    when 91..115
      Move.new(Move::VALUES[0])
    when 116..120
      Move.new(Move::VALUES[4])
    end
  end

  def questionable_behavior
    cheater = { 'rock' => Move::VALUES[1],
                'paper' => Move::VALUES[2],
                'scissors' => Move::VALUES[4],
                'lizard' => Move::VALUES[0],
                'spock' => Move::VALUES[3] }
    Move.new(cheater[opponent.move.to_s])
  end

  def cheater
    system 'clear'
    puts "hmmm..let me think about this..."
    sleep 1.5
    questionable_behavior
  end

  def choose
    self.move = if rocky?
                  only_rock
                elsif lizzy?
                  mostly_lizard
                elsif cheater?
                  cheater
                else
                  Move.new(Move::VALUES.sample)
                end
    @history << @move.to_s
  end
end

# Game Orchestration Engine
class RPSGame
  include Displayable
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new(human)
  end

  # rubocop:disable Metrics/MethodLength
  def round_loop
    loop do
      display_opponent
      display_scoreboard
      human.choose
      computer.choose
      display_moves
      display_winner
      break if winner?
      display_continue
    end
    display_grand_champion if winner?
    round_loop if play_again?
  end
  # rubocop:enable Metrics/MethodLength

  def human_wins?
    human.move > computer.move
  end

  def computer_wins?
    computer.move > human.move
  end

  def play_again_loop
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry must be 'y' or 'n'"
    end
    answer
  end

  def play_again?
    return false if play_again_loop == "n"
    system "clear"
    human.reset_score
    computer.reset_score
    return true if play_again_loop == "y"
  end

  def winner?
    return true if human.score == WIN_CON || computer.score == WIN_CON
  end

  def play
    display_welcome_message
    display_rules
    round_loop
    display_goodbye_message
  end
end

RPSGame.new.play
