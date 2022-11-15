module Displayable
  def display_welcome_message
    puts TTTGame::WELCOME
    puts ""
    display_opponent
    puts "<Press 'Enter' to continue.>"
    gets
    clear
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_winner_message
    clear
    display_board
    puts "Congratulations #{grand_champion}! You are the grand champion!"
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_opponent
    puts "#{computer.name} will be your opponent!"
    puts ""
  end

  def display_scoreboard
    h_score = "#{human.name}'s score: #{human.score}.  "
    c_score = "#{computer.name}'s score: #{computer.score}"
    puts Banner.new(h_score + c_score)
  end

  def display_markers
    h_marker = "#{human.name} is an #{human.marker}.     "
    c_marker = "#{computer.name} is an #{computer.marker}."
    puts Banner.new(h_marker + c_marker)
  end

  def display_starting_player
    puts Banner.new("#{starting_marker} is the starting marker")
  end

  def display_board
    display_scoreboard
    display_markers
    board.draw
    display_starting_player
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def joinor(array, divider=", ", last_divider="or")
    case array.size
    when 0 then ''
    when 1 then array.first.to_s
    when 2 then array.join(" #{last_divider} ")
    else
      array[-1] = "#{last_divider} #{array[-1]}"
      array.join(divider)
    end
  end

  def clear
    system "clear"
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

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_accessor :squares

  def initialize
    @squares = {}
    reset_board
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset_board
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  include Displayable

  MARKER_CHOICE = <<~MARKER
                Which marker would you prefer to play as?

                  1. X
                  2. O

                <Enter '1' or '2' to continue.>
                MARKER

  attr_reader :marker
  attr_accessor :score, :name

  def initialize
    @score = 0
  end

  def add_point
    @score += 1
  end
end

class Human < Player
  def initialize
    @name = set_name
    @marker = set_marker
    super
  end

  private

  def set_name
    clear
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def set_marker
    clear
    answer = nil
    loop do
      puts MARKER_CHOICE
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      clear
      puts "Please enter a valid choice"
    end
    ["1", "x"].include?(answer) ? "X" : "O"
  end
end

class Computer < Player
  attr_accessor :opponent_marker

  def initialize(opponent)
    @name = set_name
    @opponent_marker = opponent
    @marker = set_marker
    super()
  end

  private

  def set_name
    self.name = ['Tic', 'Tac', 'Scrap',
                 'Macro', 'Micro', 'Screwie'].sample
  end

  def set_marker
    opponent_marker == "X" ? "O" : "X"
  end
end

class TTTGame
  include Displayable

  FIRST_TO_MOVE = ["X", "O"].sample # selected at random if player won't choose
  WIN_CON = 2 # Score required to be grand champion
  WELCOME = <<~WELCOME
  Welcome to Tic Tac Toe!

  The first player to reach #{WIN_CON} points is the grand champion!

  WELCOME
  START_DECISION = <<~CHOICE
  Would you like to decide who starts?

    1. "I want to decide!"
    2. "My opponent can decide who starts."

  <Enter '1' or '2' to continue>
  CHOICE
  WHO_STARTS = <<~STARTER
  Would you like to start or do you want your opponent to start?

    1. "I want to start!"
    2. "I'd like my opponent to start."

  <Enter '1' or '2' to continue.>
  STARTER

  attr_reader :board, :human, :computer, :starting_marker

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(human.marker)
    @starting_marker = choose_starter? ? starter_choice : FIRST_TO_MOVE
    @current_marker = @starting_marker
  end

  def play
    clear
    display_welcome_message
    main_game
    display_winner_message if grand_champion?
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      update_score
      break if grand_champion?
      break unless play_again?
      reset_board
      display_play_again_message
    end
  end

  def choose_starter?
    clear
    answer = nil
    loop do
      puts START_DECISION
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      puts "Must enter 'y' or 'n'"
    end
    answer == '1'
  end

  def starter_choice
    clear
    answer = nil
    loop do
      puts WHO_STARTS
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      puts "Please enter '1' or '2'"
    end
    answer == '1' ? human.marker : computer.marker
  end

  def update_score
    human.add_point if board.winning_marker == human.marker
    computer.add_point if board.winning_marker == computer.marker
  end

  def grand_champion?
    human.score == WIN_CON || computer.score == WIN_CON
  end

  def grand_champion
    champion = human if human.score == WIN_CON
    champion = computer if computer.score == WIN_CON
    champion.name
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def strategic_line(line, mark)
    return nil unless # checks if there's 2 of any marker in a line
    board.squares.values_at(*line).map(&:marker).count(mark) == 2

    board.squares.keys.select do |k|
      line.include?(k) && board.squares[k].unmarked?
    end.first
  end

  def offensive_thinking(c_marker, square = nil)
    Board::WINNING_LINES.each do |line|
      square = strategic_line(line, c_marker)

      if square
        board.squares[square].marker = c_marker
        break
      end
    end

    square
  end

  def defensive_thinking(h_marker, c_marker, square = nil)
    Board::WINNING_LINES.each do |line|
      square = strategic_line(line, h_marker)

      if square
        board.squares[square].marker = c_marker
        break
      end
    end

    square
  end

  def prioritize_middle(c_marker)
    return nil unless board.unmarked_keys.include?(5)
    board.squares[5].marker = c_marker
  end

  def mark_random_square
    board[board.unmarked_keys.sample] = computer.marker
  end

  def computer_moves(square = nil)
    loop do
      square = offensive_thinking(computer.marker)
      break if square

      square = defensive_thinking(human.marker, computer.marker)
      break if square

      square = prioritize_middle(computer.marker)
      break if square

      mark_random_square
      break
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
      clear_screen_and_display_board
    else
      sleep 0.5
      computer_moves
      @current_marker = human.marker
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_board
    board.reset_board
    @current_marker = @starting_marker
    clear
  end
end

game = TTTGame.new
game.play
