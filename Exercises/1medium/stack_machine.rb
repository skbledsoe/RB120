=begin
write a class that implements a mini stack-and-register based language
  that has the following commands:

  n - place value n in the 'register, do not modify stack
  push - push the register value onto the stack, leave value in register
  add - pop value from stack and add it to register value, store result in reg
  sub - pops value from stack and subtract it from register value, store in reg
  mult - pop value and multiply by register, store in register
  div - pop value and divide into register, store in register
  mod - pop value and divide into register, store remainder in register
  pop - remove topmost item and place in register
  print - print register value

*all operations are integer operations (important for DIV and MOD)
programs will be supplied as a string
program should produce an error if:
  unexpected item is in string
  requred stack value is  not on the stack
  *no further processing performed in all error cases*

initialize register to 0

=end
class Minilang
  attr_reader :program, :register, :stack

  TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(operations)
    @program = operations.split
    @register = 0
    @stack = []
  end

  def eval
    program.each do |token|
      if TOKENS.include?(token) || token.to_i.to_s == token
        valid(token)
      else
        puts "Invalid token: #{token}"
        break
      end
    end
  end

  private

  attr_writer :register, :stack

  def valid(token)
    case token
    when 'ADD'   then add
    when 'DIV'   then div
    when 'MULT'  then mult
    when 'MOD'   then mod
    when 'SUB'   then sub
    when 'PUSH'  then push
    when 'POP'   then pop
    when 'PRINT' then puts register
    else              self.register = token.to_i
    end
  end

  def add
    self.register += stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def push
    stack.push(register)
  end

  def pop
    if stack.empty?
      puts "Empty stack!"
    else
      self.register = stack.pop
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
