class Cat
  attr_reader :type
  
  def initialize(type)
    @type = type
  end

  def to_s    #custom to_s method to get a specific output
    "I am a #{type} cat"  #could use @type or add a getter method
  end
end

cat1 = Cat.new('tabby')
puts cat1