require 'pry'

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
    total -= 10 if total > 21
  end

  total
end

def busted?(hand)
  total(hand) > 21
end

def player_turn(deck, hand, dealer)
  answer = nil
  loop do
    prompt "hit or stay?('s' to stay)"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    hand << deck.pop
    display_hands(hand, dealer)
    break if busted?(hand)
  end

  if busted?(hand)
    prompt "You Busted, Dealer Wins!" # end game
  else
    prompt "You chose to stay!"
  end
end

def dealer_turn(deck, hand, player)
  loop do
    break if total(hand) >= 17 || busted?(hand)
    prompt "Dealer draws a card"
    hand << deck.pop
    display_hands(player, hand)
    sleep(1.2)
  end

  if busted?(hand)
    prompt "Dealer Busted, You Win!" # end game
  else
    prompt "Dealer chose to stay!"
    sleep(1.2)
  end
end

def winner?(player, dealer)
  result = if total(player) > total(dealer)
             'Player'
           elsif total(player) < total(dealer)
             'Dealer'
           else
             'Tie'
           end
  result
end

def display_results(result, player, dealer)
  if result == 'Player'
    prompt "#{result} wins with #{total(player)}!"
  elsif result == 'Dealer'
    prompt "#{result} wins with #{total(dealer)}!"
  else
    prompt "You both #{result} with #{total(player)}!"
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

loop do
  prompt "Welcome to Twenty-One!"
  sleep(1.3)
  loop do
    deck = initialize_deck.shuffle

    player_hand = deck.pop(2)
    dealer_hand = deck.pop(2)

    display_hands(player_hand, dealer_hand)

    player_turn(deck, player_hand, dealer_hand)
    break if busted?(player_hand)
    dealer_turn(deck, dealer_hand, player_hand)
    break if busted?(dealer_hand)

    display_hands(player_hand, dealer_hand)
    display_results(winner?(player_hand, dealer_hand), player_hand, dealer_hand)
    sleep(0.5)
    break
  end
  play_again?
end
