class Person
  attr_accessor :first_name
  attr_accessor :last_name
  
  def initialize(name)
    split_name = name.split
    @first_name = split_name.first
    @last_name = split_name.size > 1 ? split_name.last : ''
  end

  def name
    first_name + ' ' + last_name
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'