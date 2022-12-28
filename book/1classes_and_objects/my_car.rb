module Towable
  def can_tow?(pounds)
    pounds < 2000 
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def age
    puts "Your #{model} is #{years_old} years old."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas"
  end

  def speed_up(number)
    @speed += number
    puts "You've accelerated #{number} miles per hour."
  end

  def brake(number)
    @speed -= number
    puts "You've decelerated #{number} miles per hour."
  end

  def current_speed
    puts "You are going #{@speed} miles per hour"
  end

  def shut_down
    @speed = 0
    puts "Let's park."
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "You painted your car #{new_color}."
  end

  private

  def years_old
    Time.now.year - self.year.to_i
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
    "Your car is a #{@color} #{@year} #{@model}"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
  def to_s
    "Your truck is a #{@color} #{@year} #{@model}"
  end
end

my_car = MyCar.new(2014, 'blue', 'mazda 3')
my_truck = MyTruck.new('2010', 'white', 'Toyota Tacoma')
# mazda.speed_up(10)
# mazda.current_speed

# mazda.speed_up(15)
# mazda.current_speed

# mazda.brake(5)
# mazda.current_speed

# mazda.shut_down
# mazda.current_speed

# puts mazda.color
# puts mazda.year
# mazda.spray_paint('green')
# puts mazda.color

# MyCar.gas_mileage(13, 351)

# puts my_car
# puts my_truck
puts my_car.age
puts my_truck.age