require './Game'
require './Player'
require './Question'

while true
  puts "Choose a difficulty (easy, medium, hard):"
  difficulty = gets.chomp
  if ['easy', 'medium', 'hard'].include?(difficulty)
    game = Game.new(difficulty)
    game.start_game
  else 
    puts "Please choose a valid difficulty"
  end
end




