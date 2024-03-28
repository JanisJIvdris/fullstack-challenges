require_relative "croupier"

puts 'Card? "y" or "yes" to get a new card'
choice = gets.chomp
score = state_of_the_game
while choice == "y" || choice == "yes"
  score += player_score
  puts player_score
  puts score
end


# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
