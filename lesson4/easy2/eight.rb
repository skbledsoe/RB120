class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game   #added < Game to allow Bingo to inherit from Game
  def rules_of_play
    #rules of play
  end
end