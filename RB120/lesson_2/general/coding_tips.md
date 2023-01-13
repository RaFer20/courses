1. Explore the problem before design.

It can be very difficult to come up with the "right" classes and methods when you first approach a problem. Take time to explore the problem domain with a spike - exploratory code to play around with the problem. Spikes can help validate initial hunches and hypotheses. You don't have to worry about code quality, because the idea of a spike is to throw away the code. If you were writing an essay, the spike would be the initial braindump of ideas. As you start to understand the problem better and get a feel for possible solutions, start to organize your code into coherent classes and methods.

#########################################

2. Repetitive nouns in method names is a sign that you're missing a class.

In the following example `move` could be a class on it's own

human.make_move
computer.make_move

puts "Human move was #{format_move(human.move)}."
puts "Computer move was #{format_move(computer.move)}."

if compare_moves(human.move, computer.move) > 1
  puts "Human won!"
elsif compare_moves(human.move, computer.move) < 1
  puts "Computer won!"
else
  puts "It's a tie!"
end

#####
The following code is a refactor of the previous one, it's also simpler to read and all the helper methods are in the appropriate class `move`

human.move!
computer.move!

puts "Human move was #{human.move.display}."
puts "Computer move was #{computer.move.display}."

if human.move > computer.move
  puts "Human won!"
elsif human.move < computer.move
  puts "Computer won!"
else
  puts "It's a tie!"
end

#############################################

3. When naming methods, don't include the class name.

class Player
  def player_info
    # returns player's name, move and other data
  end
end

The code above can lead to this:

player1 = Player.new
player2 = Player.new

puts player1.player_info
puts player2.player_info

The code would read much more fluently if the method was just named info, so we can use it like this:
puts player1.info
puts player2.info

############################################

4. When working with object oriented code, it's tempting to keep calling methods on collaborator objects.
Take the following code.

human.move.display.size

This is a 3 chain method invocation, and is very fragile. For example, if human.move returns nil, then the entire method invocation chain blows up, and it's very hard to debug the error. There are many solutions for this type of problem, and many strategies are beyond what we want to talk about right now. For now, develop the initial instinct to smell out code that contains long method invocation chains, and try to think about the possibility of nil or other unexpected return values in the middle of the chain. If you've identified that human.move could possibly return nil, for example, then you can put in some guard expressions like this:

move = human.move
puts move.display.size if move

#########################################

5. Avoid design patterns for now.

One of the biggest mistakes beginner programmers make is mis-application of "best practices" or "design patterns" to improve performance or flexibility. This is such a common phenomenon that experienced programmers have a quote: "premature optimization is the root of all evil".

Don't worry about optimization at this point. Don't write overly clever code. Granted, you won't know what's considered "clever" vs "normal" without reading a lot of code, but over time, you will start to hone your senses.

You'll spend the rest of your career mastering design patterns and best practices. Most importantly, you should spend time understanding when to use those things.