require 'pry'

TWENTYONE = 21
DEALERSTAY_TWENTYONE = 17
player_score = 0
dealer_score = 0

def initialize_deck
  deck = []
  suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
  cards = ('2'..'10').to_a + ['Jack'] + ['Queen'] + ['King'] + ['Ace']

  suits.each do |suit|
    cards.map do |card|
      array = []
      array[0] = suit
      array[1] = card
      deck << array
    end
  end
  deck
end

def prompt(msg)
  puts "--- #{msg}"
end

def display_hands(player, dealer)
  system 'clear'
  prompt "Player: #{player}"
  prompt "-------------------------------------------------------------"
  prompt "Dealer: #{dealer.select { |c| c != dealer[1] }} and ?"
end

def display_hands_end(player, dealer)
  system 'clear'
  prompt "Player: #{player}"
  prompt "-------------------------------------------------------------"
  prompt "Dealer: #{dealer}"
end

def total(cards)
  values = cards.map { |card| card[1] }
  total = 0

  values.each do |value|
    total += if value == "Ace"
               11
             elsif value.to_i == 0
               10
             else
               value.to_i
             end
  end

  values.select { |value| value == "Ace" }.count.times do
    total -= 10 if total > TWENTYONE
  end

  total
end

def busted?(hand)
  hand > TWENTYONE
end

# rubocop:disable Metrics/MethodLength
def player_turn(deck, hand, dealer, total)
  answer = nil
  loop do
    prompt "hit or stay?('s' to stay)"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    hand << deck.pop
    display_hands(hand, dealer)
    total = total(hand)
    break if busted?(total)
  end

  if busted?(total)
    display_hands_end(hand, dealer)
    prompt "You Busted, Dealer Wins!" # end game
  else
    prompt "You chose to stay!"
  end
end
# rubocop:enable Metrics/MethodLength

def dealer_turn(deck, hand, player, total)
  loop do
    break if total(hand) >= DEALERSTAY_TWENTYONE || busted?(total)
    prompt "Dealer draws a card"
    hand << deck.pop
    display_hands(player, hand)
    total = total(hand)
    sleep(1.2)
  end

  if busted?(total)
    display_hands_end(player, hand)
    prompt "Dealer Busted, You Win!" # end game
  else
    prompt "Dealer chose to stay!"
    sleep(1.2)
  end
end

def winner?(player, dealer)
  result = if total(player) > total(dealer) && total(player) <= TWENTYONE
             'Player'
           elsif total(player) < total(dealer) && total(dealer) <= TWENTYONE
             'Dealer'
           else
             'Tie'
           end
  result
end

def display_results(result, player, dealer)
  if result == 'Player'
    prompt "#{result} wins with #{player}!"
  elsif result == 'Dealer'
    prompt "#{result} wins with #{dealer}!"
  else
    prompt "You both #{result} with #{player}!"
  end
end

def play_again?
  loop do
    prompt("Would you like to play again? (y/n)")
    input = gets.chomp.downcase

    if input.start_with?('y')
      system "clear"
      prompt("Time for another round!")
      sleep(1.3)
      return
    elsif input.start_with?('n')
      prompt("Thank you for playing!")
      exit
    else
      prompt("Please enter 'y' if you'd like to play again or 'n' to stop.")
    end
  end
end

prompt "Welcome to Twenty-One!"
loop do
  sleep(1.3)
  loop do
    deck = initialize_deck.shuffle

    player_hand = deck.pop(2)
    dealer_hand = deck.pop(2)

    player_sum = total(player_hand)
    dealer_sum = total(dealer_hand)

    display_hands(player_hand, dealer_hand)

    player_turn(deck, player_hand, dealer_hand, player_sum)
    player_sum = total(player_hand)
    break if busted?(player_sum) && dealer_score += 1

    dealer_turn(deck, dealer_hand, player_hand, dealer_sum)
    dealer_sum = total(dealer_hand)
    break if busted?(dealer_sum) && player_score += 1

    display_hands_end(player_hand, dealer_hand)
    display_results(winner?(player_hand, dealer_hand), player_sum, dealer_sum)

    if winner?(player_hand, dealer_hand) == 'Player'
      player_score += 1
    elsif winner?(player_hand, dealer_hand) == 'Dealer'
      dealer_score += 1
    end
    sleep(0.5)
    break
  end
  prompt "The player's score is : #{player_score}"
  prompt "The dealer's score is : #{dealer_score}"
  if player_score < 5 && dealer_score < 5
    prompt "First to reach 5 points is the grand champion!"
  end
  sleep(1)
  if player_score == 5
    prompt "You are the grand champion!"
    player_score = 0
    dealer_score = 0
  elsif dealer_score == 5
    prompt "The dealer is the grand champion! Better luck next time!"
    player_score = 0
    dealer_score = 0
  end

  play_again?
end
