class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play   #this method will be executed rather than the one in Game class
    "Start bingo!"
  end
end