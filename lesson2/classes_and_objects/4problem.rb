class Person
  attr_accessor :first, :last

  def initialize(full)
    split = full.split
    @first = split.first
    @last = split.size > 1 ? split.last : ''
  end

  def name
    "#{first} #{last}".strip
  end

  def name=(full)
    split = full.split
    self.first = split.first
    self.last = split.size > 1 ? split.last : ''   
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first            # => 'Robert'
# p bob.last             # => ''
# bob.last = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Smith"
# p bob.first            # => 'John'
# p bob.last             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name