=begin
fill in implementation of the initialize methods so that:
-graduate students have access to parking but undergrads do not
  -both students have a name and year associated with them


=end



class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student; end