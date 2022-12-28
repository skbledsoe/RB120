=begin
RPS is a game where each player chooses rock, player, or scissors.
the choices are compared and someone is declared a winner.

TO DO
  create a Move class
    < and > methods to compare moves
  keep score
    via class or state?
  add lizard and spock
  keep track of move history
    either a hash or an array
  add computer personalities
=end

class Player
  attr_reader :choices, :type, :name
  attr_accessor :move

  def initialize(type)
    @type = type
    @choices = ['rock', 'paper', 'scissors']
  end

  def name=(n)
    @name = n.capitalize
  end

  def choose_move
    if type == :human
      puts "Dear #{name}, please choose rock, paper, or scissors:"
      loop do
        self.move = gets.chomp.downcase
        break if valid_input?(move)
        puts "Silly human. Please choose rock, paper, or scissors:"
      end
    else
      self.move = choices.sample
    end
  end

  def valid_input?(input)
    choices.include?(input)
  end
end

class RPSGame
  attr_reader :player, :computer

  def initialize
    @player = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to RPS!"
    puts "What is your name, human?"
    input = gets.chomp
    player.name = input
    computer.name = ['Wall-e', 'Alexa', 'Bixby', 'Eve'].sample
  end

  def human_wins
    computer.move == 'rock' && player.move == 'paper' ||
      computer.move == 'paper' && player.move == 'scissors' ||
      computer.move == 'scissors' && player.move == 'rock'
  end

  def computer_wins
    player.move == 'rock' && computer.move == 'paper' ||
      player.move == 'paper' && computer.move == 'scissors' ||
      player.move == 'scissors' && computer.move == 'rock'
  end

  def compare_moves
    if computer_wins
      computer
    elsif human_wins
      player
    else
      'tie'
    end
  end

  def display_moves
    puts "You chose #{player.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    display_moves
    case compare_moves
    when computer then puts "#{computer.name} won!"
    when player then puts "You won, #{player.name}!"
    when 'tie' then puts "It's a tie!"
    end
  end

  def play_again?
    puts "Do you want to play again?"
    loop do
      input = gets.chomp.downcase
      return true if input.start_with?('y')
      return false if input.start_with?('n')
      puts "Please enter yes or no."
    end
  end

  def display_goodbye_message
    puts "Thanks for playing, #{player.name}! #{computer.name} will miss you!"
  end

  def play
    display_welcome_message
    loop do
      player.choose_move
      computer.choose_move
      compare_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
