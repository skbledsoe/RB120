=begin

TODO
circular queue class takes an integer size
  size represents number of spaces in queue

enqueue method takes an integer and adds it to the queue
  if queue is size, remove 0 index and queue << integer
  queue << integer

dequeue method removes and returns oldest object
  shift on queue
  return nil if queue is empty


=end

class CircularQueue
  attr_reader :size, :queue

  def initialize(size)
    @size = size
    @queue = []
  end

  def enqueue(number)
    dequeue if queue.size == size
    queue << number
  end

  def dequeue
    return nil if queue.empty?
    queue.shift
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil