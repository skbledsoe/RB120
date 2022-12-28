=begin
Update the given class to determine the lowest and highest ranking cards
  in an Array of Card objects

suits play no part in worth of cards
numeric cards are low (2-10)
jack < queen < king < ace

if there are two or more cards of the same rank in the list, the min and
  max methods should return only one of the matching cards


set VALUES hash with keys as ranks and values as value of rank

create a to_s method that returns a string representation
  of the card ("Jack of Diamonds", "4 of Clubs", etc)

min method returns card object of minimum value


sorted_cards
  iterate through array of cards and sort by rank
  access value of rank from VALUES
  
=end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = {'Jack'=> 11, 'Queen'=> 12, 'King'=> 13, 'Ace'=> 14}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end


cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards                    #2 of hearts, 10 of diamonds, ace of clubs
puts cards.min == Card.new(2, 'Hearts')     #true
puts cards.max == Card.new('Ace', 'Clubs')  #true

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')     #true
puts cards.max == Card.new(5, 'Hearts')     #true

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4                    #true
puts cards.max == Card.new(10, 'Clubs')     #true

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')   #true
puts cards.max.rank == 'Jack'               #true

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8                    #true
puts cards.max.rank == 8                    #true

