=begin
create an OOP number guessing class for numbers from 1..100 with a limit
of 7 guesses per game.

GuessingGame class
  number set to random between 1..100
  guesses set to 7

  -play method
    game loop:
      display number of guesses remaining
      ask user for a number between 1 and 100
        validate number - error messeage if outside range
      display whether guess is low, high, or correct
      break loop if guess == number or 0 guesses remaining
      subtract one from guesses
    display whether player won or lost
=end
class GuessingGame
  attr_reader :guesses_left, :number, :guess, :range

  def initialize
    @guesses_left = 7
    @range = (1..100).to_a
    @number = range.sample
  end

  def play
    display_welcome_message
    loop do
      choose_number
      display_guess
      self.guesses_left -= 1
      break if guess == number || guesses_left == 0
    end
    display_result
  end

  private

  attr_writer :guess, :guesses_left

  def display_welcome_message
    puts "Welcome to the Guessing Game!"
  end

  def choose_number
    puts "You have #{guesses_left} guesses remaining."
    puts "Enter a number between 1 and 100:"
    loop do
      self.guess = gets.chomp.to_i
      break if range.include?(guess)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
  end

  def display_guess
    case guess <=> number
    when -1 then puts "Your guess is too low."
    when 0 then puts "That's the number!"
    when 1 then puts "Your guess is too high."
    end
  end

  def result
    guess == number ? "You won!" : "You have no more guesses. You lost!"
  end

  def display_result
    puts result
  end
end

game = GuessingGame.new
game.play
