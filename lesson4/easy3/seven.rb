class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information 
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

#return keyword does not add value, as last line executed is always returned.