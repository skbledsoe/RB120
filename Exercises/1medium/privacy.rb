=begin
modify the class so flip_switch and setter method for switch are private.

=end


class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def get_switch
    @switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new

puts machine.get_switch