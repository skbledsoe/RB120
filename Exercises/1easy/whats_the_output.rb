=begin
prob: adjust the given code so that the @name instance variable is not permanently modified, but still returns the name in upcase when to_s is called

notes:

algo:


=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

