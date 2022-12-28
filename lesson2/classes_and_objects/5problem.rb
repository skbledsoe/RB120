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

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
puts "The person's name is #{bob}"