module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

#Instantiate a class contained in a module by invoking:
truck1 = Transportation::Truck.new

puts truck1