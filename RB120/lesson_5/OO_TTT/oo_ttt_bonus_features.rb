require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

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
  attr_reader :marker
  attr_accessor :score, :name

  def initialize(marker, choose_name=false)
    @name = choose_name ? set_name_human : set_name_computer
    @marker = marker
    @score = 0
  end

  def add_point
    @score += 1
  end

  def set_name_human
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def set_name_computer
    self.name = ['Tic', 'Tac', 'Scrap',
                 'Macro', 'Micro', 'Screwie'].sample
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = ["X", "O"].sample # selected at random
  WIN_CON = 2 # Score required to be grand champion
  WELCOME = <<~WELCOME
                Welcome to Tic Tac Toe!

                The first player to reach #{WIN_CON} points is the grand champion!


                #{FIRST_TO_MOVE} moves first this match!

                WELCOME
  MARKER_CHOICE = <<~MARKER
                Which marker would you prefer to play as?(1-2 or X-O)
                1. X
                2. O
                MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(set_marker_hum, true)
    @computer = Player.new(set_marker_com)
    @current_marker = FIRST_TO_MOVE
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

  def set_marker_hum
    clear
    answer = nil
    loop do
      puts MARKER_CHOICE
      answer = gets.chomp.to_s.downcase
      break if ["1", "2", "x", "o"].include?(answer)
      "Sorry that's not a valid choice, you may type in 1-2 or X-O"
    end
    ["1", "x"].include?(answer) ? "X" : "O"
  end

  def set_marker_com
    human.marker == "X" ? "O" : "X"
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

  def display_welcome_message
    puts WELCOME
    puts ""
    display_opponent
    puts "Press 'Enter' to continue."
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

  def human_turn?
    @current_marker == human.marker
  end

  def display_scoreboard
    puts <<~MSG
    #{human.name}'s score: #{human.score}.  #{computer.name}'s score: #{computer.score}"
    
    #{human.name} is an #{human.marker}.    #{computer.name} is an #{computer.marker}.

    MSG
  end

  def display_board
    display_scoreboard
    board.draw
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

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
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

  def clear
    system "clear"
  end

  def reset_board
    board.reset_board
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
