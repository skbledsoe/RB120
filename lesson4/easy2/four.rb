class BeesWax
  attr_accessor :type   #added to simplify the code

  def initialize(type)
    @type = type
  end

  # def type    #removed custom getter and setter methods
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end