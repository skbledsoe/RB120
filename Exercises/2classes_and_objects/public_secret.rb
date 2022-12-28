=begin
  -create a class Person
  -create an instance variable @secret
  -use setter method to add value to @secret
  -use getter method to print @secret
=end

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret