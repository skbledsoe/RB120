=begin

1. write a description of the problem and extract major nouns and verbs

  21 is a card game with a dealer and a player. participants try to get 
  as close to 21 as possible without going over.

  game overview:
    both participants are dealt 2 cards from a 52 card deck
    player takes first turn and can 'hit' or 'stay'
    player loses if busts. if stays, dealer's turn
    dealer hits until cards add to at least 17
    if dealer busts, player wins. if both stay, highest total wins.
    if totals are equal, it's a tie.

  nouns:
    card, player, dealer, participant, deck, game, total
    *total is an attribute within a class. it's not a noun that performs
    actions, but a property of another noun. think of it as
    calculate_total
  verbs:
    deal, hit, stay, busts
    *busts is not an action anyone is performing, but rather a state

2. write out classes and organize verbs

  Player
  -hit
  -stay
  -busted?
  -total

  Dealer
  -hit
  -stay
  -busted?
  -total
  -deal (could be here or in Deck)

  Participant
      *Player and Dealer both have redundant code, so could be extracted
      to a super class

  Deck
  -deal (could be here or in Dealer)

  Card

  Game
  -start

3. organize the verbs and nouns and do a spike of temporary code
  order of game play:
    deal cards
    show cards
    player turn
    dealer turn
    show result
=end

class Player
  def initialize; end

  def hit; end

  def stay; end

  def busted?; end

  def total; end
end

class Dealer
  def initialize; end

  def deal; end
  
  def hit; end

  def stay; end

  def busted?; end

  def total; end
end

class Participant

end

class Deck
  def initialize; end
end

class Card
  def initialize; end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start