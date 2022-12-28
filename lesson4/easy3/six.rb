class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1  #use @age rather than self.age, as self is referencing setter method
  end
end

lily = Cat.new('tabby')
puts lily.age
lily.make_one_year_older
puts lily.age