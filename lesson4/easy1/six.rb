class Cube
  attr_reader :volume  #added a getter method to access @volume

  def initialize(volume)
    @volume = volume
  end

  def get_vol  #could also add a custom getter method
    @volume
  end
end