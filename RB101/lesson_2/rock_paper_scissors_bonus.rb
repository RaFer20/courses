VALID_CHOICES = %w(rock paper scissors lizard spock)

CHOICES = {
  rock: %w(lizard scissors),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(spock paper),
  spock: %w(scissors rock)
}

def prompt(message)
  puts "--- #{message}"
end

def valid_choice?(input)
  VALID_CHOICES.include?(input)
end

def complete_word(choice)
  case choice
  when "r" then choice << "ock"
  when "p" then choice << "aper"
  when "sc" then choice << "issors"
  when "l" then choice << "izard"
  when "sp" then choice << "ock"
  end
end

def user_choice
  loop do
    choice = gets.chomp.downcase

    complete_word(choice)
    return choice if valid_choice?(choice)
    prompt("Please enter a valid choice!")
  end
end

def win?(player, computer)
  if CHOICES[player.to_sym].include?(computer)
    'win'
  elsif CHOICES[computer.to_sym].include?(player)
    'lose'
  else
    'tie'
  end
end

def display_result(result)
  if result == 'win'
    prompt("You won!")
  elsif result == 'lose'
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
  sleep(0.8)
end

def game_end(player_score, computer_score)
  player_score == 3 || computer_score == 3
end

def display_who_won(player_score, computer_score)
  if player_score == 3
    prompt("Congratulations! You are the Winner!")
  elsif computer_score == 3
    prompt("You lose! But you can always try again!")
  end
end

def play_again
  loop do
    prompt("Would you like to play again? (y/n)")
    input = gets.chomp.downcase

    if input.start_with?('y')
      system "clear"
      prompt("Time for another round!")
      return
    elsif input.start_with?('n')
      prompt("Thank you for playing!")
      exit
    else
      prompt("Please enter 'y' if you'd like to play again or 'n' to stop.")
    end
  end
end

prompt("Welcome to Rock Paper Scissors Lizard Spock!")
prompt("Compete in a best of 5 to become the Grand Champion!")
prompt("----------------------------------------------------")

player_score = 0
computer_score = 0

loop do
  prompt("Choose one: r=rock, p=paper, sc=scissors, l=lizard or sp=spock")
  player_choice = user_choice
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{player_choice}! ; Computer chose #{computer_choice}!")
  prompt("----------------------------------------------------------------")

  result = win?(player_choice, computer_choice)
  display_result(result)

  player_score   += 1 if result == 'win'
  computer_score += 1 if result == 'lose'

  system "clear"
  prompt("Scoreboard: #{player_score} ; #{computer_score}")

  if game_end(player_score, computer_score)
    display_who_won(player_score, computer_score)

    play_again
    player_score = 0
    computer_score = 0
  end
end
