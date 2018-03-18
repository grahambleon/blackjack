require_relative "card"

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

attr_accessor :cards

  def initialize
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
    end
    @cards = deck.shuffle
  end
end
