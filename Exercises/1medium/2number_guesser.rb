=begin

guessing game class takes two numbers that represent custom range
number of guesses changes depending on given range



=end


class GuessingGame
  attr_reader :guesses_left, :number, :guess, :range, :low, :high

  def initialize(low, high)
    @guesses_left = Math.log2((high - low)).to_i + 1
    @range = (low..high).to_a
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
    puts "Enter a number between #{range[0]} and #{range[-1]}:"
    loop do
      self.guess = gets.chomp.to_i
      break if range.include?(guess)
      puts "Invalid guess. Enter a number between #{range[0]} and #{range[-1]}:"
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

game = GuessingGame.new(501, 1500)
game.play
