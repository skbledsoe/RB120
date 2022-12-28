=begin
prob: build an oop tic-tac-toe game

notes:
  -write a description of the problem and extract major nouns and verbs
  -make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code
  -optional - model thoughts into CRC cards

description:
  2-player board game played on a 3x3 grid. players take turns marking a square. the first player to mark 3 squares in a row wins.

nouns:
  board, player, square, grid
verbs:
  play, mark

  Board
  Square
  Player
  - mark
  - play

=end
# require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count('X')
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count('O')
  end

  def winning_marker
    WINNING_LINES.each do |line|
      return 'X' if count_human_marker(@squares.values_at(*line)) == 3
      return 'O' if count_computer_marker(@squares.values_at(*line)) == 3
    end
  end

  def reset
    # {1=>Square.new(' '), 2=>Square.new(' '), 3=>Square.new(' ')}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def clear
    system 'clear'
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_board
    puts "You're #{human.marker}. Computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_display_board
    board.clear
    display_board
  end

  def human_moves
    puts "Choose a square between #{board.unmarked_keys.join(', ')}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, invalid choice."
    end

    board[square]= human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample]= computer.marker
  end

  def display_result
    clear_screen_display_board
    
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Invalid choice, please enter y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear_screen_display_board
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play
    display_welcome_message

    loop do
      display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?
        clear_screen_display_board
      end

      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play