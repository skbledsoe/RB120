class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count  #self refers to the Cat class. this is a class method.
    @@cats_count
  end
end