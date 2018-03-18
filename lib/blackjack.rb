require_relative "card"
require_relative "deck"
require_relative "hand"

def dramatic_pause
  2.times do
    print "."
    sleep(1)
  end
  puts "."
  sleep(1)
end

def compare_hands(player, dealer)
  puts "Your total: #{player.total}\nDealer total: #{dealer.total}"
  if player.total > dealer.total
    puts "You win!  Congrats!"
  elsif player.total == dealer.total
    puts "Draw! You're both losers!"
  else
    puts "Dealer wins! GG noob!"
  end
end

stack = Deck.new
player = Hand.new(stack)
dealer = Hand.new(stack)

puts "Welcome to Blackjack! Here's your initial hand:"
player.check_hand

print "The dealers face up card is: #{dealer.current_hand[0].card_id}"

players_turn = true
dealers_turn = false

while players_turn

  if player.total < 21
    print "\nWould you like to hit or stay? (Enter 'H' or 'S'): "
    choice = gets.chomp

    if choice.downcase == 'h'
      print "\nYou "
      player.hit
      puts "Your hand is now:"
      player.check_hand
    elsif choice.downcase == 's'
      players_turn = false
      dealers_turn = true
      print "\nOk now it's the dealer's turn!\nThe dealer draws"
      dramatic_pause
    else
      print "\nI don't understand.. "
    end

  elsif player.total == 21
    puts "You got a blackjack!"
    players_turn = false
    dealers_turn = true
    print "\nOk now it's the dealer's turn!\nThe dealer draws"
    dramatic_pause
  else
    puts "You bust!  GG noob!"
    players_turn = false
    dealers_turn = false
  end
end

while dealers_turn
  if dealer.total <= 17
    print "Thinking"
    dramatic_pause
    puts "The dealer decides to hit!"
    print "The dealer "
    dealer.hit
  elsif dealer.total > 21
    dealer.check_hand
    puts "\nDealer bust!\nYou win!"
    dealers_turn = false
  else
    puts "Thinking"
    dramatic_pause
    puts "The dealer decides to stay!"
    dealer.show_hand
    compare_hands(player, dealer)
    dealers_turn = false
  end
end
