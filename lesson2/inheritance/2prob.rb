class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end


class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end


class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end