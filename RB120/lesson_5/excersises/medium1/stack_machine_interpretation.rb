=begin
You may remember our Minilang language from back in the RB101-RB109 Medium exercises.
We return to that language now, but this time we'll be using OOP.
If you need a refresher, refer back to that exercise. (RB101-RB109/Medium1)

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument.
Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.

Examples:
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
=end
class EmptyStackError < StandardError; end

class InvalidTokenError < StandardError; end

class Minilang
  def initialize(commands)
    @commands = commands.split
    @stack = []
    @register = 0
  end

  def eval
    @commands.each do |command|
      if command.match(/[0-9]/)
        @register = command.to_i
      else
        case command
        when 'PRINT'
          print_reg
        when 'PUSH'
          push
        when 'POP'
          begin
            pop
          rescue EmptyStackError => e
            puts e.message
            break
          end
        when 'ADD'
          add
        when 'SUB'
          subtract
        when 'MULT'
          multiply
        when 'DIV'
          divide
        when 'MOD'
          modulo
        else
          begin
            invalid_token(command)
          rescue InvalidTokenError => e
            puts e.message
            break
          end
        end
      end
      #binding.pry
    end
  end

  private

  def print_reg
    puts @register
  end

  def push
    @stack << @register
  end

  def pop
    raise EmptyStackError.new("Empty stack!") if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += @stack.pop
  end

  def subtract
    @register -= @stack.pop
  end

  def multiply
    @register *= @stack.pop
  end

  def divide
    @register /= @stack.pop
  end

  def modulo
    @register %= @stack.pop
  end

  def invalid_token(command)
    raise InvalidTokenError.new("Invalid token: #{command}") 
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)