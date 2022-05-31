require 'pry'

player_score = 0
computer_score = 0
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're the #{PLAYER_MARKER}. Computer is the #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_score(player, computer)
  prompt "Your Score is:#{player}. Computer Score is:#{computer}"
  prompt "First to score 5 points wins!"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=', ', separator2='or ')
  case arr.length
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{separator2} ")
  else
    arr[-1] = "#{separator2} #{arr.last}"
    arr.join(separator)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def strategic_line(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def offensive_thinking(brd, square)
  WINNING_LINES.each do |line|
    square = strategic_line(line, brd, COMPUTER_MARKER)
    if !square.nil?
      idx = brd.values_at(*line).index { |value| value == INITIAL_MARKER }
      attack = line[idx]
      brd[attack] = COMPUTER_MARKER
      break
    end
  end
  square
end

def defensive_thinking(brd, square)
  WINNING_LINES.each do |line|
    square = strategic_line(line, brd, PLAYER_MARKER)
    if !square.nil? && strategic_line(line, brd, COMPUTER_MARKER) != true
      idx = brd.values_at(*line).index { |value| value != PLAYER_MARKER }
      defend = line[idx]
      brd[defend] = COMPUTER_MARKER
      break
    end
  end
  square
end

def prioritize_middle(brd, square)
  empty_squares(brd).each do
    if empty_squares(brd).include?(5)
      square = 5
      brd[5] = COMPUTER_MARKER
      break
    end
  end
  square
end

def randomize_position(brd, square)
  random = empty_squares(brd).sample
  brd[random] = COMPUTER_MARKER
  square
end

# rubocop:disable Metrics/MethodLength
def computer_places_piece!(brd)
  square = nil
  loop do
    square = offensive_thinking(brd, square)
    break if !square.nil?

    if square.nil?
      square = defensive_thinking(brd, square)
    end
    break if !square.nil?

    if square.nil?
      square = prioritize_middle(brd, square)
      break if !square.nil?
    end

    if square.nil?
      square = randomize_position(brd, square)
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    sleep(0.3)
    computer_places_piece!(brd)
  end
end

def who_goes_first
  system 'clear'
  prompt "Who should go first?"
  prompt "1. You, 2. Your opponent, 3. Let your opponent decide!"

  loop do
  choices = { 
    1 => 'player',
    2 => 'computer',
    3 => ['player', 'computer'].sample
  }

  first = gets.chomp.to_i
    if choices.keys.any?(first)
    prompt "#{choices[first].capitalize} will go first!"
    sleep (0.5)
    return choices[first]
    else
    prompt "Please enter a valid number!"
    end
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      sleep(0.2)
      return 'Computer'
    end
  end
  nil
end

current_player = who_goes_first
loop do
  board = initialize_board
  
  loop do
    display_board(board)
    display_score(player_score, computer_score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board) && detect_winner(board) == 'Player'
    prompt "#{detect_winner(board)} scored a point!"
    sleep(0.5)
    player_score += 1
  elsif someone_won?(board) && detect_winner(board) == 'Computer'
    prompt "#{detect_winner(board)} scored a point!"
    sleep(0.5)
    computer_score += 1
  else
    prompt "It's a tie!"
  end

  next if player_score < 5 && computer_score < 5
  system 'clear'
  prompt "#{detect_winner(board)} Wins!"
  prompt "Play again? (y/n)"
  answer = gets.chomp
  player_score = 0
  computer_score = 0
  break unless answer.downcase.start_with?('y')
  current_player = who_goes_first
end

prompt "Thanks for playing Tictactoe, Goodbye"