=begin   
problem: complete the given class so that the test cases work as intended

input:
output:

notes:
  -add any methods or instance variables as needed
  -do not make implementation details public

algo:
  -create instance variable to store message
  -create horizontal rule
    -begins and ends with +
    -dashes are the length of the message plus 2
  -create empty line
    -begins and ends with |
    -spaces are the length of the message plus 2


=end

class Banner

  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * (@message.size + 2)}+"
  end

  def empty_line
    "|#{' ' * (@message.size + 2)}|"
  end

  def message_line
    "| #{@message} |"
  end
end




banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+