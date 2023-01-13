The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed

Approach to OOP
The classical approach to object oriented programming is:

1.Write a textual description of the problem or exercise.
2.Extract the major nouns and verbs from the description.
3.Organize and associate the verbs with the nouns.
4.The nouns are the classes and the verbs are the behaviors or methods.

Notice that in OO, we don't think about the game flow logic at all. It's all about organizing and modularizing the code into a cohesive structure - classes. After we come up with the initial class definitions, the final step is to orchestrate the flow of the program using objects instantiated from the classes. We won't worry about that final step yet.

Let's use the above approach and first write out a textual description of Rock, Paper and Scissors.

Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

Let's now look at the above description, and try to extract the major nouns and verbs. In a way, Rock, Paper, Scissors is a difficult game to code in OO style, because there aren't many obvious nouns.

Nouns: player, move, rule
Verbs: choose, compare

Note that we decided to ignore "rock", "paper" or "scissors", since they are all variations on a move -- almost like different states of a move. Therefore, we capture the major noun: move.

Now for step 3: organizing the verbs with the nouns. One would think that given the few nouns and verbs we're working with, this would be a very easy exercise. However, it's not obvious where the "compare" verb goes. Here's a list of the nouns and their verbs.

Player
 - choose
Move
Rule

- compare

Let's code up some classes and methods. While we do this, we can also think about what "states" the objects of these classes should have.

class Player
  def initialize
    # maybe a "name"? what about a "move"?
  end

  def choose

  end
end

class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)

end

We won't fill out the exact details yet, but these are the initial skeleton classes and methods we're going to start with. This is the initial rough napkin modeling of the problem. Notice that there are lots of unanswered questions at this point.


Orchestration engine

After we're done organizing nouns and verbs into classes, we need an "engine" of some sort to orchestrate the objects. This is where the procedural program flow should be. Let's call the "engine" class RPSGame.

RPSGame.new.play

class definition:

class RPSGame
  def initialize

  end

  def play

  end
end

Starting from that skeleton, we can start to think about what objects are required in the play method to facilitate the game.

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end