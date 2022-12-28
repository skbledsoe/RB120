class Cat
  @@cats_count = 0  #class variable that will keep track of instances

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1  #increased by 1 each time a new object is instantiated
    #puts @@cats_count    #could print the value this way to test it
  end

  def self.cats_count  #class method accesses the class variable to display it
    @@cats_count
  end
end

#display the value of the class variable
Cat.cats_count