class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

#class Pizza has an instance variable
#instance variables are preceded by @ symbol

#you can call .instance_variables on an object once it's been instantiated

pizza = Pizza.new('cheese')
fruit = Fruit.new('apple')

p pizza.instance_variables
p fruit.instance_variables