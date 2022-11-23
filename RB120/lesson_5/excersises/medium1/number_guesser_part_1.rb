=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game.
The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end

=begin
Tell the plater how many guesses remain
Ask the player to guess between a number 1 and 100
Tell the player if their guess was too high or too low

break from loop if there are 0 guesses left or if the number was guessed correctly

Tell the player they lost if they ran out of guesses or won if they didn't
=end
class GuessingGame
  def play
    game_loop
  end

  private

  attr_accessor :guesses
  attr_reader :number

  def initialize
    @guesses = 7
    @number = rand(1..100)
  end

  def game_loop
    clear
    loop do
      break if guesses == 0
      puts display_guesses_left
      guess = guess_number

      if guess > number
        puts "Your guess is too high."
        decrease_guesses
      elsif guess < number
        puts "Your guess is too low."
        decrease_guesses
      else
        puts "That's the number!"
        puts ""
        break
      end
      puts ""
    end
    win? ? puts("You won!") : puts("You have no more guesses. You lost!")
  end

  def win?
    guesses > 0
  end

  def guess_number
    guess = nil
    loop do
      print "Enter a number berween 1 and 100:"
      guess = gets.chomp.to_i
      break if (1..100) === guess
      print "Invalid guess."
    end
    guess
  end

  def decrease_guesses
    self.guesses -= 1
  end

  def display_guesses_left
    guesses == 1 ? "You have #{guesses} guess remaining" : "You have #{guesses} guesses remaining."
  end

  def clear
    system 'clear'
  end
end

game = GuessingGame.new
game.play