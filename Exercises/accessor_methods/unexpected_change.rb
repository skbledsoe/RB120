#modify code to accept a string containing first and last name
#name should be split into two instance variables in setter method
#should then be joined together in getter method

class Person
  def name=(name)    #setter method (writer)
    @first, @last = name.split(' ')
  end

  def name    #getter method (reader)
    "#{@first} #{@last}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name