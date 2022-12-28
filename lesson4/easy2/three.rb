
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

#lookup chain for Orange and HotSauce

p Orange.ancestors
p HotSauce.ancestors