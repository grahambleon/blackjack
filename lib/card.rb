class Card
  attr_reader :suit, :rank, :value
  attr_accessor :ace_low
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @ace_low = false

    if @rank.to_s.include? 'K'
      @value = 10
    elsif @rank.to_s.include? 'Q'
      @value = 10
    elsif @rank.to_s.include? 'J'
      @value = 10
    elsif @rank.to_s.include? 'A'
      @value = 11
    else
      @value = @rank
    end
  end

  def card_id
    "#{@rank} #{@suit}"
  end
end
