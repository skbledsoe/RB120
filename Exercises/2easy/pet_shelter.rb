=begin
prob: create classes and methods that will match the required output when run

notes:
  -store pet names in an array, iterate to access each when needed


algo:
  Pet class
    type and name states

  Owner class
    name state
    container for pets
    number of pets method returns size of pets container

  Shelter class
    container for owner and adopted pets
    adopt method takes owner and pet
    print adoptions prints owners name and list of pets

  
=end
class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

end

class Shelter
  attr_reader :adoptions

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    owner.pets << pet
    adoptions[owner.name] = owner.pets ||= adoptions[owner.name]
  end

  def print_adoptions
    adoptions.each_pair do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      puts pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."