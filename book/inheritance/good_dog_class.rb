# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n 
#   end

#   def speak
#     super + " from GoodDog Class!"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new
# puts sparky.speak
# puts paws.speak

module Walkable
  def walk 
    "I'm walking"
  end
end

module Swimmable
  def swim 
    "I'm swimming"
  end
end

module Climbable
  def climb 
    "I'm climbing"
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak"
  end
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "----GoodDog Method Lookup----"
puts GoodDog.ancestors

# puts "------Animal Method Lookup-------"
# puts Animal.ancestors

# fido = Animal.new
# puts fido.speak
# puts fido.walk