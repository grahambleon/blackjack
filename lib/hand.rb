require_relative "card"
require_relative "deck"

class Hand
attr_accessor :current_hand, :total

  def initialize(deck)
    @current_hand = []
    @deck = deck
    @total = 0

    2.times do
      new_card = @deck.cards.pop
      @current_hand << new_card
      @total += new_card.value
    end
  end
# Changed this bit from the earlier submission.  This way it checks the total
# everytime it goes through the each loop. Previously it would switch all ace values
# low even if doing it to one brought it below 21
  def hit
    new_card = @deck.cards.pop
    @current_hand << new_card
    @total += new_card.value
    puts "drew #{@current_hand[-1].card_id}"

    @current_hand.each do |card|
      if @total > 21
        if card.value == 11 && card.ace_low == false
          @total -= 10
          card.ace_low = true
        end
      end
    end
  end

  def check_hand
    @current_hand.each do |card|
      puts card.card_id
    end
    puts "Total: #{total}."
  end

  def show_hand
    @current_hand.each do |card|
      card.card_id
    end
  end
end
