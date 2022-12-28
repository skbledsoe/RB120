class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
puts trip.predict_the_future
#the output will be the string 'you will' along with a string from
#the RoadTrip choices chosen randomly. the choices method within 
#RoadTrip will be executed rather than the choices method from Oracle