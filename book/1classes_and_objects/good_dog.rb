# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h 
#     @weight = w 
#   end

#   def self.what_am_i
#     "I'm a GoodDog class"
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h 
#     self.weight = w
#   end

#   def info 
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
# end

# # sparky = GoodDog.new("Sparky")
# # puts sparky.speak
# # puts sparky.name
# # sparky.name = "Spartacus"
# # puts sparky.name


# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

# p GoodDog.what_am_i

# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   puts self
# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n 
    self.age = a * DOG_YEARS
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years()
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.public_disclosure
# puts sparky