=begin
use previous Card and Deck classes to create and eval poker hands
create class PokerHand that takes 5 cards from a deck and evaluates



=end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

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
  
  def convert_value
    @rank = value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_reader :full_deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    new_deck
  end

  def draw
    new_deck if full_deck.empty?
    full_deck.shift
  end

  private

  attr_writer :full_deck

  def new_deck
    @full_deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        full_deck << Card.new(rank, suit)
      end
    end
    full_deck.shuffle!
  end
end

class PokerHand
  attr_reader :hand, :deck

  def initialize(deck)
    @deck = deck
    @hand = new_hand
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def new_hand
    @hand = []
    if deck.instance_of? Deck
      5.times { hand << deck.full_deck.sample}
    else
      @hand = deck.sort
    end
    hand
  end

  def count_suits
    count = 1
    idx = 1
    hand.each do |card|
      break if idx == hand.size
      count += 1 if card.suit == hand[idx].suit
      idx += 1
    end
    count
  end

  def count_ranks
    counts = []
    ranks = hand.map { |card| card.convert_value }
    ranks.each do |rank|
      next if counts.last == ranks.count(rank)
      counts << ranks.count(rank)
    end
    counts
  end

  def consecutive?
    ranks = hand.map { |card| card.convert_value }
    ranks == (ranks.min..ranks.max).to_a
  end

  def royal_flush?
    count_suits == 5 && consecutive? && hand[0].rank == 10
  end

  def straight_flush?
    count_suits == 5 && consecutive?
  end

  def four_of_a_kind?
    count_ranks.max == 4
  end

  def full_house?
    count_ranks.sort == [2, 3]
  end

  def flush?
    count_suits == 5
  end

  def straight?
    consecutive?
  end

  def three_of_a_kind?
    count_ranks.max == 3
  end

  def two_pair?
    #2 cards of one rank and 2 of another rank
    count_ranks.count(2) == 2
  end

  def pair?
    count_ranks.count(2) == 1
  end
end


#############################################################
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# # Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'