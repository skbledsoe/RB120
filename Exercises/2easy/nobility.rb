module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble
  attr_reader :title

  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def name
    @title + ' ' + @name
  end

  private

  def gait
    "struts"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk

# puts byron.name
# puts byron.title
