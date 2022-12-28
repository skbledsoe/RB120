=begin
create a Deck class that contains all standard 52 playing cards
use Card class from previous exercise (ranking_cards)

Deck class should provide a #draw method to deal one card
Deck should be shuffled when initialized
if out of cards, it should reset itself by generating new set of 52 cards

=end

class Deck
  attr_reader :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    new_deck
  end

  def draw
    new_deck if deck.empty?
    deck.shift
  end

  private

  attr_writer :deck

  def new_deck
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end
end



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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

