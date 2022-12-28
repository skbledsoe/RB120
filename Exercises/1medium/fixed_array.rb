=begin
write a class that implements a fixed-length array and provides 
necessary methods for the code to run


FixedArray class
  takes an integer
  initializes array set to integer
  custom [] Class
  custom []= Class
  custom to_a
  custom to_s

=end
class FixedArray
  attr_reader :array

  def initialize(integer)
    @array = Array.new(integer)
  end

  def [](index)
    array.fetch(index)
  end

  def []=(index, value)
    array.fetch(index)
    array[index] = value
  end

  def to_a
    @array.to_a
  end

  def to_s
    to_a.to_s
  end
end


fixed_array = FixedArray.new(5)
# p fixed_array.to_a
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end